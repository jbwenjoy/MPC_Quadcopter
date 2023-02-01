%% Project Init
disp('Project MPC Quadcopter Start');

load('MPCDesignerSession.mat');

% Quadcopter model init
run('Scripts\Quadcopter_model_init.m');

% PID-based controller init
run('Scripts\PID_based_controller_init.m');

% load_system('D:\Bw Jiang\Documents\FCS\MPC_Quadcopter\Models\MPC_Quad.slx');

%% Open quadcopter model

%quadPlant = 'MPC_Quad';
%load_system(quadPlant);
%open_system(quadPlant);
quadPlant = 'Quadcopter_model';
load_system(quadPlant);
open_system(quadPlant);

%% Define IO for linearization
disp('Define IO for linearization');

% io(1) = linio(quadPlant, 1, 'openinput');
% io(2) = linio(quadPlant, 2, 'openinput');
% io(3) = linio(quadPlant, 3, 'openinput');
% io(4) = linio(quadPlant, 4, 'openinput');

io(1) = linio([quadPlant '/n1_rpm'], 1, 'openinput');
io(2) = linio([quadPlant '/n2_rpm'], 1, 'openinput');
io(3) = linio([quadPlant '/n3_rpm'], 1, 'openinput');
io(4) = linio([quadPlant '/n4_rpm'], 1, 'openinput');

% io(5) = linio(quadPlant, 1, 'openoutput');
% io(6) = linio(quadPlant, 2, 'openoutput');
% io(7) = linio(quadPlant, 3, 'openoutput');
% io(8) = linio(quadPlant, 4, 'openoutput');
% io(9) = linio(quadPlant, 5, 'openoutput');
% io(10) = linio(quadPlant, 6, 'openoutput');
% io(11) = linio(quadPlant, 7, 'openoutput');
% io(12) = linio(quadPlant, 8, 'openoutput');
% io(13) = linio(quadPlant, 9, 'openoutput');
% io(14) = linio(quadPlant, 10, 'openoutput');
% io(15) = linio(quadPlant, 11, 'openoutput');
% io(16) = linio(quadPlant, 12, 'openoutput');

% io(5) = linio([quadPlant '/x'], 1, 'openoutput');
% io(6) = linio([quadPlant '/vx'], 2, 'openoutput');
% io(7) = linio([quadPlant '/y'], 3, 'openoutput');
% io(8) = linio([quadPlant '/vy'], 4, 'openoutput');
% io(9) = linio([quadPlant '/z'], 5, 'openoutput');
% io(10) = linio([quadPlant '/vz'], 6, 'openoutput');
% io(11) = linio([quadPlant '/phi'], 7, 'openoutput');
% io(12) = linio([quadPlant '/d_phi'], 8, 'openoutput');
% io(13) = linio([quadPlant '/theta'], 9, 'openoutput');
% io(14) = linio([quadPlant '/d_theta'], 10, 'openoutput');
% io(15) = linio([quadPlant '/psi'], 11, 'openoutput');
% io(16) = linio([quadPlant '/d_psi'], 12, 'openoutput');

io(5) = linio([quadPlant '/Quadcopter Model'], 1, 'openoutput');
io(6) = linio([quadPlant '/Quadcopter Model'], 2, 'openoutput');
io(7) = linio([quadPlant '/Quadcopter Model'], 3, 'openoutput');
io(8) = linio([quadPlant '/Quadcopter Model'], 4, 'openoutput');
io(9) = linio([quadPlant '/Quadcopter Model'], 5, 'openoutput');
io(10) = linio([quadPlant '/Quadcopter Model'], 6, 'openoutput');
io(11) = linio([quadPlant '/Quadcopter Model'], 7, 'openoutput');
io(12) = linio([quadPlant '/Quadcopter Model'], 8, 'openoutput');
io(13) = linio([quadPlant '/Quadcopter Model'], 9, 'openoutput');
io(14) = linio([quadPlant '/Quadcopter Model'], 10, 'openoutput');
io(15) = linio([quadPlant '/Quadcopter Model'], 11, 'openoutput');
io(16) = linio([quadPlant '/Quadcopter Model'], 12, 'openoutput');

%% Create operating point specifications for the plant initial conditions

opspec = operspec(quadPlant);

%% Initial states are 0.
disp('Define Initial States with 0');

opspec.States(1).Known = true;
opspec.States(1).x = 0;
opspec.States(2).Known = true;
opspec.States(2).x = 0;
opspec.States(3).Known = true;
opspec.States(3).x = 0;
opspec.States(4).Known = true;
opspec.States(4).x = 0;
opspec.States(5).Known = true;
opspec.States(5).x = 0;
opspec.States(6).Known = true;
opspec.States(6).x = 0;
opspec.States(7).Known = true;
opspec.States(7).x = 0;
opspec.States(8).Known = true;
opspec.States(8).x = 0;
opspec.States(9).Known = true;
opspec.States(9).x = 0;
opspec.States(10).Known = true;
opspec.States(10).x = 0;
opspec.States(11).Known = true;
opspec.States(11).x = 0;
opspec.States(12).Known = true;
opspec.States(12).x = 0;

%% Compute operating point using these specifications
disp('Compute Operating Point');

options = findopOptions('DisplayReport', false);
op = findop(quadPlant, opspec, options);

%% Obtain the linear plant model at the specified operating point
disp('Linearization');

linearPlant = linearize(quadPlant, op, io);
linearPlant.InputName = {'n1_rpm'; 'n2_rpm'; 'n3_rpm'; 'n4_rpm'};
linearPlant.OutputName = {'x'; 'vx'; 'y'; 'vy'; 'z'; 'vz'; 'phi'; 'd_phi'; 'theta'; 'd_theta'; 'psi'; 'd_psi'};

%% Examine the poles of the linearized plant
disp('Check the Poles');

Poles = pole(linearPlant);

%% Close quadcopter model
bdclose(quadPlant);

%% Load MPC model
disp('Load MPC Model');

load_system('Models\MPC_Quad.slx');
open_system('Models\MPC_Quad.slx');

%% MPC Init and Design
disp('MPC Init and Design');

linearPlant = setmpcsignals(linearPlant);
Ts = 0.05;
mpc1 = mpc(linearPlant, Ts);
run('Scripts\mpc1_design.m');

%% Run Simulation
disp('Simulation');

sim("MPC_Quad");

disp('End');