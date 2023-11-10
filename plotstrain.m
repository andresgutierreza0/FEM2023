function plotstrain(inpname, fact, comp)
%
% plotstrain(inpname, fact, comp)
%
% function that plots the strain distribution in the deformed configuration
%
% Input:
%	inpname - name of the input data file without extension
%	fact - multiplication factor of the displacements
%   comp - strain component to plot
%
% load model data file 
if exist([inpname '.mat'],'file') ~= 2
  error(['Data file not found: ', inpname, '.'])
end
eval(inpname);
load(inpname);
% labels
labels = ['exx'; 'eyy'; 'ezz'; 'exy'; 'exz'; 'eyz'];
% positions
position = node + fact * displa;
% colorbar limits
c_min = min(strain(:, comp));
c_max = max(strain(:, comp));
if c_min == c_max
	c_min = c_min - 1;
	c_max = c_max + 1;
end
caxis([c_min c_max]);
% setup
box on;
hold on;
grid on;
colorbar;
rotate3d on;
shading flat;
set(gca, 'DataAspectRatio', [1 1 1]);
title(sprintf('Strain Plot - deformed factor: %+4.2f component: %s', fact, labels(comp, :)));
% tetraedra faces
face = [
	1, 2, 3;
	1, 2, 4;
	1, 3, 4;
	2, 3, 4
];
% plot
for i = 1 : size(elem, 1)
	for j = 1 : 4
		x = position(elem(i, face(j, :) + 2), 1);
		y = position(elem(i, face(j, :) + 2), 2);
		z = position(elem(i, face(j, :) + 2), 3);
		c = strain(i, comp);
		patch(x, y, z, c);
	end
end