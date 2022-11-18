disp("Project MPC Quadcopter Start!");

load("MPCDesignerSession.mat");
%run("Scripts\mpc1_design.m");

open("Models\MPC_Quad.slx")

% g = 9.81;
% mass = 4;
% I_xx = 3.5e-3;
% I_yy = 3.5e-3;
% I_zz = 7e-3;
% I_r = 1.5e-5;
% l = 0.3;
