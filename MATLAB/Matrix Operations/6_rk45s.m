function [t,w]=rk45s(f,a,b,alpha,h)
% input: f(t,y) using, e.g. f = @(t,u)u^2+t^2;
% NOTE: that for a system, we have to vectorize all entries with f defined
% as f=@(t,u)[u(1)^2+t^2+u(2),u(1)+t+u(2)]
% input a and b from: a < t < b,
% input values for the initial condition: y(a) = alpha;
N      = (b-a)/h; % or input h, and find N
t(1)   = a;
w(1,:) = alpha;
% main loop
for k = 1:N
    k1 = h*f(t(k),w(k,:));
    k2 = h*f(t(k)+h/2,w(k,:)+k1/2);
    k3 = h*f(t(k)+h/2,w(k,:)+k2/2);
    k4 = h*f(t(k)+h,w(k,:)+k3);
    % find the next approximation
    w(k+1,:) = w(k,:) + (k1 + 2*k2 + 2*k3 + k4)/6;
    t(k+1,:) = t(k) + h;
end
