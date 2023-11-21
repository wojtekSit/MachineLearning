% Czyszczenie zmiennych, zamknięcie okien i wyczyszczenie konsoli
clearvars
close all
clc

% Liczba elementów w wektorze
num_elements = 50;

% Wartości używane do generowania danych
a = -2; 
b = 5; 
c = 7; 

% Tworzenie wektorów x i y
x = 1:1:num_elements; 
y = a * x + b * randn(1, num_elements); 
y = y + c; 

% Obliczenie współczynnika kierunkowego 'B1' dla pierwszego przypadku regresji liniowej
B1 = y / x;

% Obliczenie wartości przybliżonych dla dopasowanej linii trendu w pierwszym przypadku
ye1 = B1 * x;

% Rysowanie wykresu pierwszego przypadku regresji liniowej
plot(x, y, '*') 
hold on
plot(ye1)

% Transponowanie wektorów do postaci kolumnowej
Y = y';
X = x';
X = [ones(size(X)) X];

% Obliczenie współczynników 'B2' dla regresji liniowej
B2 = X \ Y;
% Obliczenie wartości przybliżonych dla dopasowanej linii trendu w drugim przypadku
ye2 = X * B2;

% Rysowanie wykresu drugiego przypadku regresji liniowej
figure(2)
plot(x, y, '*', 'LineWidth', 2); grid; hold
xlabel('x'); ylabel('y');
plot(x, ye2, 'k', 'LineWidth', 3);
title('Prosta Regresja Liniowa (współczynniki nachylenia i przesunięcia)')

% Obliczenie współczynnika korelacji R^2 dla dwóch przypadków regresji liniowej
R21 = 1 - sum((y - ye1).^2) / sum((y - mean(y)).^2);
R22 = 1 - sum((y - ye2).^2) / sum((y - mean(y)).^2);

% Obliczenie wartości średnich dla x i y
xm = sum(x) / length(x);
ym = sum(y) / length(y);

% Obliczenie współczynników 'a1' i 'a0' dla regresji liniowej
a1 = (sum((x - xm) .* (y - ym))) / (sum((x - xm).^2));
a0 = ym - (a1 * xm);

% Utworzenie wektora współczynników 'B3' dla regresji liniowej
B3 = [a0; a1]; 

% Obliczenie wartości przybliżonych dla dopasowanej linii trendu w trzecim przypadku
ye3 = X * B3;

% Rysowanie wykresu trzeciego przypadku regresji liniowej
figure(3)
plot(x, y, '*', 'LineWidth', 3); grid; hold
xlabel('x'); ylabel('y');
plot(x, ye3, 'k', 'LineWidth', 3);
title('Regresja Liniowa')

% Obliczenie współczynnika korelacji R^2 dla trzeciego przypadku regresji liniowej
R23 = 1 - sum((y - ye3').^2) / sum((y - mean(y)).^2);
