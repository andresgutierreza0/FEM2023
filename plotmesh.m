function plotmesh(inpname)
%
% plotmesh(inpname)
%
% function that plots the mesh of the input data file for TRIM3
%
% Input:
%	inpname - name of the input data file without extension
%
% load model data file
eval(inpname)
% setup
box on;
hold on;
grid on;
rotate3d on;
title('Mesh Plot');
set(gca, 'DataAspectRatio', [1 1 1]);
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
		x = node(elem(i, face(j, :) + 2), 1);
		y = node(elem(i, face(j, :) + 2), 2);
		z = node(elem(i, face(j, :) + 2), 3);
		patch(x, y, z, 'b');
	end
end 