from ubuntu:14.10

# Create pipe to loop back response from destination back to proxy
RUN mkfifo resp

# Listen without hanging up pipe input to host and response back to input
CMD nc -lk -p $PORT 0<resp | nc $TARGET $PORT 1>resp
