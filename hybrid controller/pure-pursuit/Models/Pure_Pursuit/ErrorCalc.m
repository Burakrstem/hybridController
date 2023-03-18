%% CALCULATE DISTANCE ERROR

eleman_sayisi=s(1);
CurrentX=(linspace(out.simout.Data(1,1),out.simout.Data(1,end),eleman_sayisi))';
CurrentY=(linspace(out.simout1.Data(1,1),out.simout.Data(1,end),eleman_sayisi))';

xRef = refPose(:,1);
yRef = -refPose(:,2); 

X_error=CurrentX-xRef;
Y_error=CurrentY-yRef;
distance_error= sqrt(X_error.*X_error + Y_error.*Y_error);
total_error=sum(distance_error(:));

%% CALCULATE HEADING ERROR
Road_Z=data.RoadSpecifications(1,1).Centers(:,3);
CurrentZ=(linspace(out.simout2.Data(1,1),out.simout.Data(1,end),eleman_sayisi))';


heading_error=CurrentPsi-Road_Psi;