function [Kcl, Fcl] = boundcond(pdof, Ksys, Fext, method, dofpos)
%
% [Kcl, Fcl] = boundcond(node, nndof, dofpos, method, Ksys, Fext)
%
% function that applies the boundary conditions to the structural system
%
% Inputs:
%   pdof - prescribed degrees of freedom matrix from the input file
%	Ksys - structural stiffness matrix without the boundary conditions
%	Fext - external force vector without the boundary conditions
%	method - if method < 0 direct method
%		 if method > 0 penalty method (Z = method)
%	dofpos - positioning matrix of the degrees of freedom
%
% Outputs:
%	Kcl - structural stiffness matrix with the boundary conditions applied
%	Fcl - external force vector with the boundary conditions applied
%
% total number of nodes in the structure
nnode = 
% the total number of degrees of freedom of the system
ndof = 
% the number of nodal degrees of freedom
ndof_node = 
% initialize Kcl and Fcl
Fcl = 
Kcl = 
%
if method < 0
    % solution by the direct method
    %
    
else
    % solution by the penalty method
    Z = method;
    % check for the value of Z! (is it high enough?)
    %
    
end
%