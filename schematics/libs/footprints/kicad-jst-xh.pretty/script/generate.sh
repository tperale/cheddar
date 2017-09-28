#!/usr/bin/env bash
for i in {2..18} 20
do
    bash create_3d.sh $i
    python create_footprint.py $i
done
