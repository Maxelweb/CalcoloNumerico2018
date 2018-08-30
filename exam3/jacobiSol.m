function [x,k,flag] = jacobiSol (A,b,x0,toll,kmax)

% JACOBI Metodo di Jacobi per la risoluzione di un sistema lineare
%        con test di arresto sulla norma della differenza di due
%        iterate successive
%
% Uso:
%   [x,k,flag] = jacobi (A,b,x0,toll,kmax)
%
% Dati di ingresso:
% A  matrice dei coefficienti
% b  vettore colonna dei termini noti
% x0 vettore colonna iniziale
%   toll tolleranza per il test di arresto
%   kmax numero massimo di iterazioni
%
% Dati di uscita:
%   x    array che contiene per colonne le iterate (vettori) del metodo
%   k    numero delle iterazioni effettuate
%   flag vale 0 se e? stato possibile costruire la matrice di iterazione
%        vale 1 se la matrice M=D risulta singolare

iter = 0;

Dv=diag(A);

% Analizza diagonale, cosi' da vedere se e' eseguibile il metodo di Jacobi.
if prod(Dv) == 0
    flag=1;
else
    flag=0;
end

if flag == 0
    M = diag(Dv); % Costruzione matrici di iterazione.
    N = M-A;
    % rho=max(abs(eig(inv(M)*N))); % RAGGIO SPETTRALE.
    x=x0;
    for k = 1:kmax                            % begin iteration
        xL0 = x(:,end);
        xL1 = M\(N*xL0+b);                       % update approximation
        error = norm(xL1-xL0)/norm(xL1);         % compute error
        x=[x xL1];
        if ( error <= toll ) 
            break;
        end         % check convergence
    end
    
else
    x=[];
    k=0;
end