Vehicle Path Tracking using Pure Pursuit Controller

This submission contains a set of models to show the implementation of a Pure Pursuit controller on a vehicle under different scenarios. 

---------------------------------------------------------------------------------------------------------------------------------------------------

About the models:
These models show a workflow to implement a Pure Pursuit controller to track a planned path. Steps below describe the workflow:
1. Generating waypoints
2. Formulating required steering angle for lateral control
3. Implementing a longitudinal controller to track the path at higher velocity
4. Visualizing vehicle final path in Bird's-Eye Scope and a 3D simulation environment. 


PRODUCT REQUIREMENTS:

The models use the following MathWorks products, all from R2020a release:
1)MATLAB
2)Simulink
3)Vehicle Dynamics Blockset
4)Automated Driving Toolbox
5)Navigation Toolbox

6)Aerospace Blockset 
7)Aerospace Toolbox
Note: The Aerospace Blockset and Aerospace Toolbox are only required for the model to convert from rad/s to degree/s.
In case of the absence of these two toolboxes, define the conversion factor from rad/s to degree/s using a gain block and use the model. 