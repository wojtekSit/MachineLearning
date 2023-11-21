clearvars
close all
clc

num_elements=50;
a=0.7;
b=0.2;
c=0.5;
x = (linspace(0, 1, num_elements));
y=a*x+b*randn(1,num_elements);
y=y+c;

Y=y';
X=x';
X=[ones(size(X)) X];

A=randn(2,1);
alpha=0.00001;
epochs=30;

options=optimset('Display','iter','MaxIter',200,'TolFun',0,'TolX',0);

cost_function=@(params)-1/length(X)*sum((Y.*log(logsig(X*params')))+((1-Y).*log(1-logsig(X*params'))));

params_init=randn(1, size(X,2));
params_low_bounds=[];
params_up_bounds=[];

params_optim=lsqnonlin(cost_function, params_init, params_low_bounds, params_up_bounds, options);

ye1 = logsig(params_optim(1)*X(:,1)+params_optim(2)*X(:,2));

R2_1 = 1 - sum((y-ye1').^2) / sum((y-mean(y)).^2);

figure(3)
%legend({'Values', 'Regress line'}, 'Location', 'northwest');
plot(x, y, 'o')
hold on;
grid on;
plot(x, ye1,'k', 'LineWidth', 2);
