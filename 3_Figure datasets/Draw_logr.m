clear all; clc;
% Load data from the Excel file
data = xlsread('stratum lens.xlsx');
x = data(:,1);
y = data(:,2);
colors = log(data(:,3));

% Reshape the data for pcolor
[XGrid, YGrid] = meshgrid(linspace(min(x), max(x), 80), linspace(min(y), max(y), 15)); % Adjust grid size as needed
CGrid = griddata(x, y, colors, XGrid, YGrid, 'cubic');

original_color17 = [87,12,93];  
original_color16 = [176,19,59];  
original_color15 = [250,21,17];    
original_color14 = [255,31,30];
original_color13 = [255,152,38];      
original_color12 = [240,164,21];     
original_color11 = [255,255,49];      
original_color10 = [167,240,28];   
original_color9 =  [18,176,42]; 
original_color8 =  [59,236,39]; 
original_color7 =  [54,238,163]; 
original_color6 =  [125,247,248]; 
original_color5 =  [38,159,243]; 
original_color4 =  [29,58,198]; 
original_color3 =  [35,29,185]; 
original_color2 =  [29,20,156]; 
original_color1 =  [27,11,114]; 

brighten_factor = 0;
brightened_colors = min([
    original_color1; 
    original_color2;
    original_color3;
    original_color4;
    original_color5;
    original_color6;
    original_color7;
    original_color8;
    original_color9;
    original_color10;
    original_color11;
    original_color12;
    original_color13;
    original_color14;
    original_color15;
    original_color16;
    original_color17
] + brighten_factor, 255)./255;

custom_cmap = interp1(linspace(0,1,17), brightened_colors, linspace(0, 1, 256));
figure;
set(gcf, 'Position', [100, 100, 700, 240]);  
pcolor(XGrid, YGrid, CGrid);
shading interp; 
colormap(custom_cmap);
