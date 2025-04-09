% This code if for the book titled: Processing Surface Seismic Reflection
% Data Using MATLAB by Wail A. Mousa & Abdullatif A. Al-Shuhail
% September 2011.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Chapter 8 %%%
%%% Migration %%
clear,clc,close all

load Book_Seismic_Data_gain_bpf_sdecon_gain_sorted_nmo_corrected_stacked
load Book_Seismic_Data_gain_bpf_sdecon_gain_sorted_velocities.mat


%%
v=mean(mean(v_stack));%Taking the mean velocity 
Dstacked=Dstacked(:,1:60);%Removing the zero trace
cmp_num=cmp_num(1:60);
dx=110;
dt=0.002;
v=6000
dx=50
%Stolt migration
Dmigrated=stolt_mig(Dstacked,v,dt,dx,t);

%Displaying the data
figure
simage_display(Dstacked,cmp_num,t,0);
xlabel('CMP','FontSize',14) 
ylabel('Time (s)','FontSize',14) 
title('Stacked section','FontSize',14)

figure
simage_display(Dmigrated,cmp_num,t,0);
xlabel('CMP','FontSize',14) 
ylabel('Time (s)','FontSize',14) 
title('Migrated section','FontSize',14)

