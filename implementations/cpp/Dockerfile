FROM chakibmed/gmp:latest as compiler
LABEL Name=cpp Version=0.0.1
ADD pidigits.cpp .
#RUN apt-get -y update && apt-get -y install g++

RUN g++  -c  pidigits.cpp -o pidigits.o 
RUN g++ -lgmp -lgmpxx pidigits.o -o pidigits
#
#RUN g++ -O1  -c  pidigits.cpp -o pidigits.o 
#RUN g++ -lgmp -O1 -lgmpxx pidigits.o -o pidigits
#
#RUN g++ -O2  -c  pidigits.cpp -o pidigits.o 
#RUN g++ -lgmp -O2 -lgmpxx pidigits.o -o pidigits
#
#RUN g++ -O3  -c  pidigits.cpp -o pidigits.o 
#RUN g++ -lgmp -O3 -lgmpxx pidigits.o -o pidigits 

RUN rm -f pidigits.o
FROM chakibmed/powerapi:latest
COPY --from=compiler  pidigits .
COPY --from=compiler .libs  /usr/lib/
COPY --from=compiler /usr/lib  /usr/lib/

ENTRYPOINT [ "./analyse.sh","./pidigits" ]
CMD [ "1000" ] 
