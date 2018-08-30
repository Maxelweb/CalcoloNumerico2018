function [x,k,flag] = jacobi (A,b,x0,toll,kmax)
% JACOBI Metodo di Jacobi per la risoluzione di un sistema lineare
% con test di arresto sulla norma della differenza di due
% iterate successive
%
% Uso:
% [x,k,flag] = jacobi (A,b,x0,toll,kmax)
%
% Dati di ingresso:
% A matrice dei coefficienti
% b vettore colonna dei termini noti
% x0 vettore colonna iniziale
% toll tolleranza per il test di arresto
% kmax numero massimo di iterazioni
%
% Dati di uscita:
% x array che contiene per colonne le iterate (vettori) del metodo
% k numero delle iterazioni effettuate
% flag vale 0 se e' stato possibile costruire la matrice di iterazione
% vale 1 se la matrice M=D risulta singolare

n = size(x0, 1); 
flag = 0;
k = 0;
x = x0; 
test = toll+1;


if det(A) == 0
    flag = 1;
end


while test >= toll && k < kmax && ~flag
    k = k+1;
    for i = 1:1:n
        y(i) = 0;
        for j = 1:1:(i-1)
            y(i) = y(i) + (A(i, j).*x(j));
        end
        for j = (i+1):1:n
            y(i) = y(i) + A(i,j).*x(j);
        end
        y(i) = (b(i, 1) - y(i))/A(i,i);
    end
    test = norm(y - x);
    x = y;
end

if flag == 1
    beep; 
    error("La matrice è singolare");
end



        