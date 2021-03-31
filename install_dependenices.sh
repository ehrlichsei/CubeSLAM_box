#!/bin/bash

echo "Configuring and building object_slam/Thirdparty/g2o ..."
cd object_slam/Thirdparty/g2o
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j2
cd ../../../..

echo "Configuring and building orb_object_slam/Thirdparty/g2o ..."
cd orb_object_slam/Thirdparty/g2o
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j2
cd ../../../..

echo "Configuring and building orb_object_slam/Thirdparty/DBoW2 ..."
cd orb_object_slam/Thirdparty/DBoW2
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j2
cd ../../../..

echo "Uncompress vocabulary ..."

cd orb_object_slam/Vocabulary
tar -xf ORBvoc.txt.tar.gz
cd ..
