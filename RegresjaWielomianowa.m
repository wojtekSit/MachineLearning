% Czyszczenie zmiennych, zamknięcie okien i wyczyszczenie konsoli
clearvars
close all
clc

% Liczba elementów w wektorze
num_elements = 50;

% Wartości używane do generowania danych
a = 4; 
b = 6; 
c = 5;

% Tworzenie wektorów x i y
x = 1:1:num_elements; 
y = a * x + b * randn(1, num_elements); 
y = y + c; 

% Transpozycja wektorów do postaci kolumnowej
Y = y'; 
X = x'; 

% Wykonanie regresji liniowej dla danych
w = polyfit(x, y, 1); 

% Obliczenie wartości przybliżonych dla dopasowanej linii trendu
ye = polyval(w, x); 

% Rysowanie wykresu
figure(1) 
plot(x, y, '*k', 'LineWidth', 3); 
grid; 
hold on 
plot(x, ye, 'r', 'LineWidth', 3); 
xlabel('x'); ylabel('y'); 
title('Regresja Wielomianowa')
