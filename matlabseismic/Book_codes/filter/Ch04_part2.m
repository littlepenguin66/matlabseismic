% This code if for the book titled: Processing Surface Seismic Reflection
% Data Using MATLAB by Wail A. Mousa & Abdullatif A. Al-Shuhail
% September 2011.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Chapter 4 part 2 %%%
%%% Frequency analysis of seismic data: f-x shot gathers & BPF filtering them%%
clear,clc,close all
%Loading the pre-processed seismic data and its header
load Book_Seismic_Data_gain_z.mat
%%
%Extracting a certain shot gather or a group of shot gathers from the data matrix D and header structure H
shot_num=8;%shot gather number(or range like 1:5 or 2:17)
p=0;%Dispalying the offset (only for a signle shot gather)
% p=1;%Dispalying each trace numbers
[Dshot,dt,dx,t,offset]=extracting_shots(Dgz,H,shot_num,p);
%%
%Displaying the data in wiggle 
scale=2;
mwigb(Dshot,scale,offset,t)
if (length(shot_num)==1 && p==0) 
    xlabel('Offset (ft)','FontSize',14)
else
    xlabel('Trace number','FontSize',14)
end
ylabel('Time (s)','FontSize',14)
%%
%Frequency-space (f-x) representation of the data
[Data_f,f]=fx(Dshot,dt);
%Plotting the magnitude spectrum in dB of the seismic f-x representation
figure,pcolor(offset,f,20*log10(fftshift(abs(Data_f),1))),
shading interp;
axis ij;
colormap(jet)
colorbar
if (length(shot_num)==1 && p==0) 
    xlabel('Offset (ft)','FontSize',14)
else
    xlabel('Trace number','FontSize',14)
end
ylabel('Frequency (Hz)','FontSize',14)
set(gca,'xaxislocation','top')
x=10;y=10;%starting screen position
w=300;%figure width
h=600;%figure hieght
set(gcf,'position',[x y w h]);
axis([min(offset),max(offset),0,max(f)])%Diplaying +ve frequencies
%%
%Band-pass filtering (BPF) of the seismic data to attenuate ground-roll noise
N=100;%BPF FIR filter length
cut_off=[15,60];%BPF cut-off frequencies in Hz
[Dbpf,Dbpf_f]=bpf_fir(Dshot,dt,N,cut_off);
%%
%Displaying the BPF data in wiggle 
scale=2;
figure,mwigb(Dbpf,scale,offset,t)
if (length(shot_num)==1 && p==0) 
    xlabel('Offset (ft)','FontSize',14)
else
    xlabel('Trace number','FontSize',14)
end
ylabel('Time (s)','FontSize',14)
%%
%Plotting the magnitude spectrum in dB of the seismic f-x representation
%after BPF
figure,pcolor(offset,f,20*log10(fftshift(abs(Dbpf_f),1))),
shading interp;
axis ij;
colormap(jet)
colorbar
if (length(shot_num)==1 && p==0) 
    xlabel('Offset (ft)','FontSize',14)
else
    xlabel('Trace number','FontSize',14)
end
ylabel('Frequency (Hz)','FontSize',14)
set(gca,'xaxislocation','top')
axis([min(offset),max(offset),0,max(f)])%Diplaying +ve frequencies
x=10;y=10;%starting screen position
w=300;%figure width
h=600;%figure hieght
set(gcf,'position',[x y w h]);
%%
%Plotting the difference:
figure,mwigb((Dshot-Dbpf),scale,offset,t)
if (length(shot_num)==1 && p==0) 
    xlabel('Offset (ft)','FontSize',14)
else
    xlabel('Trace number','FontSize',14)
end
ylabel('Time (s)','FontSize',14)
%%
%Frequency-space (f-x) representation of the data
[Data_f,f]=fx((Dshot-Dbpf),dt);
%Plotting the magnitude spectrum in dB of the seismic f-x representation
figure,
pcolor(offset,f,20*log10(fftshift(abs(Data_f),1)))
shading interp;
axis ij;
colormap(jet)
colorbar
if (length(shot_num)==1 && p==0) 
    xlabel('Offset (ft)','FontSize',14)
else
    xlabel('Trace number','FontSize',14)
end
ylabel('Frequency (Hz)','FontSize',14)
set(gca,'xaxislocation','top')
axis([min(offset),max(offset),0,max(f)])%Diplaying +ve frequencies
x=10;y=10;%starting screen position
w=300;%figure width
h=600;%figure hieght
set(gcf,'position',[x y w h]);