function getstrainstress(datf, node, elem, eltp, mater, u, dofpos)
%
% getstrainstress(datf, node, elem, mater, data, u, dofpos)
%
% function that saves the strain and stress vectors for the structure
% from element data
%
% Inputs:
%       datf - data file name
%       node - nodal coordinates
%       elem - element matrix
%       eltp - element type matrix
%       mater - material data
%       u - diplacement vector
%       dofpos - positioning of the degrees of freedom
%
nelem = size(elem, 1);
strain = zeros(nelem, 6);
stress = zeros(nelem, 6);
for ielem = 1 : nelem
    % element type
    eltpe = eltp(elem(ielem, 1), :);
    % material type
    matere = mater(elem(ielem, 2), :);
    if eltpe == 'tetra4'
        % get nodal coordinates of the element (nodel) and the
        % displacement vector of the element (uel) [12 x 1]
        m = 1;
        for i = 1 : 4
            for j = 1 : 3
                nodee(i, :) = node(elem(ielem, 2 + i), :);
                ue(m, :) = u(dofpos(elem(ielem, 2 + i), j));                
                m = m + 1;
            end
        end
        % get strains and stresses from the element
        [results] = tetra4(nodee, matere, ue, 'P');
    end
    strain(ielem, :) = results(1, :);
    stress(ielem, :) = results(2, :);
end
%
% save to output file
save([datf '.mat'], 'strain', 'stress', '-append')
