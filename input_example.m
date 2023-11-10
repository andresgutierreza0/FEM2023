% nodal coordinates [x y z]
node = [
	0	0	0
	1	0	0
	0	1	0
	0	0	1
];
    

% mesh connectivity 
% [type# material# node1 node2 node3 node4]   
elem = [
	1	1	1	2	3	4
];

% prescribed degrees of freedom (displacements)
% [node# dir value]
pdof = [
	1	1	0
	1	2	0
  1 3 0
  2 2 0
  2 3 0
  3 1 0
  3 3 0
];


% applied point/nodal loads
% [node# dir value]
nodf = [
  4 3 10
];

% finite element type
eltp = ['tetra4'];

% material parameters
E = 1000; % elastic modulus
nu = 0.3; % Poisson's ratio

% material parameter matrix
mater = [    
  E nu
  ];
