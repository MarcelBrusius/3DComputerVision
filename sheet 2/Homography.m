alpha_x = 5500;
alpha_y = 5500;
x_0 = 2376;
y_0 = 1632;
s  = 0;

H1 = [0.432 0 -6526.43; 0.296727 1 -2337.02; 0.000181818 0 -0.432];
H2 = [-0.0468504 0.990566 889.185; -1.00065 -0.0373135 4269.05; -4e-007 -2.58182e-006 1.05136];
H3 = [7.35483e+006  3.17728e+006 -7.45936e+008; -9.00706e-010  2.18238e+006 -3.73894e+008; -1.00277e-029 1337.24 -3121.12];


K = [ x_0 s alpha_x; 0 y_0 alpha_y; 0 0 1];

R_rel_1 = inv(K)*H1*K;

R_rel_2 = inv(K)*H2*K;

if equal(eye(3),R_rel_2'*R_rel_2)
    disp('Rotation matrix property fulfilled.')
else
    disp('Rotation matrix property not fulfilled.')
    [U,~,V] = svd(R_rel_2);
    R_rel_2_corrected = U*V';
end
    


