% This code if for the book titled: Processing Surface Seismic Reflection
% Data Using MATLAB by Wail A. Mousa & Abdullatif A. Al-Shuhail
% September 2011.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Chapter 2 part 2 %%%
%%% Displaying seismic shot gathers %%
clear,clc,close all
%Loading the raw seismic data and its header
load shotdata.mat
%load Book_Seismic_Data.mat
%%
%[D,H]=readsegy('dataout.su');
%load shotdata.mat
%Extracting a certain shot gather or a group of shot 
%gathers from the data matrix D and header structure H
shot_num=8;%shot gather number(or range like 1:5 or 2:17)
p=1;%Dispalying the offset values (only for a signle shot gather)
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
%Displaying the data in using gray-scaled variable density 
%images 
figure,
simage_display(Dshot,offset,t,0)
if length(shot_num)==1 && p==0
    xlabel('Offset (ft)','FontSize',14)
else
    xlabel('Trace number','FontSize',14)
end
ylabel('Time (s)','FontSize',14)
%%
%Displaying the data in using colored variable density images 
figure,
simage_display(Dshot,offset,t,1)
if length(shot_num)==1 && p==0
    xlabel('Offset (ft)','FontSize',14)
else
    xlabel('Trace number','FontSize',14)
end
ylabel('Time (s)','FontSize',14)

% resort the seismic data from shot garther to the cmp garth
[Dsort,Hsort]=ssort(D,H,'cdp');
%extracing the fold number and plot them
[cmps,fold_cmp]=extracting_cmp_fold_num(Dsort,Hsort);
figure,stem(cmps,fold_cmp,'-');
xlabel('CDP numbers','FontSize',14);
ylabel('Flod numbers','FontSize',14);
set(gca,'YminorGrid','on');
%extracting the cmp gather and mwigb

cmp_num=243;
[Dcdp,dt,t,cdp]=extracting_cmp(Dsort,Hsort,cmp_num);
scale=2;
figure,mwigb(Dcdp,scale,cdp,t);
xlabel(['CDP:',num2str(cmp_num),''],'FontSize',14);
ylabel('Time(s)','FontSize',14);
save dataaftersort.mat Dsort Hsort

