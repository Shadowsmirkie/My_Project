clc;
clear all;
close all;

image = imread("car-1.jpg");
rotTheta = 20;
skewTheta = 50;

% Rotation followed by skewing transformation
outImageRS = rotAndSkew(image,rotTheta,skewTheta);

% Skewing followed by rotation transformation
outImageSR = skewAndRot(image,rotTheta,skewTheta);

% Image display

