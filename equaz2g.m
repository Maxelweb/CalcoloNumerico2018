% ----------------------
%
%	Esercizio 1 - Lezione 2
%	Risolvere l'equazione di secondo grado a coeff. reali.
%
% ----------------------

fprintf('Esercizio 2 - Soluzioni equaz. di secondo grado con formule instabili \n')
a = input('Valore di a: ');
b = input('Valore di b: ');
c = input('Valore di c: ');

if(a == 0 || b == 0 || c == 0) 
    fprintf('[ERRORE] Uno dei valori inseriti è nullo. Riprova. \n');
else
    delta = (b^2)-(4*a*c);
    
    if(delta < 0) 
    	fprintf('[ERRORE] Il discriminante risulta negativo! \n');
    else
    		
    	x1 = (-b-sqrt(delta))/(2*a);
    	x2 = (-b+sqrt(delta))/(2*a);
    
    	fprintf('Il valore di x1 = %1.0e \nIl valore di x2 = %1.0e \n', x1, x2);
    
    end
end

