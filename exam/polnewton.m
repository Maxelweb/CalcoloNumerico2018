

function c = polnewton (x,y)
% POLNEWTON Calcola i coefficienti del polinomio interpolatore
% utilizzando la forma di Newton con le differenze divise
%
% Uso:
% c = polnewton (x,y)
%
% Dati di ingresso:
% x vettore dei nodi
% y vettore dei valori della funzione da interpolare nei nodi
%
% Dati di uscita:
% c vettore colonna dei coefficienti ordinati per indici
% crescenti (c_0, c_1, ... )


n = length(x);
if n ~= length(y)
    fprintf('\n Errore! La tabulazione non contiene lo stesso numero di componenti \n');
end

% Si può usare anche solo error() e beep;

for i = 1:1:n
    ca(i, 1) = y(i);
end

for j = 2:1:n
    for i = 1:1:(n-j+1)
        ca(i,j) = (ca(i+1,j-1) - ca(i,j-1)) / (x(i+j-1) - x(i));
    end
end

% fprintf("\n -> Vettore coefficienti: \n");
 
c = ca(1, :); % recupero solamente la prima colonna

