
% DETERMINA PROBLEMA.
n = 50;
A = diag(4*ones(n,1)) + diag(-2*ones(n-1,1),1) + diag(ones(n-1,1),-1);

sol=ones(n,1);
b=A*sol;
x0=zeros(n,1);
toll=10^(-5);
kmax=10000;

% TROVA SOLUZIONE.
[x,k,flag] = jacobiSol (A,b,x0,toll,kmax);

% CALCOLA ERRORE.
for j=1:k
    err(j)=norm(x(:,j)-sol);
end

% ESEGUI GRAFICO ERRORE.
semilogy(1:k,err,'ko');
