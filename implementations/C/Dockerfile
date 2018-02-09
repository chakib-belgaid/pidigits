
FROM chakibmed/gmp:latest
LABEL Name=c Version=0.0.1
ADD pidigits.c .
RUN apt-get -y update && apt-get -y install gcc
RUN gcc -lgmp pidigits.c
ENTRYPOINT [ "./a.out" ] 
