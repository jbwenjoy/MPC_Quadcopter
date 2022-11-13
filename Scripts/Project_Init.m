disp("Project MPC Quadcopter Start!");

load("MPCDesignerSession.mat");
load("mpc1");

g = 9.81;
mass = 4;
I_xx = 1;
I_yy = 1;
I_zz = 0.5;
I_r = 0.05;
l = 0.3;
