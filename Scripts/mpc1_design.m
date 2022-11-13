%% create MPC controller object with sample time
mpc1 = mpc(mpc1_plant_C_1, 0.05);
%% specify prediction horizon
mpc1.PredictionHorizon = 10;
%% specify control horizon
mpc1.ControlHorizon = 2;
%% specify nominal values for inputs and outputs
mpc1.Model.Nominal.U = [4508;4508;4508;4508];
mpc1.Model.Nominal.Y = [0;0;0;0;0;0;0;0;0;0;0;0];
%% specify scale factors for inputs and outputs
mpc1.MV(1).ScaleFactor = 20;
mpc1.MV(2).ScaleFactor = 20;
mpc1.MV(3).ScaleFactor = 20;
mpc1.MV(4).ScaleFactor = 20;
mpc1.OV(1).ScaleFactor = 10;
mpc1.OV(2).ScaleFactor = 10;
mpc1.OV(3).ScaleFactor = 10;
mpc1.OV(4).ScaleFactor = 10;
mpc1.OV(5).ScaleFactor = 10;
mpc1.OV(6).ScaleFactor = 10;
%% specify constraints for MV and MV Rate
mpc1.MV(1).Min = 0;
mpc1.MV(1).Max = 10000;
mpc1.MV(1).RateMin = -10000;
mpc1.MV(1).RateMax = 10000;
mpc1.MV(2).Min = 0;
mpc1.MV(2).Max = 10000;
mpc1.MV(2).RateMin = -10000;
mpc1.MV(2).RateMax = 10000;
mpc1.MV(3).Min = 0;
mpc1.MV(3).Max = 10000;
mpc1.MV(3).RateMin = -10000;
mpc1.MV(3).RateMax = 10000;
mpc1.MV(4).Min = 0;
mpc1.MV(4).Max = 10000;
mpc1.MV(4).RateMin = -10000;
mpc1.MV(4).RateMax = 10000;
%% specify constraint softening for MV and MV Rate
mpc1.MV(1).MinECR = 0.2;
mpc1.MV(1).RateMinECR = 1;
mpc1.MV(1).RateMaxECR = 0.2;
mpc1.MV(2).MinECR = 0.2;
mpc1.MV(2).RateMinECR = 1;
mpc1.MV(2).RateMaxECR = 0.2;
mpc1.MV(3).MinECR = 0.2;
mpc1.MV(3).RateMinECR = 1;
mpc1.MV(3).RateMaxECR = 0.2;
mpc1.MV(4).MinECR = 0.2;
mpc1.MV(4).RateMinECR = 1;
mpc1.MV(4).RateMaxECR = 0.2;
%% specify constraints for OV
mpc1.OV(1).Min = -1000;
mpc1.OV(1).Max = 1000;
mpc1.OV(2).Min = -10;
mpc1.OV(2).Max = 10;
mpc1.OV(3).Min = -1000;
mpc1.OV(3).Max = 1000;
mpc1.OV(4).Min = -10;
mpc1.OV(4).Max = 10;
mpc1.OV(5).Min = -1000;
mpc1.OV(5).Max = 1000;
mpc1.OV(6).Min = -10;
mpc1.OV(6).Max = 10;
mpc1.OV(7).Min = -0.523598775598299;
mpc1.OV(7).Max = 0.523598775598299;
mpc1.OV(8).Min = -1.0471975511966;
mpc1.OV(8).Max = 1.0471975511966;
mpc1.OV(9).Min = -0.523598775598299;
mpc1.OV(9).Max = 0.523598775598299;
mpc1.OV(10).Min = -1.0471975511966;
mpc1.OV(10).Max = 1.0471975511966;
mpc1.OV(11).Min = -3.14159265358979;
mpc1.OV(11).Max = 3.14159265358979;
mpc1.OV(12).Min = -0.523598775598299;
mpc1.OV(12).Max = 0.523598775598299;
%% specify weights
mpc1.Weights.MV = [0 0 0 0];
mpc1.Weights.MVRate = [0.213827622049682 0.213827622049682 0.213827622049682 0.213827622049682];
mpc1.Weights.OV = [0.467666427009909 0.467666427009909 0.467666427009909 0.467666427009909 0.467666427009909 0.467666427009909 0.467666427009909 0.467666427009909 0.467666427009909 0.467666427009909 0.467666427009909 0.467666427009909];
mpc1.Weights.ECR = 100000;
%% specify simulation options
options = mpcsimopt();
options.MVSignal = mpc1_MVSignal;
options.RefLookAhead = 'off';
options.MDLookAhead = 'off';
options.Constraints = 'on';
options.OpenLoop = 'off';
%% run simulation
sim(mpc1, 201, mpc1_RefSignal_2, mpc1_MDSignal_2, options);
