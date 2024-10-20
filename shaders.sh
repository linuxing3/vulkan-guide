#/usr/bin/env bash

for ext in comp vert frag
  do
    for file in `ls shaders/*.$ext`
    do 
      glslangValidator -V $file -o $file.spv 
    done
  done

