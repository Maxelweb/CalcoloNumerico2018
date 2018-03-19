% ----------------------
%
%	Esercizio 3 - Lezione 2
%	Risolvere un equazione di secondo grado di qualsiasi genere.
%
% ----------------------

fprintf('Esercizio 3 - Soluzioni equaz. di secondo grado di qualsiasi genere \n');
fprintf('------------\n');
a = input('Valore di a: ');
b = input('Valore di b: ');
c = input('Valore di c: ');

if a == 0
	if b == 0
		if c == 0
			fprintf('[!] Equazione indeterminata.\n');
		else
			fprintf('[!] Equazione impossibile\n');
		end
	else
		x1 = (-c / b);
		fprintf('Equazione di grado 1. \nUnica soluzione in x = %1.5f \n', x1);
	end
else
	
    delta = (b^2)-(4*a*c);
    
    switch sign(delta)
    	
    	case -1
    	
    		fprintf('[!] Nessuna soluzione reale.\n');
    	
    	case 0
    	
    		x1 = (-b/(2*a));
 			fprintf('Due soluzioni coincidenti (x1 = x2)\n');
    		fprintf('x1 = x2 = %1.5f \n', x1);
    	
    	otherwise

    		% x1 = (-b-sign(b)*(sqrt(delta)))/(2*a);
    		% x2 = (c / (a * x1));
    		
    		x1 = (-b-sqrt(delta))/(2*a);
    		x2 = (-b+sqrt(delta))/(2*a);
    		fprintf('Due soluzioni distinte (x1 != x2)\n');
    		fprintf('x1 = %1.5f \nx2 = %1.5f \n', x1, x2);
    
    end
end

fprintf('------------\n');

