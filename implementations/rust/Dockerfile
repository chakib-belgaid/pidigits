
FROM chakibmed/gmp:latest as compiler
LABEL Name=rust Version=0.0.1
ADD pidigits.rs .
RUN apt-get -y update && apt-get -y install rustc 
RUN rustc  pidigits.rs -o pidigitc
FROM chakibmed/powerapi:latest
COPY --from=compiler  pidigitc . 


ENTRYPOINT ["./analyse.sh" , "./pidigitc" ]
CMD [ "1000" ] 