clearvars
close all
clc

num_elements=50;
a=-2;
b=5;
c=7;
x=1:1:num_elements;
y=a*x+b*randn(1,num_elements);
y=y+c;

Y=y';
X=x';
X=[ones(size(X)) X];

A=randn(2,1);
alpha=0.00001;
epochs=30;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('optimazion...');
figure(1)
grid on;
hold on;

box on;
figure(2)
grid on;
hold on;
xlabel('number of epoch');
ylabel('error');

tic;
for k = 1:epochs
    %alpha=length(X)/(1.0+(k*length(X)));
    beta=0.0001*(length(X)/(1.0+(k*length(X))));
    figure(1);
    plot(k,beta,'or');
    
    for n_data = 1:length(X)
        ye=X(n_data,:)*A;
        e=(Y(n_data,:)-ye);
        D_A=beta*e*X(n_data,:);
        A=A+D_A';
    end
    ye=X*A;
    e_epoch=mse(Y,ye);
    figure(2);
    plot(k,e_epoch,'*m');
end

training_time=toc;

box on;
figure(3)
plot(x, y, 'o')
grid on;
hold on;
plot(x, ye)
