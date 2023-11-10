function linelfem(inpname)
%
% linelfem(inpname)
%
% main routine of the finite element code for linear elastic computations
%
% Input:
%	inpname - input file name
%
% -----------------------------------------------------------------------
% INPUT DATA FILE
% -----------------------------------------------------------------------
% read data file
[node, nnode, elem, nelem, eltp, mater, pdof, npdof, ...
       nodf, nnodf] = getdata(inpname);
% show some info on the data
ndof = 3 * nnode;
fprintf(1, '\n  datafile  = %9s \n \n', inpname);
fprintf(1, ['\n  nelem  = %9i  nnode  = %9i  ndof   = %9i\n  npdof  = %9i  nnodf  = %9i \n'], ...
    nelem, nnode, ndof, npdof, nnodf);
% basic positioning of the degrees of freedom of the structure in 3D
% line = node number, column 1: diplacement x, column 2: displacement y column 3: displacement z
dofpos = [1 : 3 : (3 * nnode - 2); 2 : 3 : (3 * nnode - 1); 3 : 3 : (3 * nnode)]';
% save input data to file
save([inpname '.mat'], 'node', 'elem', 'eltp', 'mater', 'pdof', 'nodf', 'dofpos');
% -----------------------------------------------------------------------
% EXTERNAL FORCE VECTOR
% -----------------------------------------------------------------------
% the external point load force vector
Fp = getpforce(nodf, dofpos);
% the volume force from the finite elements
% Fv = getvforce(node, elem, eltp, dofpos);
Fv = zeros(ndof, 1);
% the surface force from the finite elements
% Fs = getsforce(node, elem, eltp, dofpos);
Fs = zeros(ndof, 1);
% the total external force vector
Fext = Fp + Fv + Fs;
%
% -----------------------------------------------------------------------
% STIFFNESS MATRIX
% -----------------------------------------------------------------------
% assembly of the structural stiffness matrix
Ksys = assembly(node, elem, eltp, mater, dofpos);
%
% apply the boundary conditions
method = -1;
[Kcl, Fcl] = boundcond(pdof, Ksys, Fext, method, dofpos);
%
% -----------------------------------------------------------------------
% SOLVE THE SYSTEM
% -----------------------------------------------------------------------
u = Kcl\Fcl;
%
% -----------------------------------------------------------------------
% POST-PROCESSING OF THE RESULTS
% -----------------------------------------------------------------------
% save displacement data
getdispla(inpname, u, dofpos);
% save the reaction forces
getreaction(inpname, Ksys, u, dofpos)
% save strains and stresses
getstrainstress(inpname, node, elem, eltp, mater, u, dofpos);
%
