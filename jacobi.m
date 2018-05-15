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
% flag vale 0 se e’ stato possibile costruire la matrice di iterazione
% vale 1 se la matrice M=D risulta singolare

x1 = 0;
k = 0;
flag = 0;
x = [x0];
x1 = x0 + (2*rand(1));

while(norm(x1 -x0) < toll && k < kmax && ~flag)

    x1 = x0;
    D = diag(diag(A));
    E = -tril(A, -1); 
    F = -triu(A, 1);
    
    if(det(D) == 0)
        flag = 1;
    else
        B = inv(D)*(E+F);
        q = inv(D)*b;
        x1 = (B*x0 + q);
        x = [x x1];
        k = k+1;
    end
end


if(flag == 1) 
    fprintf('La matrice risulta singolare!');
else
    fprintf('La matrice non è singolare!'); 
end

end

