% PID-based controller init
SampleTime = 0.005;
Pos_Pos_P = 0.7;
Pos_Vel_P = 0.2;
Pos_Vel_I = 0.1;
Alt_P = 1.1;
Alt_I = 0.24;
Alt_D = 0.5;
Yaw_P = 0.008;
Yaw_I = 0.001;
Yaw_D = 0.0012;
Att_Ang_P = 4;
Att_AngVel_P = 0.003*[1 0.81];
Att_AngVel_I = 2*0.003*[1 0.81];
Att_AngVel_D = 0.003/25*[1 0.81];