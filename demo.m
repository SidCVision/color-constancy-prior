% This is a demo script demonstrating the COLOR CONSTANCY PRIOR algorithm.
% Described in the paper:
% An improved Air-light estimation scheme for single haze images using color constancy prior. IEEE-SPL-2020,
% Author: SIDHARTH GAUTAM, TAPAN KUMAR GANDHI, B.K. PANIGRAHI 2020. 
% INDIAN INSTUTUTE OF TECHNOLOGY, DELHI, INDIA.

close all;
clear;
clc;
addpath('images');
addpath('GTairlights');
%% Read the input haze image.
HazeImg = 'Castle.png';
I = imread(HazeImg);
%% Parameter Initialization
wsz=15;
alpha = 10;
gaama = 0.4;
%% Estimating the global Air-light using COLOR CONSTANCY PRIOR (CCP).
tic
A = Airlight_CCP(I, wsz, alpha, gaama); 
fprintf('Elapsed time for Air-light estimation is: %f seconds. \n',toc')
%%  Displaying the estimated Airlight and Ground truth airlight on haze image.
GTairlightFileName = strcat('GTairlight_',HazeImg(1:end-4),'.mat');
GTairlightExists = exist(GTairlightFileName,'file');
try
    load(GTairlightFileName)
    Z = Airlight_Map(I, A, GTairlight);
catch
    error("GTairlight does not exist for the hazy image!")
end





