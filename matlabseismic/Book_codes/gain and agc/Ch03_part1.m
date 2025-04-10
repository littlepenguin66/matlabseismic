% This code if for the book titled: Processing Surface Seismic Reflection
% Data Using MATLAB by Wail A. Mousa & Abdullatif A. Al-Shuhail
% September 2011.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Chapter 3 part 1 %%%
%%% Pre-processing and quality control: Zero-traces %%
clear,clc,close all
%Loading the raw seismic data and its header
%load Book_Seismic_Data
%load rawshotdata.mat
addpath('../Codes/', '../../Book_Data')
load rawshotdata.mat
Dg = D;
%%
%Extracting a certain shot gather or a group of shot gathers from the data matrix D and header structure H
shot_num = 17; %shot gather number 16 is having a trace amplitude problem
p = 0; %Dispalying the offset (only for a signle shot gather)
% p=1;%Dispalying each trace numbers
[Dshot, dt, dx, t, offset] = extracting_shots(Dg, H, shot_num, p);
%%
%Displaying the data in wiggle
scale = 1;
mwigb(Dshot, scale, offset, t)

if (length(shot_num) == 1 && p == 0)
    xlabel('Offset (ft)', 'FontSize', 14)
else
    xlabel('Trace number', 'FontSize', 14)
end

ylabel('Time (s)', 'FontSize', 14)
%%
%Performing zero tracing after the amplitude gain correction using the independent amplitude
%power correction method. This is since some ampliudes have jumped
%Zero-traces data
[i, j] = find(Dg == max(max(Dg)));
Dg(:, j) = 0;
Dgz = Dg;
%%
%Extracting a certain shot gather or a group of shot gathers from the data matrix D and header structure H
p = 0; %Dispalying the offset (only for a signle shot gather)
[Dshot, dt, dx, t, offset] = extracting_shots(Dgz, H, shot_num, p);
%%
%Displaying the data in wiggle
scale = 1;
figure, mwigb(Dshot, scale, offset, t)

if (length(shot_num) == 1 && p == 0)
    xlabel('Offset (ft)', 'FontSize', 14)
else
    xlabel('Trace number', 'FontSize', 14)
end

ylabel('Time (s)', 'FontSize', 14)
