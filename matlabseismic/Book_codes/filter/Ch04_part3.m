% This code if for the book titled: Processing Surface Seismic Reflection
% Data Using MATLAB by Wail A. Mousa & Abdullatif A. Al-Shuhail
% 3 July 2011.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Chapter 4 part 3 %%%
%%% Frequency analysis of seismic data: BPF filtering of all the shot gathers %%
clear,clc,close all
%Loading the pre-processed seismic data and its header
load Book_Seismic_Data_gain_z.mat
%Extracting a certain shot gather or a group of shot gathers from the data matrix D and header structure H
[nt,nx]=size(Dgz);
dt = H(1).dt/1000/1000;
t=[0:1:nt-1]*dt;
%%
%Band-pass filtering (BPF) of the seismic data to attenuate ground-roll noise
N=100;%BPF FIR filter length
cut_off=[15,60];%BPF cut-off frequencies in Hz
Dbpf=bpf_fir(Dgz,dt,N,cut_off);
%%
save Book_Seismic_Data_gain_z_bpf Dbpf H
