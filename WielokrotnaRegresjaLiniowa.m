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

% Transpozycja wektorów do postaci kolumnowej
Y = y'; 
X = x'; 
X = [ones(size(X)) X X * 10]; 

% Wykonanie regresji wielomianowej dla danych
A = regress(Y, X); 

% Obliczenie wartości przybliżonych dla dopasowanej linii trendu
Ye = A' * X'; 

% Rysowanie wykresu
figure(1) 
plot(x, y, '*', 'LineWidth', 2); 
grid; 
hold on 
xlabel('x'); ylabel('y'); 
plot(x, Ye, 'k', 'LineWidth', 3); 
title('Regresja Wielomianowa Wielu Zmiennych')
