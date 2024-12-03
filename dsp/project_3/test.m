clear; clc; close all;
load projIB.mat;

FsIn = 44100;

% Filter Specifications
max_multiplications = 17;
% Fp = 4000; % Passband edge (Hz)
Fst = 4000; % Stopband edge (Hz)
max_gain_passband = 40; % (dB)
min_gain_passband = 37; % (dB)
max_gain_stopband = -55; % (dB)

wc = Fst / (FsIn/2)
Ast = max_gain_passband - max_gain_stopband; % Stopband Attenuation
Rp = max_gain_passband - min_gain_passband; % Passband Ripple

x = noisy;
t = (0:length(x)-1) / FsIn;

L = 1; % Interpolation Factor
% M = 4; % Decimation factor
M = round(1/wc);
FsOut = FsIn / M;

rcEqui = designMultirateFIR(DecimationFactor=M,...
    InterpolationFactor=L,OverlapTransition=false,...
    TransitionWidth=0.1, DesignMethod='equiripple',...
    StopbandAttenuation=Ast, PassbandRipple=Rp, ...
    Systemobject=true);

rcKaiser = designMultirateFIR(DecimationFactor=M,...
    InterpolationFactor=L, OverlapTransition=false,...
    PolyphaseLength=14, DesignMethod='kaiser',...
    StopbandAttenuation=Ast+100, Systemobject=true); % tune Ast + 100

fa = filterAnalyzer(rcEqui,rcKaiser,FilterNames=["Equiripple","Kaiser"]);
cost(rcEqui)
measure(rcEqui)
freqzmr(rcEqui,InputSampleRate=FsIn)
cost(rcKaiser)
measure(rcKaiser)
freqzmr(rcKaiser,InputSampleRate=FsIn)

y = rcKaiser(x);
soundsc(y,FsOut)