% Pure Pursuit Model Initialization
clear;clc;
%% add Image to the path
addpath(genpath('Images'));

%% load the road data from Driving Scenario Designer
load('CurvedRoad.mat');

%% add actor and Generate Waypoints from road center
roadX=data.RoadSpecifications.Centers(:,1);
roadY=data.RoadSpecifications.Centers(:,2);
roadZ=data.RoadSpecifications.Centers(:,3);

data.ActorSpecifications.Waypoints=[roadX,roadY,roadZ];
data.ActorSpecifications.Position=[roadX(1),roadY(1),roadZ(1)];

%%% For error
% roadX=[data.RoadSpecifications(1,1).Centers(:,1);data.RoadSpecifications(1,2).Centers(:,1);data.RoadSpecifications(1,3).Centers(:,1)];
% roadY=[data.RoadSpecifications(1,1).Centers(:,2);data.RoadSpecifications(1,2).Centers(:,2);data.RoadSpecifications(1,3).Centers(:,2)];
% roadZ=[data.RoadSpecifications(1,1).Centers(:,3);data.RoadSpecifications(1,2).Centers(:,3);data.RoadSpecifications(1,3).Centers(:,3)];
% data.RoadSpecifications(1,1).Centers=[roadX,roadY,roadZ];
% 
% data.ActorSpecifications.Waypoints=[roadX,roadY,roadZ];
%data.ActorSpecifications.Position=[roadX(1),roadY(1),roadZ(1)];
%%
curveList = [data.ActorSpecifications.Yaw];
X=roadX(1:10:end);
Y=roadY(1:10:end);
for i = 1:length(X)-1
    dy = Y(i+1) - Y(i);
    dx = X(i+1) - X(i);
    curveList(end+1) = atan2(dy, dx);
end
diffcurve=[];
for i= 1 :length(curveList)-1
    diffcurve(end+1)=abs(curveList(i+1)-curveList(i));
end
% %
% vel=[];
% for i=1:length(diffcurve)
%     if diffcurve(i)>0 && diffcurve(i)<0.5
%         vel(end+1)=30;
%     elseif diffcurve(i)>=0.5 && diffcurve(i)<1
%         vel(end+1)=20;
%     elseif diffcurve(i)>=1 && diffcurve(i)<1.5
%         vel(end+1)=10;
%     elseif diffcurve(i)>=1.5 && diffcurve(i)<2
%         vel(end+1)=5;
%     else
%         vel(end+1)=3;
%     end
% end

%% define reference points
refPose = data.ActorSpecifications.Waypoints;
xRef = refPose(:,1);
yRef = -refPose(:,2); 
psiRef=refPose(:,3);

%% define parameters used in the models
L = data.ActorSpecifications.Length; % bicycle length
data.ActorSpecifications.Speed=20;
ld = 5; % lookahead distance data.ActorSpecifications.Speed/4
X_o = refPose(1,1); % initial vehicle position
Y_o = -refPose(1,2); % initial vehicle position 
psi_o = refPose(1,3); % initial yaw angle
%% define reference time for plotting 
distanceList=[];
for i = 1:length(roadX)-1
    dy = roadY(i+1) - roadY(i);
    dx = roadX(i+1) - roadX(i);
    distanceList(end+1) = sqrt(dy^2 +dx^2);
end
Distance=sum(distanceList(:));
speed=20;
Ts = Distance/speed+10; % simulation time
s = size(xRef);
tRef = (linspace(0,Ts,s(1)))'; % this time variable is used in the "2D Visualization" block for plotting the reference points.

%% define data for velocity lookup table simulinkten ayarlandı
%aracın hızının konuma göre değişikliğini istemediğimiz icin sabit tuttuk
% lookUpt = readmatrix('velocityDistribution.xlsx');
% xlt = lookUpt(2:27,1);
% ylt = lookUpt(1,2:32);
% vel = lookUpt(2:27,2:32);
j =1;