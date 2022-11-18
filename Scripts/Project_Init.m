disp("Project MPC Quadcopter Start!");

load("MPCDesignerSession.mat");
%run("Scripts\mpc1_design.m");

open("Models\MPC_Quad.slx")

g = 9.81;
mass = 4;
Ixx = 3.5e-3;
Iyy = 3.5e-3;
Izz = 7e-3;
Ir = 1.5e-5;
length = 0.3;
