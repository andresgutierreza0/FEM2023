function [Ksys] = assembly(node, elem, eltp, mater, dofpos)
%
% [Ksys] = assembly(node, element, geom, mater, data)
%
% function that assembles the structural stiffness matrix from the element
% stiffness matrix contributions
%
% Inputs:
%	node - nodal coordinates matrix of the structure
%	elem - element defintion matrix of the structure
%   eltp - element type matrix
%	mater - material properties data of the structure
%   dofpos - position of the degrees of freedom
%
% Output:
%	Ksys - stiffness matrix of the complete system [ndof x ndof]
%
% number of elements in the structure
nelem = 
% total number of degrees of freedom of the structure
ndof = 
% initialize Ksys to empty sparse
Ksys = 
%
for ielem = 1 : nelem
    % nodes of the element
    nodee = 
    % material data of the element
    matere =
    % element type of the element
    eltpe = eltp(elem(ielem, 1), :);
    % call element as a function of its type to get its stiffness matrix
    if eltpe == 'tetra4'
    
    end
    % determine the positioning of the dof in the unkowns

    % add element contribution to the structural stiffness matrix
    
end
%
