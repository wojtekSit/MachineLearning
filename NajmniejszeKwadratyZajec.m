% Czyszczenie zmiennych, zamknięcie okien i wyczyszczenie konsoli
clearvars
close all
clc

% wartości
num_elements=100; % Liczba elementów w wektorze
a=2; 
b=6; 
c=3; 

a=a*-1; % Modyfikacja zmiennej a przez pomnożenie przez -1
x=1:1:num_elements;

% funkcje
y=a*x+b*randn(1, num_elements);
y=y+c;

Y=y';
X=x';
X=[ones(size(X)) X];

xm=sum(x)/length(x);
ym=sum(y)/length(y);

a1=(sum((x-xm) .* (y-ym)))/(sum((x-xm).^2)); % Obliczenie współczynnika nachylenia 'a1' dla regresji liniowej
a0=ym-(a1*xm); % Obliczenie współczynnika 'a0' dla regresji liniowej

B3=[a0; a1]; % Utworzenie wektora współczynników 'B3' dla regresji liniowej
ye3=X*B3; % Obliczenie wartości przybliżonych dla dopasowanej linii trendu w trzecim przypadku

% Wizualizacja danych i dopasowanej linii trendu
figure(1)
plot(x, y, "*")
hold on
plot(x, ye3, "k")
title('Min squares regression [266263]')
legend('values', 'regression')

R23=1-sum((y-ye3').^2)/sum((y-mean(y)).^2);
% obliczanie współczynnika korelacji R^2
