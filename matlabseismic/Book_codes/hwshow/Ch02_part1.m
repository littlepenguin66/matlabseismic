% This code if for the book titled: Processing Surface Seismic Reflection
% Data Using MATLAB by Wail A. Mousa & Abdullatif A. Al-Shuhail
% September 2011.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%$ Chapter 2 part 1 %%%
%%% Examining the real seismic data set headers%%
clear,clc,close all
%Loading the raw seismic data and its header
%load('Book_Seismic_Data.mat','H')
[D,H]=readsegy('data2.su');


%Extracting a certain shot gather or a group of shot gathers from the data matrix D and header structure H
[sx,sy,gx,gy,shot_gathers,num_trace_per_sg,sz,gz]=extracting_geometry(H);
%%
%Plotting the number of seismic traces versus the number shot gathers 
figure,stem(shot_gathers,num_trace_per_sg)
xlabel('Shot gather numbers','FontSize',14)
ylabel('Number of traces/shot gather','FontSize',14)
axis([0,max(shot_gathers)+1,0,max(num_trace_per_sg)+2])
set(gca,'YMinorGrid','on')

%%
%Plotting the number of sources x-axis locations versus the number of traces 
figure,plot(sx,'.')
xlabel('Number of traces','FontSize',14)
ylabel('Sources x-axis locations (ft)','FontSize',14)
axis tight
grid 
%%
%Plotting the number of receivers x-axis locations versus the number of traces 
figure,plot(gx,'.')
xlabel('Number of traces','FontSize',14)
ylabel('Receivers x-axis locations (ft)','FontSize',14)
axis tight
grid
%%
%Plotting the sources elevation versus the number of traces 
figure,plot(sz,'*-')
xlabel('Number of traces','FontSize',14)
ylabel('Sources elevation (ft)','FontSize',14)
grid 
 
%%
%Plotting the receivers elevation versus the number of traces 
figure,plot(gz,'*-')
xlabel('Number of traces','FontSize',14)
ylabel('Receivers elevation (ft)','FontSize',14)
grid 

%%
%Stacking Chart
num_shots=length(shot_gathers);
stacking_chart(sx,gx,num_shots,num_trace_per_sg)

save C:\Users\liugf\Desktop\matlabseismic\Book_Data\rawshotdata.mat D H