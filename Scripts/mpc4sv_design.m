%% create MPC controller object with sample time
mpc4sv = mpc(linearPlant, 0.05);
%mpc1 = mpc(plant, 0.05);

%% specify prediction horizon
disp('PredictionHorizon = 50');
mpc4sv.PredictionHorizon = 30;

%% specify control horizon
disp('ControlHorizon = 40');
mpc4sv.ControlHorizon = 5;

%% specify nominal values for inputs and outputs
disp('Nominal.U = [4355; 4355; 4355; 4355]');
mpc4sv.Model.Nominal.U = [4355; 4355; 4355; 4355];
% mpc4sv.Model.Nominal.U = [5000; 5000; 5000; 5000];
disp('Nominal.Y = [0; 0; 0; 0]');
mpc4sv.Model.Nominal.Y = [0; 0; 0; 0];

%% specify scale factors for inputs and outputs
mpc4sv.MV(1).ScaleFactor = 10000; % n1
mpc4sv.MV(2).ScaleFactor = 10000; % n2
mpc4sv.MV(3).ScaleFactor = 10000; % n3
mpc4sv.MV(4).ScaleFactor = 10000; % n4

mpc4sv.OV(1).ScaleFactor = 1000; % x
mpc4sv.OV(2).ScaleFactor = 1000; % y
mpc4sv.OV(3).ScaleFactor = 100; % z
mpc4sv.OV(4).ScaleFactor = 2 * 3.1416; % psi

%% specify constraints for MV and MV Rate
mpc4sv.MV(1).Min = 0;
mpc4sv.MV(1).Max = 10000;
mpc4sv.MV(1).RateMin = -10000;
mpc4sv.MV(1).RateMax = 10000;
mpc4sv.MV(2).Min = 0;
mpc4sv.MV(2).Max = 10000;
mpc4sv.MV(2).RateMin = -10000;
mpc4sv.MV(2).RateMax = 10000;
mpc4sv.MV(3).Min = 0;
mpc4sv.MV(3).Max = 10000;
mpc4sv.MV(3).RateMin = -10000;
mpc4sv.MV(3).RateMax = 10000;
mpc4sv.MV(4).Min = 0;
mpc4sv.MV(4).Max = 10000;
mpc4sv.MV(4).RateMin = -10000;
mpc4sv.MV(4).RateMax = 10000;

%% specify constraint softening for MV and MV Rate
mpc4sv.MV(1).RateMinECR = 0.5;
mpc4sv.MV(1).RateMaxECR = 0.01;
mpc4sv.MV(2).RateMinECR = 0.5;
mpc4sv.MV(2).RateMaxECR = 0.01;
mpc4sv.MV(3).RateMinECR = 0.5;
mpc4sv.MV(3).RateMaxECR = 0.01;
mpc4sv.MV(4).RateMinECR = 0.5;
mpc4sv.MV(4).RateMaxECR = 0.01;
%% specify constraints for OV
mpc4sv.OV(1).Min = -500; % x meter
mpc4sv.OV(1).Max = 500;
mpc4sv.OV(2).Min = -500; % y meter
mpc4sv.OV(2).Max = 500;
mpc4sv.OV(3).Min = -50; % z meter
mpc4sv.OV(3).Max = 50;
% mpc4sv.OV(4).Min = -3.14159265359; % 偏航角无限制 rad
% mpc4sv.OV(4).Max = 3.14159265359;

%% specify weights
mpc4sv.Weights.MV = [1 1 1 1];
mpc4sv.Weights.MVRate = [1 1 1 1];
mpc4sv.Weights.OV = [1000 1000 1000 5];
mpc4sv.Weights.ECR = 100000;

%% specify simulation options
% options = mpcsimopt();
% options.MVSignal = mpc6sv_MVSignal_1;
% options.RefLookAhead = 'off'; % default
% options.MDLookAhead = 'off'; % default
% options.Constraints = 'on'; % default
% options.OpenLoop = 'off'; % default

%% run simulation
disp('MPC Design Finished');
% sim(mpc6sv, 201, mpc6sv_RefSignal_1, mpc6sv_MDSignal_1, options);
