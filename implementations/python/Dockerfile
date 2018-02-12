
FROM chakibmed/powerapi:latest
RUN apt-get -y update 
RUN apt-get -y install python3-minimal 
RUN apt-get -y install python3-gmpy2
LABEL Name=python Version=0.0.1
ADD pidigits.py .
ENTRYPOINT ["./analyse.sh","python3","pidigits.py"]
CMD ["1000"]
