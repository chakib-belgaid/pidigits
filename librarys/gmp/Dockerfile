
FROM gcc:7.3.0
LABEL Name=gmp Version=0.0.1
ADD  . .
RUN apt-get -y update 
RUN ./configure --enable-cxx
RUN make 
RUN make check
RUN make install
RUN ldconfig 
