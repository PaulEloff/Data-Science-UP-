function w = fdiff(n)

A = zeros(n,n);
% input data: e.g., p = sin(x) is input as p = @(x)sin(x)
p     = @(x)...;
q     = @(x)...;
r     = @(x)...;
a     = 1;
b     = 2;
alpha = ...;
beta  = ...;

% initialization
h    = (b-a)/(n+1);
x(1) = a + h;
% loading matrix A and right hand side vector d (for Ax = d)
% first row
A(1,1) = ...;
A(1,2) = ...;
d(1,1) = ...;

% rows 2 to n-1
for i=2:n-1    
    x(i) = a + i*h;
    %
    A(i,i-1) = - (2 + h*p(x(i)));
    A(i,i)   = (4 + 2*h^2*q(x(i)));
    A(i,i+1) = - (2 - h*p(x(i)));
    d(i,1)   = - 2*h^2*r(x(i));
end

% final row
x(n)     = b - h;
A(n,n-1) = - (2+h*p(x(n)));
A(n,n)   = ...;
d(n,1)   = - 2*h^2*r(x(n)) + (2-h*p(x(n)))*beta;

% solve for w (use first gauss.m then jacobi.m)
w = method(A,d);
w = [alpha w' beta];
x = [a x b];
% display the solution numerically and graphically
plot(x,w,'r-o');
