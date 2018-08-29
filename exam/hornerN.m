

function fxstar = hornerN (x,c,xstar)
% HORNERN Calcola il valore del polinomio interpolatore in x^*
% utilizzando la forma di Newton e l'algoritmo di Horner
%
% Uso:
% fxstar = hornerN (x,c,xstar)
%
% Dati di ingresso:
% x vettore dei nodi
% c vettore dei coefficienti della forma di Newton
% ordinati per indici crescenti (c_0, c_1, ... )
% xstar valore in cui si vuole valutare il polinomio
%
% Dati di uscita:
% fxstar valore di P(x^*)

n = length(x);

if n ~= length(c)
    fprintf('\n Errore! Incosistente numero di componenti \n');
end

u = c(n);
for j = (n-1):-1:1
    u = u .* (xstar - x(j)) + c(j);
end

fxstar = u; % recupero il vettore fxstar
  
