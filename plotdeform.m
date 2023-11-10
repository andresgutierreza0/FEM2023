function plotdeform(inpname, fact, comp)
%
% plotdeform(inpname, fact)
%
% function that plots the deformed mesh for TRIM3
%
% Input:
%	inpname - name of the input data file without extension
%	fact - multiplication factor of the displacement
%	comp - displacement component
%
% load model data file 
if exist([inpname '.mat'], 'file') ~= 2
	error(['Data file not found: ', inpname, '.'])
end
eval(inpname);
load(inpname);
% labels
labels = ['ux'; 'uy'; 'uz'];
% positions
position = node + fact * displa;
% colorbar limits
c_min = min(displa(:, comp));
c_max = max(displa(:, comp));
caxis([c_min c_max]);
% setup
box on;
hold on;
grid on;
colorbar;
rotate3d on;
set(gca, 'DataAspectRatio', [1 1 1]);
title(sprintf('Deformed Plot - factor: %+4.2f component: %s', fact, labels(comp, :)));
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
		c = displa(elem(i, face(j, :) + 2), comp);
		patch(x, y, z, c);
	end
end