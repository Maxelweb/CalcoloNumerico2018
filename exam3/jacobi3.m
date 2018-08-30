function [x,k,flag] = jacobi3 (A,b,x0,toll,kmax)
% JACOBI Metodo di Jacobi per la risoluzione di un sistema lineare
% con test di arresto sulla norma della differenza di due
% iterate successive

% FARE ATTENZIONE ALL'USO DI .* E *--> IL PRIMO DA' UN PRODOTTO VETTORIALE,
% IL SECONDO SCALARE.

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


k = 0;
flag = 0;

D = diag(diag(A));

if det(D) == 0
    flag = 1; beep; 
    error("Errore! La matrice è singolare."); 
end

if flag == 0
    M = D; % Matrice Diagonale
    N = M-A; % Triangolo sup e inf senza diagonale
    B = inv(M)*N;
    q = inv(D)*b;
    x = x0;
    test = toll+1;
    
    while(k < kmax && test > toll)
        k = k+1;
        
        xL0 = x(:,end); % Ricavo l'ultima colonna di x, ossia Xk
        
        % Ora devo calcolare la nuova iterata Xk+1. Per farlo, applico la
        % formula del libro con Bj.
        % ALTERNATIVAMENTE:  xL1 = M\(N.*xL0 + b) ==>  Ossia (N * Xk + b) / D
        xL1 = B*xL0 + q;
       % xL1 = M\(N*xL0+b); 
        
        x = [x xL1]; % Incremento il vettore X inserendo il nuovo risultato di Xk+1
        
        test = norm(xL1-xL0) / norm(xL1); % Eseguo il test sulla norma per verificarne la tolleranza
    end
else
    x = [  ];
    k = 0;
end

beep;
