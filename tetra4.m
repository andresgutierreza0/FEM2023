function [out] = tetra4(nodee, matere, ue, key)
%
% [out] = tetra4(nodee, matere, ue, key)
% 
% TETRA4 finite element for 3D strain/stress analysis
%
% Inputs:
%	nodee - nodal coordinates of the element nodes [x y z] x node
%	matere - material data of the element
%	ue - displacement vector of the element [ux uy uz] x nnode
%	key - if key = 'K' the output is the stiffness matrix of the element
%	      if key = 'P' the output is the stress and strain
%
% Output:
%	out - depends on the value of 'key'
%


%key
if key == 'K'
	%compute the stiffness matrix of the finite element

elseif key == 'P'
	%post-processing step, compute the strain and stress matrix

else    
    fprintf(1, '\n Unknown key when calling TETRA4 element routine! \n')
end
