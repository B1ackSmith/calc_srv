//
// calc_srv.cpp
// Based on async_tcp_echo_server.cpp
// ~~~~~~~~~~~~~~~~~~~~~~~~~
//
// Copyright (c) 2003-2017 Christopher M. Kohlhoff (chris at kohlhoff dot com)
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
//

#include <cstdlib>
#include <iostream>
#include <boost/bind.hpp>
#include <boost/asio.hpp>

// Added by Vladimir Kovalev
#include <boost/regex.hpp>
#include <boost/lexical_cast.hpp>

using boost::asio::ip::tcp;

class session
{
public:
  session(boost::asio::io_context& io_context)
    : socket_(io_context)
  {
      finish = false;
      memset(data_, 0, max_length/sizeof(char));
  }

  tcp::socket& socket()
  {
    return socket_;
  }

  void start()
  {
    socket_.async_read_some(boost::asio::buffer(data_, max_length),
        boost::bind(&session::handle_read, this,
          boost::asio::placeholders::error,
          boost::asio::placeholders::bytes_transferred));
  }

private:
  void handle_read(const boost::system::error_code& error,
      size_t bytes_transferred)
  {
    if (error)
    {
     delete this;
     return;
    }

    std::string err_msg;
    
    data_[bytes_transferred] = '\0';

    if (need_quit(data_))
    {
        err_msg = "Good bye !\n";
        finish = true;
    }
     else if (need_calc(data_))
	  {
    		if (need_fact(data_))
		{
		    std::cerr << "handle read: have to calculate a factorial" << std::endl;
    		    sprintf( data_, "Operation result: %.0Lf \n", calc_fact(data_));
		}
		else 
		{
    		    err_msg = "Sorry. This operation does't ready yet !\n";
		}
    	  }
      else
      {
    	    err_msg = "Unknown command received !\n";
      }      

    if ( err_msg.size() > 0 )
    {
    	    std::cerr << "handle read: " << err_msg << std::endl;
    	    strcpy(data_, err_msg.c_str());
    }
      
    bytes_transferred = strlen(data_);

      
    boost::asio::async_write(socket_,
          boost::asio::buffer(data_, bytes_transferred),
          boost::bind(&session::handle_write, this,
            boost::asio::placeholders::error));

////      memset(data_, 0, max_length/sizeof(char));
  }

  void handle_write(const boost::system::error_code& error)
  {
    if (error || finish)
    {
      delete this;
      return;
    }

     socket_.async_read_some(boost::asio::buffer(data_, max_length),
          boost::bind(&session::handle_read, this,
            boost::asio::placeholders::error,
            boost::asio::placeholders::bytes_transferred));

  }

  bool need_quit(const char* input_data)
  {
	if ( *input_data == '\0' ) return false;
	
	static const boost::regex e("\\s*quit\\s*\r?\n?|\\s*logout\\s*\r?\n?");
        return boost::regex_match(input_data, e);
  }

  bool need_calc(const char* input_data)
  {
	if ( *input_data == '\0' ) return false;

	static const boost::regex e("^\\s*calc\\s*(\\d+!|\\d+[+-]\\d+)*\\s*\r?\n?");
        return boost::regex_match(input_data, e);
  }

  bool need_fact(const char* input_data)
  {
	if ( *input_data == '\0' ) return false;

	static const boost::regex e("^calc\\s+\\d+!\\s*\r?\n?");
        return boost::regex_match(input_data, e);
  }
  
  long double fact(int N)
  {
    if (N < 0)
        return 0.0;
    if (N == 0)
        return 1.0;
    else
        return N * fact(N - 1); // делаем рекурсию.
  }
  
  long double calc_fact(const char* input_data)
  {
	if ( *input_data == '\0' ) return 0.0;

	static const boost::regex e("^calc\\s+(\\d+)!\\s*\r?\n?");
	boost::cmatch value;
	boost::regex_match(input_data, value, e);
	return fact(boost::lexical_cast<int>(value[1]));
  }
                                          
  tcp::socket socket_;
  enum { max_length = 1024 };
  char data_[max_length];
  bool finish;
};

class server
{
public:
  server(boost::asio::io_context& io_context, short port)
    : io_context_(io_context),
      acceptor_(io_context, tcp::endpoint(tcp::v4(), port))
  {
    start_accept();
  }

private:
  void start_accept()
  {
    session* new_session = new session(io_context_);
    acceptor_.async_accept(new_session->socket(),
        boost::bind(&server::handle_accept, this, new_session,
          boost::asio::placeholders::error));
  }

  void handle_accept(session* new_session,
      const boost::system::error_code& error)
  {
    if (!error)
    {
      new_session->start();
    }
    else
    {
      delete new_session;
    }

    start_accept();
  }

  boost::asio::io_context& io_context_;
  tcp::acceptor acceptor_;
};

int main(int argc, char* argv[])
{
  try
  {
    if (argc != 2)
    {
      std::cerr << "Usage: async_tcp_echo_server <port>\n";
      return 1;
    }

    boost::asio::io_context io_context;

    using namespace std; // For atoi.
    server s(io_context, atoi(argv[1]));

    io_context.run();
  }
  catch (std::exception& e)
  {
    std::cerr << "Exception: " << e.what() << "\n";
  }

  return 0;
}
