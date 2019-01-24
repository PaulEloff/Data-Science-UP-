function [t,w]=euler(f,a,b,alpha,N)
% define fixed parameters
h = (b-a)/N; % number of grid intervals
% initialize solution vectors
t(1) = a; % initial time
w(1) = alpha; % initial condition
% loop in time 
for k = 1:N
   t(k+1,:) = t(k) + h; % time update
   w(k+1,:) = w(k) + h*f(t(k),w(k)); % Euler solver
end
% exact solution
t_e = linspace(a,b,100); %only for plotting exact solution
u_exact = @(t)sin(t)+exp(-20*t);
% visualising the solution    
plot(t,w,'-o'); hold on; plot(t_e,u_exact(t_e),'k')   
xlim([a b]); legend('approximate','exact')
