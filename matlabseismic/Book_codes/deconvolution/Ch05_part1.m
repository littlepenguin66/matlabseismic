% This code if for the book titled: Processing Surface Seismic Reflection
% Data Using MATLAB by Wail A. Mousa & Abdullatif A. Al-Shuhail
% September 2011.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Chapter 5 part 1 %%%
%%% Spiking deconvolution of shot gathers %%
clear,clc,close all
%Loading the processed seismic data and its header
%load Book_Seismic_Data_gain_z_bpf.mat
load rawshotdata_agc.mat
Dbpf(:,:)=Dagc(:,:);

%Extracting a certain shot gather or a group of shot gathers from the data matrix D and header structure H
shot_num=4:8%shot gather number(or range like 1:5 or 2:17)
p=0;%Dispalying the offset (only for a signle shot gather)
[Dshot,dt,dx,t,offset]=extracting_shots(Dbpf,H,shot_num,p);
[nt,nx]=size(Dshot);
%%
%Displaying the data in wiggle 
scale=1;
mwigb(Dshot,scale,offset,t)
if (length(shot_num)==1 && p==0) 
    xlabel('Offset (ft)','FontSize',14)
else
    xlabel('Trace number','FontSize',14)
end
ylabel('Time (s)','FontSize',14)
%%
%Computing the autocorrelogram the shot gathers
max_lag=0.2;
[Dauto,lags]=auto_correlation_map(Dshot,max_lag,dt);
%Displaying the auto-correlation data in wiggle 
scale=1;
figure,mwigb(Dauto,scale,offset,lags)
if (length(shot_num)==1 && p==0) 
    xlabel('Offset (ft)','FontSize',14)
else
    xlabel('Trace number','FontSize',14)
end
ylabel('Time lag (s)','FontSize',14)
%%
%Spiking Decon
mu=0.2;% 
max_lag=0.01;
Ds=spiking_decon(Dshot,max_lag,mu,dt);
%Displaying the data in wiggle 
scale=1;
figure,mwigb(Ds,scale,offset,t)
if (length(shot_num)==1 && p==0) 
    xlabel('Offset (ft)','FontSize',14)
else
    xlabel('Trace number','FontSize',14)
end
ylabel('Time (s)','FontSize',14)
%%
%Calculating the PSD for the average traces before spiking decon
Davg_before=mean(Dshot');
%Davg_before=Dshot(:,10);
fs=1/dt;
[Davg_before,f] = periodogram(Davg_before,[],2*nt,fs);
Davg_before=Davg_before/max(Davg_before);
Davg_before=20*log10(abs(Davg_before));

%Calculating the PSD for the average traces after spiking decon
Davg_after=mean(Ds');
%Davg_after=D(:,10);
[Davg_after,f] = periodogram(Davg_after,[],2*nt,fs);
Davg_after=Davg_after/max(Davg_after);
Davg_after=20*log10(abs(Davg_after));

%Plotting the PSD
ft=linspace(-0.5,0.5,2*nt)/dt;
figure,plot(f,Davg_before,f,Davg_after,'r--')
xlabel('Frequency (Hz)','FontSize',14)
ylabel('Normalized PSD','FontSize',14)
grid
legend('Before decon','After decon')
%%
%Performing amplitude gain correction using the independent amplitude
%correction methods
agc_gate=0.5;
T=2; %normalize with trace rms value
Ds_gain=AGCgain(Ds,dt,agc_gate,T);
%Displaying the data in wiggle 
scale=1;
figure,mwigb(Ds_gain,scale,offset,t)
if (length(shot_num)==1 && p==0) 
    xlabel('Offset (ft)','FontSize',14)
else
    xlabel('Trace number','FontSize',14)
end
ylabel('Time (s)','FontSize',14)