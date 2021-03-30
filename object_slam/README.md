# runing the object_slam, circling around the object

## dataset
1. cabinet
2. tv_monitor
## options
1. with/without truth path

## offline

camera poses and detected_cuboids_saved are coorsponded.
when running offline, the cam pose is default as output_cam_poses.txt
truth pose lines should be same to pic frame number
# preparation
1. change the base_folder to dataset folder in roslaunch
/home/yuli/Software/data_rgbd/16_tv_monitor
/home/yuli/Software/data_rgbd/17_monitor_front
/home/yuli/Software/data_rgbd/5_cabinet

2. change camera intrinsic parameter 

3. compile and source
cd /home/yuli/Software/cubeslam_ws
catkin_make
source /home/yuli/Software/cubeslam_ws/devel/setup.bash

# run 
roslaunch object_slam object_slam_example.launch 

