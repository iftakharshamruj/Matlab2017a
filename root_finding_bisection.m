clc;
clear all;
close all;

f=@(x) -exp(-0.75*x)+10*sin(2*x);
eqn=@(x) -exp(-0.75*x)+10*sin(2*x)==0;
x_true = double(solve(eqn))
x_l=-1;
x_u=1;
for i=1:10
    x_r=(x_l+x_u)/2;
    x_r_old=x_r
    if f(x_r)*f(x_u)>0
        x_u=x_r;
    else
        x_l=x_r;
    end
end
x_l=-1;
x_u=1;
x_r_old=x_r
for i=1:10
    x_r=(x_l+x_u)/2;
    error1(i)=abs((x_r-x_r_old)/x_r)
    error2(i)=abs((x_true-x_r)/x_true)
    if f(x_r)*f(x_u)>0
        x_u=x_r;
    else
        x_l=x_r;
    end
end
figure;
plot(error1);
title('Plot of error')
xlabel('Number of iterations')
ylabel('Error1')
figure;
plot(error2);
title('Plot of error')
xlabel('Number of iterations')
ylabel('Error2')