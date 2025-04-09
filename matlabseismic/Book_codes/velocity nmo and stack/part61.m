%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%This code is for the seismic processing velocity analysis , normal
% moveout and stack
% September 2019-04-05.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          % code procesing steps %
          % sorting the data to cmp gather%
          % extracting one cmp gather to show %
          % set 6 paramters to velocity analysis %
          % velocity picking 
          % nmo correction
          % show corrected cmp gather
          %stack
          %show stack result 
 %here we use Book_Seismic _Data_gain_z_bpf.mat
clear,clc,close all
%load Book_Seismic_Data_gain_z_bpf.mat
%Sorting the decon gained data
load rawshotdata_agc.mat
D=Dagc;
%[Dsort,Hsort]=ssort(Dbpf,H);
[Dsort,Hsort]=ssort(D,H);
%extracting cmp fold
[cmps,fold_cmp]=extracting_cmp_fold_num(Dsort,Hsort);
figure,stem(cmps,fold_cmp,'-');
xlabel('CMP numbers','FontSize',14);
ylabel('Fold','FontSize',14);
set(gca,'YMinorGrid','on');
cmp_num=230;%cmp gather number(or range like 1:5 or 2:17)
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

cmp_step=10;
cmp_start=220;
cmp_end=230;
vmin = 1000;%minimum velocity
dv=100;%velocity increment
nv = 51;%number of velocities
n_pts=3;%number of velocities points you want pick per CMP
[v_stack,t_stack]=vel_picking(Dsort,Hsort,vmin,dv,nv,cmp_start,cmp_end,cmp_step,n_pts);

% nmo correction
Max_Stretch=100
[Dsortnmo,Hsortnmo]=nmo_correction(Dsort,Hsort,v_stack,t_stack,cmp_start,cmp_end,cmp_step);

%Displaying the data in wiggle 
[Dcmp,dt,t,cdp,jj,cmp_offset1]=extracting_cmp(Dsortnmo,Hsortnmo,cmp_num);
[nt,nx]=size(Dcmp);

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

