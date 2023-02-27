%% Project Init
disp('Project MPC Quadcopter Start');

% load('MPCDesignerSession.mat');

% Quadcopter model init
run('Scripts\Quadcopter_model_init.m');

% PID-based controller init
% run('Scripts\PID_based_controller_init.m');

% Linearized state-space model init
% run('Scripts\StateSpaceQuadModel.m');

% load_system('D:\Bw Jiang\Documents\FCS\MPC_Quadcopter\Models\MPC_Quad.slx');

%% Open quadcopter model

%quadPlant = 'MPC_Quad';
%load_system(quadPlant);
%open_system(quadPlant);
quadPlant = 'Quadcopter_model_4SV';
load_system(quadPlant);
open_system(quadPlant);

%% Define IO for linearization
disp('Define IO for linearization');

io(1) = linio([quadPlant '/Demux'], 1, 'openinput');
io(2) = linio([quadPlant '/Demux'], 2, 'openinput');
io(3) = linio([quadPlant '/Demux'], 3, 'openinput');
io(4) = linio([quadPlant '/Demux'], 4, 'openinput');

io(5) = linio([quadPlant '/QuadModel'], 1, 'openoutput');
io(6) = linio([quadPlant '/QuadModel'], 3, 'openoutput');
io(7) = linio([quadPlant '/QuadModel'], 5, 'openoutput');
io(8) = linio([quadPlant '/QuadModel'], 11, 'openoutput');


%% Create operating point specifications for the plant initial conditions

opspec = operspec(quadPlant);

%% Initial states are 0.
disp('Define Initial States with 0');

opspec.States(1).Known = true;
opspec.States(1).x = 0;
% opspec.States(2).Known = true;
% opspec.States(2).x = 0;
opspec.States(3).Known = true;
opspec.States(3).x = 0;
% opspec.States(4).Known = true;
% opspec.States(4).x = 0;
opspec.States(5).Known = true;
opspec.States(5).x = 0;
% opspec.States(6).Known = true;
% opspec.States(6).x = 0;
% opspec.States(7).Known = true;
% opspec.States(7).x = 0;
% opspec.States(8).Known = true;
% opspec.States(8).x = 0;
% opspec.States(9).Known = true;
% opspec.States(9).x = 0;
% opspec.States(10).Known = true;
% opspec.States(10).x = 0;
opspec.States(11).Known = true;
opspec.States(11).x = 0;
% opspec.States(12).Known = true;
% opspec.States(12).x = 0;

%% Compute operating point using these specifications
disp('Compute Operating Point');

options = findopOptions('DisplayReport', false);
op = findop(quadPlant, opspec, options);

%% Obtain the linear plant model at the specified operating point
disp('Linearization');

linearPlant = linearize(quadPlant, op, io);
linearPlant.InputName = {'n1_rpm'; 'n2_rpm'; 'n3_rpm'; 'n4_rpm'};
linearPlant.OutputName = {'x'; 'y'; 'z'; 'psi'};

%% Examine the poles of the linearized plant
disp('Check the Poles');

Poles = pole(linearPlant);

%% Close quadcopter model
bdclose(quadPlant);

%% Load MPC model
disp('Load MPC Model');

load_system('Models\MPC_Quad_4SV.slx');
open_system('Models\MPC_Quad_4SV.slx');

%% MPC Init and Design
disp('MPC Init and Design');

linearPlant = setmpcsignals(linearPlant);

% mpc1 = mpc(linearPlant, Ts);
mpc4sv = mpc(linearPlant, Ts);
run('Scripts\mpc4sv_design.m');

%% Run Simulation
simflag = true;
if (simflag == true)
    disp('Simulation Start');
    sim("MPC_Quad_4SV");
else
    disp('Simulation Skipped')
end
disp('End');
