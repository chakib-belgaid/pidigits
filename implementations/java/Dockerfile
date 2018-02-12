FROM openjdk:8-jdk-stretch as compiler
LABEL Name=java Version=0.0.1
ADD pidigits.java .
RUN apt-get -y update
RUN javac pidigits.java  
RUN ls 
FROM chakibmed/powerapi:latest
COPY --from=compiler  "*.class" ./ 


ENTRYPOINT ["./analyse.sh","java", "pidigits" ]
CMD [ "1000" ] 