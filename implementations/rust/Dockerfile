
FROM chakibmed/gmp:latest as compiler
LABEL Name=rust Version=0.0.1
ADD pidigits.rs .
RUN apt-get -y update && apt-get -y install rustc 
#RUN rustc  pidigits.rs -o pidigits
RUN rustc  pidigits.rs -C opt-level=1 -o pidigits
#RUN rustc  pidigits.rs -C opt-level=2 -o pidigits
#RUN rustc  pidigits.rs -C opt-level=3 -o pidigits
FROM chakibmed/powerapi:latest
COPY --from=compiler  pidigits . 


ENTRYPOINT ["./analyse.sh" , "./pidigits" ]
CMD [ "1000" ] 