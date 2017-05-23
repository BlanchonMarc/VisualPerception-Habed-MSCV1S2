%% Lab Camera Auto Calibration 

clear all;
close all;
clc;


format long;    %setting format to long

addpath('Data');    %adding the patgh of the data folder to avoid mixing the file types
load('data.mat'); %loading data
addpath('Functions');

%global Fs;

%% Display the intrinsic parameters

fprintf('Display the Intrincic Parameters : \n');
disp(A);

%% Mendoca Cipolla
fprintf('MENDOCA CIPOLLA -----------------------------------------------------')


%Optimization optimset used in the case of non linear function and / or multiple variables 
%This is correlated with Gauss-Newton optimization and Gradient.
Al = [A(1,1) A(1,3) A(2,2) A(2,3)]

int_params_lin = lsqnonlin('cost_function_MC',Al,[],[],optimset('Algorithm','levenberg-marquardt')); %Solve non linear least square

int_params_lin

%% Kruppa

fprintf('KRUPPA --------------------------------------------------------------')

init_params = [A(1,1) A(2,2) A(1,2) A(1,3) A(2,3)];
options = optimset('TolFun' , 1e-32 , 'TolX' , 1e-32 );
[cost] = lsqnonlin(@(parameters)cost_function_Kruppa(Fs , parameters),init_params,[],[],options);
cost