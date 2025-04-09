function [Sfor,Smig,ARG] = propagator(v,nx,nz,nt,dx,dz,dt);
%PROPAGATOR: compute downward and upward propagator 
%
%  This is used to run Gazdag migration/modeling
%
%  [Sfor,Smig,ARG] = propagator(v,nx,nz,nt,dx,dz,dt);
%
%  IN    v: propagation velocity in m/s
%        nx,nz: image size
%        dx,dz: grid size in meters
%        dt: time interval in secs
%
%  OUT   Sfor: Phase shift propagator for forward modeling
%        Smig: Phase shift propagator for migration
%        ARG: wavenumber matrix
%
%
%  SeismicLab
%  Version 1
%
%  written by M.D.Sacchi, and H. Kuehl, last modified April/2001
%  sacchi@phys.ualberta.ca
%




 dkx=2*pi/(nx*dx);
 dw=2*pi/(nt*dt);
 kx=[0:dkx:(nx/2)*dkx -((nx/2)*dkx-dkx):dkx:-dkx];
 w =[0:dw:(nt/2)*dw -((nt/2)*dw-dw):dw:-dw];
 index=find(w == 0);
  w(index)=1E-18;
 [kx w] = meshgrid(kx,w);
 ARG = 1.0-(kx.^2*v^2)./(w.^2);
 index=find(ARG < 0.);
 ARG(index) = 0.;

 Sfor = zeros(nt,nx);
 Sfor = exp(-i*w/v.*sqrt(ARG)*dz);
 Sfor(index) = 0.0;

 Smig = zeros(nt,nx);
 Smig = exp(i*w/v.*sqrt(ARG)*dz);
 Smig(index) = 0.0;


return

