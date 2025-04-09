% This code if for the book titled: Processing Surface Seismic Reflection
% Data Using MATLAB by Wail A. Mousa & Abdullatif A. Al-Shuhail
% September 2011.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Chapter 5 part 2 %%%
%%% Spiking deconvolution of the whole data shot gather %%
clear,clc,close all
%Loading the processed seismic data and its header
load Book_Seismic_Data_gain_z_bpf.mat
%Extracting a certain shot gather or a group of shot gathers from the data matrix D and header structure H
[nt,nx]=size(Dbpf);
dt = H(1).dt/1000/1000;
t=[0:1:nt-1]*dt;

%%
mu=0.1;
max_lag=0.2;
Ds=spiking_decon(Dbpf,max_lag,mu,dt);
%%
%Performing amplitude gain correction using the independent amplitude
%correction methods
agc_gate=0.5;
T=2; %normalize with trace rms value
Ds_gain=AGCgain(Ds,dt,agc_gate,T);
%%
save Book_Seismic_Data_gain_bpf_sdecon_gain Ds_gain H
