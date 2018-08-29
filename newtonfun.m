function [xv, fxv, n, flag] = newtonfun (f, f1, x0, toll, nmax)

%NEWTONFUN Metodo di Newton
% Uso:
%   [xv, fxv, n, flag] = newtonfun (f, f1, x0, toll, nmax)
%
% Dati di ingresso:
%   f:      funzione
%   f1:     derivata prima
%   x0:     valore iniziale
%   toll:   tolleranza richiesta per il valore assoluto
%           della differenza di due iterate successive
%   nmax:   massimo numero di iterazioni permesse
%
% Dati di uscita:
%   xv:     vettore contenente le iterate
%   fxv:    vettore contenente i corrispondenti residui
%   n:      numero di iterazioni effettuate
%   flag:   Se flag = 1 la derivata prima si e’ annullata

n = 0;
flag = 0;
diff = toll + 1;

x = x0; 

xv = [];
fxv = [];

while diff >= toll && n < nmax && flag == 0
    
    f1x = feval(f1, x);
    if f1x == 0
        flag = 1;
    else
        fx = feval(f, x);
        xv = [xv; x];
        fxv = [fxv; fx];
        diff = -(fx / f1x);
        x = x + diff;
        diff = abs(diff);
        n = n + 1;
    end
end



        

        




