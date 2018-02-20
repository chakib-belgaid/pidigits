#!/bin/bash

l=( 
chakibmed/pidigits_cpp:o1 \
chakibmed/pidigits_cpp:o2 \
chakibmed/pidigits_cpp:o3 \
chakibmed/pidigits_cpp:latest \
chakibmed/pidigits_c:o1 \
chakibmed/pidigits_c:o2 \
chakibmed/pidigits_c:o3 \
chakibmed/pidigits_c:latest \
chakibmed/pidigits_java:latest \
chakibmed/pidigits_rust:latest \
chakibmed/pidigits_rust:o1 \
chakibmed/pidigits_rust:o2 \
chakibmed/pidigits_rust:o3 \
chakibmed/pidigits_go:latest \
chakibmed/pidigits_python:latest \
)

for i in ${l[@]} #programming language  
do  
    ss=${i:10} 
    ss=${ss/:/.} # replace : by . 
    ss=${ss/_/.} # replace _ by . 
    p=10000
    
    for ((i0=0; i0 < $1 ;i0++)) # we proceed with a step of 5000 starting with 10000 $1 is the number of iterations 
    do 
        k=1
        for i1 in {0..5} #2^x loops inside the program
        do
            for l in {1..10} # instaces of the program ( just to be sure we have the right value )   
            do  
            docker run $i $p $k >> "$ss.$p.$k.power" #<algo>.<language>.<compilflag>.<param>.<inerloop>.power
            #echo $i0 $p $k $l ;
            #echo $i - ${j}0000
            done
            k=$((k*2))
        done
        p=$((p+5000))
    done 
done  
#for i in $(docker images --format"={{.Repository}}:{{.Tag}}" | egrep chakibmed/pidigits*) ; do docker push  $i ; done 

