#include <iostream>
#include <ros/ros.h>
#include <math.h>
#include <visualization_msgs/Marker.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/ModelCoefficients.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/filters/passthrough.h>
#include <pcl/features/normal_3d.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/visualization/cloud_viewer.h>
#include "pcl/point_cloud.h"
#include "tf2_ros/transform_listener.h"
#include "tf2_geometry_msgs/tf2_geometry_msgs.h"
#include "geometry_msgs/PointStamped.h"
#include <task3/CylinderLocation.h>
#include <time.h>

tf2_ros::Buffer tf2_buffer;

typedef pcl::PointXYZ PointT;

int ctr = 0;
int flg = 0;
int found = 0;
float x = -1.0f;
float y = -1.0f;
float z = -1.0f;
float x_a = -1.0f;
float y_a = -1.0f;
float z_a = -1.0f;

// const int CYLINDER_PTS_THRESHOLD = 16000;

bool toggle(task3::CylinderLocation::Request  &req, task3::CylinderLocation::Response &res) {

    res.found = found;
    res.x = x;
    res.y = y;
    res.z = z;
    res.x_a = x_a;
    res.y_a = y_a;
    res.z_a = z_a;

    flg = req.flg;

    if(req.flg == 0) {
        found = 0;
    }

    return true;
}

