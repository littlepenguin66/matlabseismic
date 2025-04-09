function [f,o] = predictive(w,NF,L,mu);  
%PREDICTIVE: Predictive deconvolution filter
%
%  Desings a predictive error filter of Prediction
%  lag L.
%
%  [f,o] = PRECITIVE(w,NF,L,mu)
%
%  IN     w: the wavelet
%         NF: lenght if the inverse filter
%         L: Prediction distance
%         mu: Prewhitening in %    
%
%  OUT    f: the filter
%         o: the ouput or convolution of the filter with 
%            the wavelet 
%
%  Example:
%
%  w = [8,7,6,5,4,3,2,1,0];                  % the wavelet
%  [f,o] =  predictive(w,20,4,0.1);          % the filter and the output
%  figure(1); plot(f);title('Filter')     
%  figure(2); plot(o);title('Wavelet \otimes Filter')
%
%
%  SeismicLab
%  Version 1
%
%  written by M.D.Sacchi, last modified December 10,  1998.
%  sacchi@phys.ualberta.ca 
%
%  Copyright (C) 1998 Seismic Processing and Imaging Group
%                     Department of Physics
%                     The University of Alberta
%
%

NW = max(size(w));    % lenght of the wavelet

NO = NW+NF-1;         % Leght of the output      

[mc,mr]=size(w);
if mc <= mr; w = w'; end;


b = zeros(1,NO)';
b = [w(L+1:NW)',zeros(1,NO-NW+L)]';

C = convmtx(w,NF);   % Convolution matrix 
 
R = C'*C+mu*eye(NF)/100.;    %  Toeplitz Matrix
rhs = C'*b;                  %  Right hand side vector 
f = inv(R)*rhs;              %  Filter 

if nargout == 2
if L==1; f = [1,-f']'; else
f = [1,zeros(1,L-1),-f']';
end;

o = conv(f,w);        %  Actual output
end

return

