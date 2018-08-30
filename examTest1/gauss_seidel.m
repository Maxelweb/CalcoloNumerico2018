function [xv,res,flag]=gauss_seidel(A,b,x0,toll,nmax)
% gauss_seidel: Metodo di Gauss-Seidel.
% Uso:
% [xv,res,flag]=gauss_seidel(A,b,x0,toll,nmax)
%
% Dati di ingresso:
% A: matrice n x n.
% b: vettore colonna n x 1
% x0: vettore colonna n x 1
% toll: tolleranza del criterio di arresto
% nmax: numero massimo di colonne di xv (numero di iterazioni meno 1).
%
% Dati di uscita:
% xv: matrice contenente quali colonne i vettori determinati dal metodo (incluso x0).
% res: vettore contenente i valori norm(b-Ax_k) dove x_k e? la k-sima colonna di xv.
% flag: 1 se il determinante e? nullo;
% 2 se il numero di colonne di xv e? strettamente maggiore di nmax;
% 3 se la matrice A e il vettore b non sono compatibili come dimensioni;
% 0 altrimenti.

flag = 0;
k = 1;
xv = [];
res = [];

n1 = size(A, 1);
n2 = size(A, 2);
n3 = size(b, 1);
n4 = size(b, 2);

if n1 ~= n2 || n3 ~= n2 || n4 ~= 1
    flag = 3;
    return;
elseif det(A) == 0
    flag = 1;
    return;
end

D = diag(diag(A)); % Matrice diagonale di A
E = -triu(A, 1); % Parte inferiore senza la diag
F = -tril(A, -1); % Parte superiore senza la diag

M = D - E; 
N = F;
% Bg = inv(M)*N; --> Inutile
xv = x0;
test = toll+1;

while k < nmax && test >= toll
    
    xL0 = xv(:, end);
    xL1 = M\(N*xL0+b);
    xv = [xv xL1];
    
    test = norm(b - A * xL1); % Attenzione! Si prende xL1 che è l'iterata nuova corrente
    res = [res; test];
    k = k+1;
end

if size(xv, 2) > nmax
    flag = 2;
    xv = [];
    res = [];
    return;
end