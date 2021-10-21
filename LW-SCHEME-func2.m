%%
%LW scheme - function 2
clc;
clear;
close all;
format long
%define variables
xmin = 0;
xmax = 1;
N = 50;
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
u1 = u0;
u2 = u0;
u3 = u0;
u4 = u0;
un1 = u0;
un2 = u0;
un3 = u0;
un4 = u0;


lambda1 = 0.25;
lambda2 = 0.5;
lambda3 = 0.75;
lambda4 = 1.0;

%time loop
nsteps = tmax/dt;
for n = 1 : nsteps
 
    %calculate LW scheme
    for i = 2:N+2
        un1(i) = u1(i) - (lambda1/2)*(u1(i+1)-u1(i-1)) + (lambda1^2/2)*(u1(i+1)-2*u1(i)+u1(i-1));
    end
    for i = 2:N+2
        un2(i) = u2(i) - (lambda2/2)*(u2(i+1)-u2(i-1)) + (lambda2^2/2)*(u2(i+1)-2*u2(i)+u2(i-1));
    end
    for i = 2:N+2
        un3(i) = u3(i) - (lambda3/2)*(u3(i+1)-u3(i-1)) + (lambda3^2/2)*(u3(i+1)-2*u3(i)+u3(i-1));
    end
    for i = 2:N+2
        un4(i) = u4(i) - (lambda4/2)*(u4(i+1)-u4(i-1)) + (lambda4^2/2)*(u4(i+1)-2*u4(i)+u4(i-1));
    end
    %update
    t = t+dt;
    u1 = un1;
    u2 = un2;
    u3 = un3;
    u4 = un4;
    %plot
    plot(x,exact,'r-');
    hold on
    plot (x,u1,'--','markerfacecolor','g');
    plot (x,u2,'--','markerfacecolor','b');
    plot (x,u3,'--','markerfacecolor','k');
    plot (x,u4,'--','markerfacecolor','r');
    hold off
    legend('exact sol','lambda = 0.25','lambda = 0.50','lambda = 0.75','lambda = 1.00');
    axis([xmin,xmax,-1.5,1.5])
    xlabel('x','fontsize',16)
    ylabel('U(t,x)','fontsize',16)
    title(sprintf('time = %1.2f',t),'fontsize',16)
    shg
    pause(dt);
end
