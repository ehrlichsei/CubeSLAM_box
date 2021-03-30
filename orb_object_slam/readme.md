# how to run orb_object_slam for living room

## change the code
in tracking.cc 
change the text around line 1587

char frame_index_c_line[256];
sprintf(frame_index_c_line, "%d", (int)pKF->mnFrameId); // format into 6 digit
char frame_index_c_yolo[256];
sprintf(frame_index_c_yolo, "%d", (int)pKF->mnFrameId); // format into 4 digit

sprintf(obj_2d_txt_postfix, "_yolov3_%.2f.txt", obj_det_2d_thre);
//sprintf(obj_2d_txt_postfix, "_3d_cuboids.txt"); -->

### some specific for living room
optimizer.cc
// #define ObjectFixScale

vObject->whether_fixrollpitch = false; // only rotate along object z axis.
point_object_threshold 是什么
1232 是如何optimize的？
e->max_outside_margin_ratio = 1;
// set up point-object 3d association


## preparation and compile 

cd /home/yuli/Software/cubeslam_ws
catkin_make
source /home/yuli/Software/cubeslam_ws/devel/setup.bash

there are two ways to run the SLAM: rosrun or roslaunch
## run by rosrun
run the mono-SLAM node
```
rosrun orb_object_slam ros_mono /home/yuli/Software/cubeslam_ws/src/cube_slam/orb_object_slam/Vocabulary/ORBvoc.txt /home/yuli/Software/cubeslam_ws/src/cube_slam/orb_object_slam/Examples/Monocular/ICL.yaml
```

## run by roslaunch

```
roslaunch orb_object_slam object_livingroom.launch
```
## run rosbag

run the imagie rosbag
according to the situation, whether to change the topic of the rosbag
```
rosbag play '/home/yuli/Software/data/data_rosbag/living_room.bag' /camera/image:=/camera/image_raw 
```

or 
```
rosbag play '/home/yuli/Software/data/data_rosbag/living_room_complete.bag' /camera/image:=/camera/image_raw 
```



## run by roslaunch

roslaunch orb_object_slam object_kitti.launch

rosbag play '/home/yuli/Software/data_rgbd/6_kitti_seq09/kitti_seq09.bag' kitti/left/image_raw:=/camera/image_raw --clock -r 0.5

roslaunch orb_object_slam object_monitor.launch
rosbag play '/home/yuli/Software/data_rgbd/17_monitor_front/reedit_front.bag' /camera/color/image_raw:=/camera/image_raw --clock -r 2


## runing offline
in Tracking_util.cc
change line 43

	pred_frame_obj_txts = base_data_folder + "/pred_3d_obj_matched_txt/" + frame_index_c + "_yolov3_0.15.txt";
		if (use_truth_trackid)
			pred_frame_obj_txts = base_data_folder + "/pred_3d_obj_matched_tracked_txt/" + frame_index_c + "_3d_cuboids.txt";

unsigned int final_object_record_frame_ind = 1100; // for kitti seq 07 

change the object_kitti.launch file
