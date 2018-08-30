
% Script per test numerico
clf; 
f = @(x) exp(x).*(x.^2);
f1 = @(x) exp(x).*(2.*x + x.^2);
f2 = @(x) exp(x).*(2 + 4.*x + x.^2);

toll = 10^(-8);
nmax = 1000;
x0 = 0.1;

[xv, steps, flag] = metodo_schroder(f, f1, f2, x0, toll, nmax);

if flag > 0
    beep;
    switch flag
        case 1
            error("Il denominatore si è annullato durante l'iterazione.");
        case 2
            error("Il test di arresto non si è verificato dopo nmax");
        otherwise
            error("Errore sconosciuto");
    end
else
    fid = fopen('risultato.txt', 'w');    
    A = [1:length(xv)-1; xv(2:end)];
    fprintf(fid,'%3.0f %1.15e \n',A);
    fprintf(fid,'\n');
    fprintf(fid,'%1.15e \n',steps);
    st=fclose(fid);
    
    title("Analisi dei residui");
    semilogy(1:length(xv), f(xv), "ro", 1:length(xv), f(xv), "-k");
    %print('test_numerico_figura','-djpeg');
end

