%% Quadcopter model init

g = 9.8; % m/s^2
mass = 0.942; % kg
Ixx = 8.850e-3; % kg*m^2
Iyy = 7.156e-3; % kg*m^2
Izz = 1.83e-2; % kg*m^2
Ir = 6e-5; % kg*m^2
Length = 0.225; % m 注意论文中的length是旋翼质心到机体质心的距离
Ct = 1.11e-5; % N*s^2/rad^2
Cm = 1.0144e-7; % N*m*s^2/rad^2
estim_hover_nrpm = 4355; % rpm

%% Simulation condition init

Ts = 0.005;
T_total = 10;
