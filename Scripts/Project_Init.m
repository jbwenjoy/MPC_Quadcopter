%% Project Init
disp('Project MPC Quadcopter Start!');

load('MPCDesignerSession.mat');

% Quadcopter model init
run('Scripts\Quadcopter_model_init.m');

% PID-based controller init
run('Scripts\PID_based_controller_init.m');

% load_system('D:\Bw Jiang\Documents\FCS\MPC_Quadcopter\Models\MPC_Quad.slx');

%% 
quadPlant = 'Quadcopter_model';
load_system(quadPlant);
open_system(quadPlant);

%% 
io(1) = linio([quadPlant '/n1_rpm'], 1, 'openinput');
io(2) = linio([quadPlant '/n2_rpm'], 1, 'openinput');
io(3) = linio([quadPlant '/n3_rpm'], 1, 'openinput');
io(4) = linio([quadPlant '/n4_rpm'], 1, 'openinput');
io(5) = linio([quadPlant '/Subsystem1'], 1, 'openoutput');
io(6) = linio([quadPlant '/Subsystem1'], 2, 'openoutput');
io(7) = linio([quadPlant '/Subsystem1'], 3, 'openoutput');
io(8) = linio([quadPlant '/Subsystem1'], 4, 'openoutput');
io(9) = linio([quadPlant '/Subsystem1'], 5, 'openoutput');
io(10) = linio([quadPlant '/Subsystem1'], 6, 'openoutput');
io(11) = linio([quadPlant '/Subsystem1'], 7, 'openoutput');
io(12) = linio([quadPlant '/Subsystem1'], 8, 'openoutput');
io(13) = linio([quadPlant '/Subsystem1'], 9, 'openoutput');
io(14) = linio([quadPlant '/Subsystem1'], 10, 'openoutput');
io(15) = linio([quadPlant '/Subsystem1'], 11, 'openoutput');
io(16) = linio([quadPlant '/Subsystem1'], 12, 'openoutput');

%% 
opspec = operspec(quadPlant);

%%
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

%%
options = findopOptions('DisplayReport', false);
op = findop(quadPlant, opspec, options);

%%
linearPlant = linearize(quadPlant, op, io);
linearPlant.InputName = {'n1_rpm'; 'n2_rpm'; 'n3_rpm'; 'n4_rpm'};
linearPlant.OutputName = {'x'; 'vx'; 'y'; 'vy'; 'z'; 'vz'; 'phi'; 'd_phi'; 'theta'; 'd_theta'; 'psi'; 'd_psi'};

%%
pole(linearPlant);

%%
bdclose(quadPlant);
load_system('Models\MPC_Quad.slx');
open_system('Models\MPC_Quad.slx');
%% MPC Init and Design
linearPlant = setmpcsignals(linearPlant);

Ts = 0.05;
mpc1 = mpc(linearPlant, Ts);
run('Scripts\mpc1_design.m');

%% Run Simulation
sim(mpc1);

