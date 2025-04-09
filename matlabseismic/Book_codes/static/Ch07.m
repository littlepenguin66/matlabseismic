% This code if for the book titled: Processing Surface Seismic Reflection
% Data Using MATLAB by Wail A. Mousa & Abdullatif A. Al-Shuhail
% September 2011.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Chapter 7 %%%
%%% Static correction %%
clear,clc,close all
%Loading the nmo-corrected seismic data and its header
load Book_Seismic_Data_gain_bpf_sdecon_gain_sorted_nmo_corrected

%Applying static correction
cmp_start=205;
cmp_end=255;
lags=20;
Dsort_static=scr_static(Dsort,Hsort,cmp_start,cmp_end,lags);
%Stacking the static corrected data
[Dstacked_static,t,cmp_num]=sstack(Dsort_static,Hsort);

%loading the stacked data (no static correction)
load('Book_Seismic_Data_gain_bpf_sdecon_gain_sorted_nmo_corrected_stacked',...
    'Dstacked');

%Displaying the stacked & the static correced stacked data
figure
simage_display(Dstacked,cmp_num,t,1);
xlabel('CMP','FontSize',14)
ylabel('Time (s)','FontSize',14)

figure
simage_display(Dstacked_static,cmp_num,t,1);
xlabel('CMP','FontSize',14)
ylabel('Time (s)','FontSize',14)

% save Book_Seismic_Data_gain_bpf_sdecon_gain_sorted_nmo_corrected_static_stacked cmp_num t Dstacked



