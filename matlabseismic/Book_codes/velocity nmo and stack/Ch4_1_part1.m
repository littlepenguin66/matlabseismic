% This code is for the seismic processing velocity analysis , normal
% moveout and stack
% September 2019-04-05.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Chapter 6 part 1 %%%
%%% Sorting the data from shot gathers to CMP gathers %%
clear,clc,close all
%Loading the processed seismic data and its header
%load Book_Seismic_Data_gain_bpf_sdecon_gain.mat
% this data can be anydata in shot gather after pre-step procesing.
%here we use Book_Seismic _Data_gain_z_bpf.mat
load Book_Seismic_Data_gain_z_bpf.mat
%Sorting the decon gained data
[Dsort,Hsort]=ssort(Dbpf,H);
%extracting cmp fold
[cmps,fold_cmp]=extracting_cmp_fold_num(Dsort,Hsort);
figure,stem(cmps,fold_cmp,'-');
xlabel('CMP numbers','FontSize',14);
ylabel('Fold','FontSize',14);
set(gca,'YMinorGrid','on');
cmp_num=230;%shot gather number(or range like 1:5 or 2:17)
p=0; % if p=1 the horizontal axis is not offset but nx
[Dcmp,dt,t,cdp,jj,cmp_offset1]=extracting_cmp(Dsort,Hsort,cmp_num);
[nt,nx]=size(Dcmp);
%Displaying the data in wiggle 
scale=1;
if nx>1;
    figure,mwigb(Dcmp,scale,cdp,t)
    xlabel('Trace number','FontSize',14)
    ylabel('Time (s)','FontSize',14)
    title(['CMP: ',num2str(cmp_num),''],'FontSize',14)
else% for a single trace (sometimes you may have a CMP with a signle trace)
    figure
    plot(Dcmp,t,'k'),
    hold on
    area(Dcmp.*(Dcmp>0),t),colormap([0,0,0]),
    hold off
    axis tight
    xlabel('Trace number','FontSize',14)
    ylabel('Time (s)','FontSize',14)
    set(gca,'YDir','reverse','XAxisLocation','Top')
end

cmp_step=5;
cmp_start=230;
cmp_end=231;
vmin = 4000;%minimum velocity
dv=200;%velocity increment
nv = 51;%number of velocities
n_pts=8;%number of velocities points you want pick per CMP
[v_stack,t_stack]=vel_picking(Dsort,Hsort,vmin,dv,nv,cmp_start,cmp_end,cmp_step,n_pts);
% save Book_Seismic_Data_gain_bpf_sdecon_gain_sorted_velocities.mat v_stack t_stack cmp_step cmp_start cmp_end
%[Dstacked,t,cmp_num]=sstack(Dsort,Hsort);
Max_Stretch=100
[Dsortnmo,Hsortnmo]=nmo_correction(Dsort,Hsort,v_stack,t_stack,cmp_start,cmp_end,cmp_step,Max_Stretch);


[Dcmp,dt,t,cdp,jj,cmp_offset1]=extracting_cmp(Dsortnmo,Hsortnmo,cmp_num);
[nt,nx]=size(Dcmp);
%Displaying the data in wiggle 
scale=1;
if nx>1;
    figure,mwigb(Dcmp,scale,cdp,t)
    xlabel('Trace number','FontSize',14)
    ylabel('Time (s)','FontSize',14)
     title(['CMP After NMO: ',num2str(cmp_num),''],'FontSize',14)
else% for a single trace (sometimes you may have a CMP with a signle trace)
    figure
    plot(Dcmp,t,'k'),
    hold on
    area(Dcmp.*(Dcmp>0),t),colormap([0,0,0]),
    hold off
    axis tight
    xlabel('Trace number','FontSize',14)
    ylabel('Time (s)','FontSize',14)
    set(gca,'YDir','reverse','XAxisLocation','Top')
end



%Stacking the data
[Dstacked,t,cmp_num]=sstack(Dsortnmo,Hsortnmo);
%Displaying the data
scale=1;
figure
mwigb(Dstacked,scale,cmp_num,t)
xlabel('CMP','FontSize',14) 
ylabel('Time (s)','FontSize',14)  

figure
simage_display(Dstacked,cmp_num,t,0);
xlabel('CMP','FontSize',14) 
ylabel('Time (s)','FontSize',14) 

figure
simage_display(Dstacked,cmp_num,t,1);
xlabel('CMP','FontSize',14) 
ylabel('Time (s)','FontSize',14) 
save Book_Seismic_Data_stackedcmp_numtDstacked

