

% --------------------------
%   Minimi quadrati - script
% --------------------------

x = [-3.490 -2.948 -2.574 -2.157 -1.377 -1.234 -0.861 -0.116 0.235 0.558 1.036 1.318 2.139 2.566 2.736 3.312];
b = [27.200 4.720 -0.978 4.100 16.013  19.656 22.498 21.650 16.770 12.671 4.042 -2.158 -16.901 -11.437 -13.449 31.184]; 

x = x';
b = b';

m1 = length(x);
A = [ones(m1,1) x x.^2 x.^3 x.^4 ];

M = A'*A;
z = A'*b;
a = M\z;

y = linspace(min(x), max(x), 200);
yy = polyval(flipud(a), y);

clf;
plot(x, b, 'b*', y, yy, 'r-'); 
hold on;
legend('Dati minimi quadrati', 'Approssimazione minimi quadrati');
hold off;