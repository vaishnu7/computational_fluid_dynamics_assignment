%LW scheme - function 2
clc;
clear;
close all;
format long
%define variables
xmin = 0;
xmax = 1;
N = 100;
dt = 0.009;
t = 0;
tmax = 0.1;
C = 1;

%discretise the domain
dx = (xmax - xmin)/N;
x = xmin - dx : dx : xmax + dx;
index = 1;
for i = x
    if i <= 0.25
        u0(index) = 1.0;
        exact = u0;
    else
        u0(index) = 0.0;
        exact = u0;
    end
    index = index + 1;
end
u = u0;
un = u0;

lambda1 = 0.25;
lambda2 = 0.5;
lambda3 = 0.75;
lambda4 = 1.0;

%time loop
nsteps = tmax/dt;
for n = 1 : nsteps
 
    %calculate LW scheme
    for i = 2:N+2
        un(i) = u(i) - (lambda2/2)*(u(i+1)-u(i-1)) + (lambda2^2/2)*(u(i+1)-2*u(i)+u(i-1));
    end
    %update
    t = t+dt;
    u = un;
    %plot
    plot(x,exact,'r-');
    hold on
    plot (x,u,'bo-','markerfacecolor','b');
    hold off
    axis([xmin,xmax,-0.5,1.5])
    xlabel('x','fontsize',16)
    ylabel('U(t,x)','fontsize',16)
    title(sprintf('time = %1.2f',t),'fontsize',16)
    shg
    pause(dt);
end
