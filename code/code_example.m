%--------------------------------------------------------------------------
% File Name: code_example.m
% Description: This is a MATLAB code example
%
% Software Information:
% - MATLAB Version: R2024a
% - Operating System: Windows 10
%--------------------------------------------------------------------------

% Combine contour plot and quiver plot
[U,V] = gradient(Z,0.2,0.2);
hold on
quiver(X,Y,U,V)
hold off