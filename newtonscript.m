
disp('METODO DI NEWTON');
disp(' -------------- ');

exprf = input('Scrivi la funzione = ', 's');
exprf1 = input('Scrivi la derivata = ', 's');
x0 = input('Scrivi il valore iniziale = ');
toll = input('Tolleranza desiderata = ');
nmax = input('Numero massimo di iterazioni = ');

f = inline(exprf);
f1 = inline(exprf1);


% chiede l'esecuzione della function che implementa il metodo di Newton
[xv, fxv, n, flag] = newtonfun (f, f1, x0, toll, nmax);
if flag == 1 % controlla l'annullamento della derivata prima
disp('La derivata si annulla nell''iterata');
disp(n);
disp('Ripetere l''esecuzione cambiando il valore iniziale');
elseif n ~= nmax  % Controlla il raggiungimento del numero massimo di iterazioni
% visualizza i risultati
disp(xv);
disp(fxv);
else % Raggiunto il numero massimo di iterazioni
disp('Raggiunto il numero massimo di iterazioni possibili');
disp('Ripetere l''esecuzione aumentando le iterazioni');
end
