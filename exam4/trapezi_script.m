
f=@(x) sin(x.^2);

a=0; b=pi/4;
tol=10^(-8);
Q = quadl(f,a,b,tol);


m(1,1)=3;
[I,h] = trapezi (f,a,b,m);
err=tol+1;

while err >= tol
    m(end+1,1)=2*m(end,1);
    [IL,h] = trapezi (f,a,b,m(end));
    I=[I; IL];
    err=abs(I(end)-I(end-1));
end

ea=abs(Q-I);
semilogy(m,ea);
title('Errore Assoluto Trapezi Composta');