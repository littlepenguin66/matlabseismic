% This code if for the book titled: Processing Surface Seismic Reflection
% Data Using MATLAB by Wail A. Mousa & Abdullatif A. Al-Shuhail
% September 2011.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Chapter 3 part 2 %%%
%%% Pre-processing and quality control: Independent amplitude correction %%
clear,clc,close all
%Loading the raw seismic data and its header
load ../../Book_Data/rawshotdata.mat
addpath('../Codes/')
%load Book_Seismic_Data.mat
%%
%Extracting a certain shot gather or a group of shot gathers from the data matrix D and header structure H
shot_num=8;%shot gather number(or range like 1:5 or 2:17)
p=0;%Dispalying the offset (only for a signle shot gather)
% p=1;%Dispalying each trace numbers
[Dshot,dt,dx,t,offset]=extracting_shots(D,H,shot_num,p);
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
%Performing amplitude gain correction using the independent amplitude
%correction methods
pow=2;%Power value
T=0; %Time correction
% T=1; %Exp correction
Dg=iac(Dshot,t,pow,T);
%Displaying the processed data in wiggle
scale=1.5;
figure,mwigb(Dg,scale,offset,t)
if (length(shot_num)==1 && p==0) 
    xlabel('Offset (ft)','FontSize',14)
else
    xlabel('Trace number','FontSize',14)
end
ylabel('Time (s)','FontSize',14)
%%
%Plotting the amplitude envelopes for the traces of the above shot gather
%before and after gain correction
%Selecting one trace
tnum=33; 
seis_env_dB(Dshot,Dg,t,tnum)
%%
%Average trace amplitude envelope
seis_env_dB(Dshot,Dg,t)
