clear all; clc;
data = xlsread('stratum lens.xlsx');
x = data(:,1);
y = data(:,2);
colors = log(data(:,3));

[XGrid, YGrid] = meshgrid(linspace(min(x), max(x), 80), linspace(min(y), max(y), 15)); % Adjust grid size as needed
CGrid = griddata(x, y, colors, XGrid, YGrid, 'cubic');

color17 = [87,12,93]; color16 = [176,19,59]; color15 = [250,21,17];    
color14 = [255,31,30]; color13 = [255,152,38]; color12 = [240,164,21];     
color11 = [255,255,49]; color10 = [167,240,28]; color9 =  [18,176,42]; 
color8 =  [59,236,39]; color7 =  [54,238,163]; color6 =  [125,247,248]; 
color5 =  [38,159,243]; color4 =  [29,58,198]; color3 =  [35,29,185]; 
color2 =  [29,20,156]; color1 =  [27,11,114]; 
colors = [color1; color2; color3; color4; color5; color6; color7; color8; color9; color10; color11; color12; color13; color14; color15; color16; color17]./255;
custom_cmap = interp1(linspace(0,1,17), colors, linspace(0, 1, 256));

figure;
set(gcf, 'Position', [100, 100, 700, 240]);  
pcolor(XGrid, YGrid, CGrid);
shading interp; 
colormap(custom_cmap);
