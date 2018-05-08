function [ ] = minquad( x, b )

% x = vettore colonna
% b = f(x) in vettore colonna

% x esercizio
% -3.490 -2.948 -2.574 -2.157 -1.377 -1.234 -0.861 -0.116 0.235 0.558 1.036 1.318 2.139 2.566 2.736 3.312 

% f(x) esercizio
% 27.200 4.720 -0.978 4.100 16.013  19.656 22.498 21.650 16.770 12.671 4.042 -2.158 -16.901 -11.437 -13.449 31.184


% Computazione dei dati

A = [ones(size(x,1),1) x x.^2 x.^3 x.^4]
M = A'*A;
z = A'*b;
a = M\z;


% Disegno del grafico

y = linspace(min(x), max(x), 200);

yy = polyval(flipud(a), y);

clf; plot(x, b, 'b*', y, yy, 'r-');
legend('Dati minimi quadrati', 'Approssimazione minimi quadrati');



end

