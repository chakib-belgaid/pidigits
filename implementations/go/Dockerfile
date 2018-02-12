
#build stage
FROM chakibmed/gmp:latest as builder
WORKDIR /go/src/app
RUN apt-get -y update && apt-get -y install golang-go 
RUN apt-get install -y gccgo-go
COPY pidigits.go /go/src/app/
RUN go build -o pidigits

#final stage
FROM chakibmed/powerapi:latest
LABEL Name=go Version=0.0.1
COPY --from=builder /go/src/app/pidigits .
COPY --from=builder "/usr/local/lib64/libgo*" /usr/lib/

ENTRYPOINT [ "./analyse.sh","./pidigits" ]
CMD [ "1000" ]