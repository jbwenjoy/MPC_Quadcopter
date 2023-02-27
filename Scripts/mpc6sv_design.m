%% create MPC controller object with sample time
mpc6sv = mpc(linearPlant, 0.05);
%mpc1 = mpc(plant, 0.05);

%% specify prediction horizon
disp('PredictionHorizon = 50');
mpc6sv.PredictionHorizon = 30;

%% specify control horizon
disp('ControlHorizon = 40');
mpc6sv.ControlHorizon = 2;

%% specify nominal values for inputs and outputs
disp('Nominal.U = [4400; 4400; 4400; 4400]');
mpc6sv.Model.Nominal.U = [4355; 4355; 4355; 4355];
% mpc1.Model.Nominal.U = [5000; 5000; 5000; 5000];
disp('Nominal.Y = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0]');
mpc6sv.Model.Nominal.Y = [0; 0; 0; 0; 0; 0];

%% specify scale factors for inputs and outputs
mpc6sv.MV(1).ScaleFactor = 10000; % n1
mpc6sv.MV(2).ScaleFactor = 10000; % n2
mpc6sv.MV(3).ScaleFactor = 10000; % n3
mpc6sv.MV(4).ScaleFactor = 10000; % n4

mpc6sv.OV(1).ScaleFactor = 100; % x
mpc6sv.OV(2).ScaleFactor = 100; % y
mpc6sv.OV(3).ScaleFactor = 10; % z
mpc6sv.OV(4).ScaleFactor = 1; % phi
mpc6sv.OV(5).ScaleFactor = 1; % theta
mpc6sv.OV(6).ScaleFactor = 2 * 3.1416; % psi

%% specify constraints for MV and MV Rate
mpc6sv.MV(1).Min = 0;
mpc6sv.MV(1).Max = 10000;
mpc6sv.MV(1).RateMin = -8000;
mpc6sv.MV(1).RateMax = 8000;
mpc6sv.MV(2).Min = 0;
mpc6sv.MV(2).Max = 10000;
mpc6sv.MV(2).RateMin = -8000;
mpc6sv.MV(2).RateMax = 8000;
mpc6sv.MV(3).Min = 0;
mpc6sv.MV(3).Max = 10000;
mpc6sv.MV(3).RateMin = -8000;
mpc6sv.MV(3).RateMax = 8000;
mpc6sv.MV(4).Min = 0;
mpc6sv.MV(4).Max = 10000;
mpc6sv.MV(4).RateMin = -8000;
mpc6sv.MV(4).RateMax = 8000;

%% specify constraint softening for MV and MV Rate
mpc6sv.MV(1).RateMinECR = 0.5;
mpc6sv.MV(1).RateMaxECR = 0.2;
mpc6sv.MV(2).RateMinECR = 0.5;
mpc6sv.MV(2).RateMaxECR = 0.2;
mpc6sv.MV(3).RateMinECR = 0.5;
mpc6sv.MV(3).RateMaxECR = 0.2;
mpc6sv.MV(4).RateMinECR = 0.5;
mpc6sv.MV(4).RateMaxECR = 0.2;
%% specify constraints for OV
mpc6sv.OV(1).Min = -100; % x meter
mpc6sv.OV(1).Max = 100;
mpc6sv.OV(2).Min = -100; % y meter
mpc6sv.OV(2).Max = 100;
mpc6sv.OV(3).Min = -100; % z meter
mpc6sv.OV(3).Max = 100;
mpc6sv.OV(4).Min = -0.5; % 滚转 rad
mpc6sv.OV(4).Max = 0.5;
mpc6sv.OV(5).Min = -0.5; % 俯仰 rad
mpc6sv.OV(5).Max = 0.5;
mpc6sv.OV(6).Min = -3.14159265359; % 偏航角无限制 rad
mpc6sv.OV(6).Max = 3.14159265359;

%% specify weights
mpc6sv.Weights.MV = [1 1 1 1];
mpc6sv.Weights.MVRate = [1 1 1 1];
mpc6sv.Weights.OV = [10 10 100 1 1 1];
mpc6sv.Weights.ECR = 100000;

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
