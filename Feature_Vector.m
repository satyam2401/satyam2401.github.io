function [Mean, STD, CoV, CF, avg, maxFreq, LOA, Skew, ZCR, cwtmean, cwtvar] = FeatureVec(Wx, Wy, Wz)
%FeatureVec Extracts features from a given window. 

%Mean
Meanx = mean(Wx);
Meany = mean(Wy);
Meanz = mean(Wz);

Mean = (Meanx^2 + Meany^2 + Meanz^2)^0.5;

%Standard Deviation
STDx = std(Wx);
STDy = std(Wy);
STDz = std(Wz);

STD = (STDx^2 + STDy^2 + STDz^2)^0.5;

%Coefficients of Variation
CoVx = Meanx/STDx;
CoVy = Meany/STDy;
CoVz = Meanz/STDz;

CoV = (CoVx^2 + CoVy^2 + CoVz^2)^0.5;

%Crest Factor
CFx = max(Wx)/(sum(Wx.*Wx)/length(Wx))^0.5;
CFy = max(Wy)/(sum(Wy.*Wy)/length(Wy))^0.5;
CFz = max(Wz)/(sum(Wz.*Wz)/length(Wz))^0.5;

CF = (CFx^2 + CFy^2 +CFz^2)^0.5;

mag = sqrt(Wx.^2+Wy.^2+Wz.^2);

%Average
avg = mean(mag);

% Y-Axis data only
Wy = Wy - mean(Wy);

% apply fast fourier transformation to the signal
% Next power of 2 from length of averaged rms acceleration
NFFT = 2 ^ nextpow2(length(Wy)); 
freqAccel = fft(Wy, NFFT) / length(Wy);
f = linspace(0, 1, NFFT / 2 + 1);

% amplitude of spectrum
amplitudeSpectrum = 2 * abs(freqAccel(1:NFFT / 2 + 1));

%Freq. feature 1
[maxVal, maxIndx] = max(amplitudeSpectrum); % Find peak
maxFreq = f(maxIndx); 

%Lag-One Auto-Corelation
extWx = Wx - mean(Wx);
ext1Wx = extWx(1:9); ext2Wx = extWx(2:10);
Loanx = sum(ext1Wx.*ext2Wx);
Loadx = sum(extWx.^2);
Loax = Loanx/Loadx;

extWy = Wy - mean(Wy);
ext1Wy = extWy(1:9); ext2Wy = extWy(2:10);
Loany = sum(ext1Wy.*ext2Wy);
Loady = sum(extWy.^2);
Loay = Loany/Loady;

extWz = Wz - mean(Wz);
ext1Wz = extWz(1:9); ext2Wz = extWz(2:10);
Loanz = sum(ext1Wz.*ext2Wz);
Loadz = sum(extWz.^2);
Loaz = Loanz/Loadz;

LOA = (Loax^2 + Loay^2 + Loay^3)^0.5;

%Skewness
extWx = Wx - mean(Wx);
extWxpow2 = extWx.^2;
extWxpow3 = extWx.^3;
Skewx = sum(extWxpow3)/(sum(extWxpow2))^1.5;

extWy = Wy - mean(Wy);
extWypow2 = extWy.^2;
extWypow3 = extWy.^3;
Skewy = sum(extWypow3)/(sum(extWypow2))^1.5;

extWz = Wz - mean(Wz);
extWzpow2 = extWz.^2;
extWzpow3 = extWz.^3;
Skewz = sum(extWzpow3)/(sum(extWzpow2))^1.5;

Skew = (Skewx^2 + Skewy^2 + Skewz^2)^0.5;

%Zero Crossing Rate
ZCRx = sum(abs(diff(Wx>0)))/length(Wx);
ZCRy = sum(abs(diff(Wy>0)))/length(Wy);
ZCRz = sum(abs(diff(Wz>0)))/length(Wz);

ZCR = (ZCRx^2 + ZCRy^2 + ZCRz^2)^0.5;

%cwtmean
cwtmx=imag(mean(mean(cwt(Wx))));
cwtmy=imag(mean(mean(cwt(Wy))));
cwtmz=imag(mean(mean(cwt(Wz))));

cwtmean = (cwtmx^2 + cwtmy^2 + cwtmz^2)^0.5;

%cwtvar
cwtvx=mean(var(cwt(Wx)));
cwtvy=mean(var(cwt(Wy)));
cwtvz=mean(var(cwt(Wz)));

cwtvar = (cwtvx^2 + cwtvy^2 + cwtvz^2)^0.5;

end

