
% Script per Gauss Seidel

n = 10;

A = diag(2*ones(n, 1)) + diag(-1*ones(n-1, 1), 1) + diag(-1*ones(n-1, 1), -1);
b = ones(n, 1);
x0 = zeros(n, 1);
toll = 10^(-8);
nmax = 10000;

[xv, res, flag] = gauss_seidel(A, b, x0, toll, nmax);

if flag ~= 0
    beep;
    switch flag
        case 1
            error("Il determinante è nullo.");
        case 2
            error("Il numero delle colonne di xv è maggiore di nmax");
        case 3
            error("Le dimensioni della matrice A e/o del vettore b sono discordi.");
        otherwise
            error("Errore sconosciuto");
    end
else
    semilogy(1:size(res, 1), res, "-r");
end