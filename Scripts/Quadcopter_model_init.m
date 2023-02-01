%% Quadcopter model init

g = 9.81; % m/s^2
mass = 1; % kg
Ixx = 8.850e-3; % kg*m^2
Iyy = 7.156e-3; % kg*m^2
Izz = 1.83e-2; % kg*m^2
Ir = 6e-5; % kg*m^2
length = 0.225; % m

%% Simulation condition init

Ts = 0.05;
T_total = 10;