%% create MPC controller object with sample time
mpc1 = mpc(linearPlant, 0.01);
%mpc1 = mpc(plant, 0.05);

%% specify prediction horizon
mpc1.PredictionHorizon = 50;

%% specify control horizon
mpc1.ControlHorizon = 2;

%% specify nominal values for inputs and outputs
mpc1.Model.Nominal.U = [4400; 4400; 4400; 4400];
% mpc1.Model.Nominal.U = [5000; 5000; 5000; 5000];
mpc1.Model.Nominal.Y = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];

%% specify scale factors for inputs and outputs
mpc1.MV(1).ScaleFactor = 10000;
mpc1.MV(2).ScaleFactor = 10000;
mpc1.MV(3).ScaleFactor = 10000;
mpc1.MV(4).ScaleFactor = 10000;
mpc1.OV(1).ScaleFactor = 100;
mpc1.OV(2).ScaleFactor = 20;
mpc1.OV(3).ScaleFactor = 100;
mpc1.OV(4).ScaleFactor = 20;
mpc1.OV(5).ScaleFactor = 100;
mpc1.OV(6).ScaleFactor = 20;
mpc1.OV(7).ScaleFactor = 1;
mpc1.OV(8).ScaleFactor = 1;
mpc1.OV(9).ScaleFactor = 1;
mpc1.OV(10).ScaleFactor = 1;
mpc1.OV(11).ScaleFactor = 3.1416;
mpc1.OV(12).ScaleFactor = 1;

%% specify constraints for MV and MV Rate
mpc1.MV(1).Min = 0;
mpc1.MV(1).Max = 10000;
mpc1.MV(1).RateMin = -8000;
mpc1.MV(1).RateMax = 8000;
mpc1.MV(2).Min = 0;
mpc1.MV(2).Max = 10000;
mpc1.MV(2).RateMin = -8000;
mpc1.MV(2).RateMax = 8000;
mpc1.MV(3).Min = 0;
mpc1.MV(3).Max = 10000;
mpc1.MV(3).RateMin = -8000;
mpc1.MV(3).RateMax = 8000;
mpc1.MV(4).Min = 0;
mpc1.MV(4).Max = 10000;
mpc1.MV(4).RateMin = -8000;
mpc1.MV(4).RateMax = 8000;

%% specify constraint softening for MV and MV Rate
mpc1.MV(1).RateMinECR = 0.5;
mpc1.MV(1).RateMaxECR = 0.2;
mpc1.MV(2).RateMinECR = 0.5;
mpc1.MV(2).RateMaxECR = 0.2;
mpc1.MV(3).RateMinECR = 0.5;
mpc1.MV(3).RateMaxECR = 0.2;
mpc1.MV(4).RateMinECR = 0.5;
mpc1.MV(4).RateMaxECR = 0.2;
%% specify constraints for OV
mpc1.OV(1).Min = -1000; % x meter
mpc1.OV(1).Max = 1000;
mpc1.OV(2).Min = -5; % vx m/s
mpc1.OV(2).Max = 5;
mpc1.OV(3).Min = -1000; % y meter
mpc1.OV(3).Max = 1000;
mpc1.OV(4).Min = -5; % vy m/s
mpc1.OV(4).Max = 5;
mpc1.OV(5).Min = -1000; % z meter
mpc1.OV(5).Max = 1000;
mpc1.OV(6).Min = -5; % vz meter
mpc1.OV(6).Max = 5;
mpc1.OV(7).Min = -0.5; % 滚转 rad
mpc1.OV(7).Max = 0.5;
mpc1.OV(8).Min = -0.5; % 滚转率 rad/s
mpc1.OV(8).Max = 0.5;
mpc1.OV(9).Min = -0.5; % 俯仰 rad
mpc1.OV(9).Max = 0.5;
mpc1.OV(10).Min = -0.5; % 俯仰率 rad/s
mpc1.OV(10).Max = 0.5;
mpc1.OV(11).Min = -3.14159265359; % 偏航角无限制 rad
mpc1.OV(11).Max = 3.14159265359;
mpc1.OV(12).Min = -0.5; % 偏航率 rad/s
mpc1.OV(12).Max = 0.5;

%% specify weights
mpc1.Weights.MV = [1 1 1 1];
mpc1.Weights.MVRate = [1 1 1 1];
mpc1.Weights.OV = [1 1 1 1 100 10 1 1 1 1 1 1];
% mpc1.Weights.ECR = 100000;

%% specify simulation options
% options = mpcsimopt();
% options.MVSignal = mpc1_MVSignal_1;
% options.RefLookAhead = 'off'; % default
% options.MDLookAhead = 'off'; % default
% options.Constraints = 'on'; % default
% options.OpenLoop = 'off'; % default

%% run simulation
disp('MPC Design Finished');
% sim(mpc1, 201, mpc1_RefSignal_1, mpc1_MDSignal_1, options);
