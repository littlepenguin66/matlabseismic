clc;
clear;

[D,H]=readsegy('bhd.su');
for i=1:2040
    H(i).fldr=H(i).sx;
end
save input.mat D H