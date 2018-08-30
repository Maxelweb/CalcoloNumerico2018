function [xv,steps,flag]=metodo_schroder(f,f1,f2,x0,toll,nmax)
% metodo_schroder: Metodo di Schroder.
% Uso:
% [xv,steps,flag]=metodo_schroder(f,f1,f2,x0,toll,nmax)
%
% Dati di ingresso:
% f: funzione per cui si studia f(x)=0.
% f1: derivata prima di f.
% f2: derivata seconda di f.
% x0: approssimazione iniziale.
% toll: tolleranza richiesta (criterio step: abs(x(k)-x(k-1)) < toll, k=1,2,...).
% nmax: numero massimo di iterazioni (ovvero la lunghezza massima di xv e' nmax+1).
%
% Dati di uscita:
% xv: vettore contenente i valori x0, x1, ....
% steps: vettore contenente |x1-x0|, |x2-x1|, ...
% flag: 1 se il denominatore di qualche iterata del metodo di Schroder e' nullo;
% 2 se il test di arresto non e' verificato dopo "nmax" iterazioni;
% 0 altrimenti.

flag = 0;

% n = 1; % variabile ausiliaria, omissibile
xv = x0; % dentro xv c'è un elemento, x0, dunque n=1.

% x = x0; Evito variabili ausiliarie

steps = toll + 1;
%diff = steps;


while (length(xv) <= nmax) & (steps > toll) %&& diff >= toll
   
    fx = f(xv(end));
    f1x = f1(xv(end));
    f2x = f2(xv(end));
    
    num = fx * f1x;
    den = f1x^2 - fx*f2x;
    
    if den == 0
       flag = 1;
       break;
    end
    
    xv(end+1) = xv(end) - num/den;
    steps(end+1) = abs(xv(end) - xv(end-1));
    %diff = abs(-num/den);
    %n = n+1;
end

if length(xv) >= nmax
    flag = 2;
end


%if flag > 0
 %   xv = [];
 %   steps = [];
%end


