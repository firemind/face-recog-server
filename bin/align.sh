#!/bin/bash
export PYTHONPATH=~/git/facenet/src
python ~/git/facenet/src/align/align_dataset_mtcnn.py $1 $2 --image_size 182 --margin 44
