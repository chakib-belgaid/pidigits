
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

for i in ${l[@]} 
do  
    ss=${i:10} 
    ss=${ss/:/.} # replace : by . 
    ss=${ss/_/.} # replace _ by . 
    for j in {1..3}
    do
        for k in {1..10}  
        do  
        docker run $i ${j}0000 >> "$ss.${j}0000.power"
      #  echo $i - ${j}0000
        done
    done
done  
#for i in $(docker images --format"={{.Repository}}:{{.Tag}}" | egrep chakibmed/pidigits*) ; do docker push  $i ; done 