void cloud_cb (const pcl::PCLPointCloud2ConstPtr& cloud_blob) {

    // Return if the service hasn't been activated
    if(flg == 0) {
        return;
    }
  
    //// std::cerr << "Started working" << std::endl;

    // All the objects needed
    ros::Time time_rec, time_test;
    time_rec = ros::Time::now();
  
    pcl::PassThrough<PointT> pass;
    pcl::NormalEstimation<PointT, pcl::Normal> ne;
    pcl::SACSegmentationFromNormals<PointT, pcl::Normal> seg; 
    pcl::ExtractIndices<PointT> extract;
    pcl::ExtractIndices<pcl::Normal> extract_normals;
    pcl::search::KdTree<PointT>::Ptr tree (new pcl::search::KdTree<PointT> ());
    Eigen::Vector4f centroid;
    // Eigen::Vector3f centroid_tmp;

    // Datasets
    pcl::PointCloud<PointT>::Ptr cloud (new pcl::PointCloud<PointT>);
    pcl::PointCloud<PointT>::Ptr cloud_filtered (new pcl::PointCloud<PointT>);
    pcl::PointCloud<pcl::Normal>::Ptr cloud_normals (new pcl::PointCloud<pcl::Normal>);
    pcl::PointCloud<PointT>::Ptr cloud_filtered2 (new pcl::PointCloud<PointT>);
    pcl::PointCloud<pcl::Normal>::Ptr cloud_normals2 (new pcl::PointCloud<pcl::Normal>);
    pcl::ModelCoefficients::Ptr coefficients_plane (new pcl::ModelCoefficients), coefficients_cylinder (new pcl::ModelCoefficients);
    pcl::PointIndices::Ptr inliers_plane (new pcl::PointIndices), inliers_cylinder (new pcl::PointIndices);
    // pcl::RangeImage::Ptr range_image_ptr(new pcl::RangeImage);
    // pcl::RangeImage& range_image = *range_image_ptr; 
  
    // Read in the cloud data
    pcl::fromPCLPointCloud2 (*cloud_blob, *cloud);
    // std::cerr << "PointCloud has: " << cloud->points.size () << " data points." << std::endl;

    // Build a passthrough filter to remove spurious NaNs
    // Removes values on the z axis that are outside 0 and 1.5m range
    pass.setInputCloud (cloud);
    pass.setFilterFieldName ("z");
    pass.setFilterLimits (0, 1.5);
    pass.filter (*cloud_filtered);
    std::cerr << "PointCloud after filtering has: " << cloud_filtered->points.size () << " data points." << std::endl;

    // Estimate point normals
    // The larger the K-search, the more distorted are the point normals on edges (cup edge), but that issue is not a problem for our case
    ne.setSearchMethod (tree);
    ne.setInputCloud (cloud_filtered);
    ne.setKSearch (20);
    ne.compute (*cloud_normals);

    // Create the segmentation object for the planar model and set all the parameters
    seg.setOptimizeCoefficients (true);
    seg.setModelType (pcl::SACMODEL_NORMAL_PLANE);
    seg.setNormalDistanceWeight (0.1);
    seg.setMethodType (pcl::SAC_RANSAC);
    seg.setMaxIterations (100);
    seg.setDistanceThreshold (0.03);
    seg.setInputCloud (cloud_filtered);
    seg.setInputNormals (cloud_normals);

    // Obtain the plane inliers and coefficients
    seg.segment (*inliers_plane, *coefficients_plane);
    // std::cerr << "Plane coefficients: " << *coefficients_plane << std::endl;

    // Extract the planar inliers from the input cloud
    extract.setInputCloud (cloud_filtered);
    extract.setIndices (inliers_plane);
    extract.setNegative (false);

    // Write the planar inliers to disk
    // pcl::PointCloud<PointT>::Ptr cloud_plane (new pcl::PointCloud<PointT> ());
    // extract.filter (*cloud_plane);
    // std::cerr << "PointCloud representing the planar component: " << cloud_plane->points.size () << " data points." << std::endl;
  
    // pcl::PCLPointCloud2 outcloud_plane;
    // pcl::toPCLPointCloud2 (*cloud_plane, outcloud_plane);
    // pubx.publish (outcloud_plane);

    // Remove the planar inliers, extract the rest
    extract.setNegative (true);
    extract.filter (*cloud_filtered2);
    extract_normals.setNegative (true);
    extract_normals.setInputCloud (cloud_normals);
    extract_normals.setIndices (inliers_plane);
    extract_normals.filter (*cloud_normals2);
    std::cerr << "PointCloud after planer emoval has: " << cloud_filtered2->points.size () << " data points." << std::endl;

    // Create the segmentation object for cylinder segmentation and set all the parameters
    // TODO: Less iterations
    seg.setOptimizeCoefficients (true);
    seg.setModelType (pcl::SACMODEL_CYLINDER);
    seg.setMethodType (pcl::SAC_RANSAC);
    seg.setNormalDistanceWeight (0.1);
    // p = 0.99
    // n = 3
    // w = 0.21
    // 99% chance of finding a cylinder even if approx 81% of all points are outliers
    seg.setMaxIterations (1500);
    seg.setDistanceThreshold (0.25);
    seg.setRadiusLimits (0.11, 0.15);
    seg.setInputCloud (cloud_filtered2);
    seg.setInputNormals (cloud_normals2);

    // Obtain the cylinder inliers and coefficients
    seg.segment (*inliers_cylinder, *coefficients_cylinder);
    // std::cerr << "Cylinder coefficients: " << *coefficients_cylinder << std::endl;

    // Write the cylinder inliers to disk
    extract.setInputCloud (cloud_filtered2);
    extract.setIndices (inliers_cylinder);
    extract.setNegative (false);
    pcl::PointCloud<PointT>::Ptr cloud_cylinder (new pcl::PointCloud<PointT> ());
    extract.filter (*cloud_cylinder);

    // if (cloud_cylinder->points.empty() || (cloud_cylinder->points.size() <= CYLINDER_PTS_THRESHOLD)) {
    if(cloud_cylinder->points.empty()) {
        std::cerr << "Can't find the cylindrical component." << std::endl;
    } else {

        // const clock_t begin_time = clock();

        // Set found flag to true
        found = 1;

        // std::cerr << "[" << ctr << "]: " << "PointCloud representing the cylindrical component: " << cloud_cylinder->points.size () << " data points." << std::endl;
        std::cerr << "PointCloud representing the cylindrical component: " << cloud_cylinder->points.size () << " data points." << std::endl;

        pcl::compute3DCentroid (*cloud_cylinder, centroid);
        std::cerr << "centroid of the cylindrical component: " << centroid[0] << " " <<  centroid[1] << " " <<   centroid[2] << " " <<   centroid[3] << std::endl;

        // Create a point in the "camera_rgb_optical_frame"
        geometry_msgs::PointStamped point_camera;
        geometry_msgs::PointStamped point_map;
        geometry_msgs::PointStamped point_camera_approach;
        geometry_msgs::PointStamped point_map_approach;
        visualization_msgs::Marker marker;
        geometry_msgs::TransformStamped tss;
    
        point_camera.header.frame_id = "camera_rgb_optical_frame";
        point_camera.header.stamp = ros::Time::now();
        point_camera_approach.header.frame_id = "camera_rgb_optical_frame";
        point_camera_approach.header.stamp = ros::Time::now();

        point_map.header.frame_id = "map";
        point_map.header.stamp = ros::Time::now();

        point_camera.point.x = centroid[0];
        point_camera.point.y = centroid[1];
        point_camera.point.z = centroid[2];
        point_camera_approach.point.x = centroid[0];
        point_camera_approach.point.y = centroid[1];
        point_camera_approach.point.z = std::max(centroid[2] - 0.3f, 0.0f);

        try {
            time_test = ros::Time::now();

            // std::cerr << time_rec << std::endl;
            // std::cerr << time_test << std::endl;
            tss = tf2_buffer.lookupTransform("map","camera_rgb_optical_frame", time_rec);
            //tf2_buffer.transform(point_camera, point_map, "map", ros::Duration(2));
        } catch (tf2::TransformException &ex) {
            ROS_WARN("Transform warning: %s\n", ex.what());
        }

        //std::cerr << tss ;

        tf2::doTransform(point_camera, point_map, tss);
        tf2::doTransform(point_camera_approach, point_map_approach, tss);

        // std::cerr << "point_camera: " << point_camera.point.x << " " <<  point_camera.point.y << " " <<  point_camera.point.z << std::endl;

        // Set output variables
        x = point_map.point.x;
        y = point_map.point.y;
        z = point_map.point.z;
        x_a = point_map_approach.point.x;
        y_a = point_map_approach.point.y;
        z_a = point_map_approach.point.z;

        //// std::cerr << "point_map: " << point_map.point.x << " " <<  point_map.point.y << " " <<  point_map.point.z << std::endl;

        //// std::cerr << "Flag: " << flg << std::endl;

        /*
        // TMP: Trying to convert the centroid to pixels >>
        std::cerr << "Cloud width: " << cloud_filtered->width << std::endl;

        float x_real, y_real, range_curr;
        int x, y;

        centroid_tmp = centroid;
        range_image.createFromPointCloud (cloud_cylinder,  0.0903125f, 0.0895833f,
                                    pcl::deg2rad (57.8f), pcl::deg2rad (43.0f),
                                    Eigen::Affine3f::Identity (), RangeImage::CoordinateFrame.CAMERA_FRAME, 0.0f, 0.0f, 0);

        range_image.getImagePoint(centroid_tmp, x_real, y_real, range_curr);
        range_image.real2DToInt2D(x_real, y_real, x, y);

        std::cerr << "X: " << x << " Y: " << y << std::endl;
        // << TMP
        */
        
        /*
        // Visualization (Type might be wrong)
        pcl::visualization::CloudViewer viewer ("Simple cloud viewer");
        viewer.showCloud (cloud_cylinder);
        int c = -1;
        while (c == -1) {
            c = getchar();
        }
       */ 

        // ctr += 1;

        // std::cerr << float( clock () - begin_time ) /  CLOCKS_PER_SEC << std::endl;
        

    }

    //// std::cerr << "Done working" << std::endl;
  
}

int main (int argc, char** argv) {
  
    // Initialize ROS
    ros::init (argc, argv, "cylinder_detector_service");
    ros::NodeHandle nh;

    // For transforming between coordinate frames
    tf2_ros::TransformListener tf2_listener(tf2_buffer);

    // Create a ROS subscriber for the input point cloud
    ros::Subscriber sub = nh.subscribe ("input", 1, cloud_cb);

    ros::ServiceServer service = nh.advertiseService("cylinder_detector", toggle);
    // Init service named cylinder_detector

    std::cerr << "Inited cylinder detector" << std::endl;

    // Spin
    ros::spin ();
}