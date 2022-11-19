disp("Project MPC Quadcopter Start!");

load("MPCDesignerSession.mat");
%run("Scripts\mpc1_design.m");

% Quadcopter model init
run("Scripts\Quadcopter_model_init.m");

% PID-based controller init
run("Scripts\PID_based_controller_init.m");

open("Models\MPC_Quad.slx");