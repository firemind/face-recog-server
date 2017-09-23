#!/bin/bash
export PYTHONPATH=~/git/facenet/src
path=$(realpath $1)
python ~/git/facenet/src/classify.py $path ~/models/facenet/20170923-203144/ ~/git/facenet/mymodel.pkl --image_size=182
