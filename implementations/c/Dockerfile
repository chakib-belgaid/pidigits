FROM chakibmed/gmp:latest as compiler
LABEL Name=c Version=0.0.1
ADD pidigits.c .
RUN apt-get -y update && apt-get -y install gcc
RUN gcc -lgmp pidigits.c -o pidigitc
FROM chakibmed/powerapi:latest
COPY --from=compiler  pidigitc . 


ENTRYPOINT [ "./analyse.sh","./pidigitc" ]
CMD [ "1000" ] 
