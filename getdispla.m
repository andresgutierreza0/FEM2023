function getdispla(datf, u, dofpos)
%
% getdispla(datf, u, dofpos)
% 
% function that saves the displacements of the structure
%
% Inputs:
%   datf - output data file name
%	u - displacement vector of the structure
%   dofpos - positioning of the degrees of freedom
%
% rearrange results for post-processing
nnode = size(dofpos, 1);
displa = zeros(nnode, 3);
for inode = 1 : nnode
    % fill in displacement along x
    displa(inode, 1) = u(dofpos(inode, 1));
    % fill in displacement along y
    displa(inode, 2) = u(dofpos(inode, 2));
    % fill in displacement along z
    displa(inode, 3) = u(dofpos(inode, 3));
end
%
% save to output file
save([datf '.mat'], 'displa', '-append')
