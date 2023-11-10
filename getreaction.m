function getreaction(datf, K, u, dofpos)
%
% getreaction(datf, K, u, dofpos)
% 
% function that saves the reaction forces of the structure
%
% Inputs:
%   datf - output data file name
%	K - structural stiffness matrix
%	u - displacement vector of the structure
%   dofpos - positioning of the degrees of freedom
%
Freac = 
% -----------------------------------------------------------------------
% rearrange results for post-processing
nnode = size(dofpos, 1);
R = zeros(nnode, 3);
for inode = 1:nnode
    % fill in reaction force along x
    R(inode, 1) = Freac(dofpos(inode, 1));
    % fill in reaction force along y
    R(inode, 2) = Freac(dofpos(inode, 2));
    % fill in reaction force along z
    R(inode, 3) = Freac(dofpos(inode, 3));
end
%
% save to output file
save([datf '.mat'], 'R', '-append')
