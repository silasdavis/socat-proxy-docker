from ubuntu:14.10

# Create pipe to loop back response from destination back to proxy
RUN mkfifo resp

ADD lazy-nc /usr/bin/lazy-nc

# Listen without forever on $PORT waiting for at least some input before 
# intiating connection (via lazy-nc). Each time the connection is terminated
# wait for a new one.
CMD while true; do nc -l -p $PORT 0<resp | lazy-nc $TARGET $PORT 1>resp; done
