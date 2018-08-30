%
% Specifiche dell'esercizio di Jacobi
%

n = 50;
A = diag(4*ones(n,1)) + diag(-2*ones(n-1,1),1) + diag(ones(n-1,1),-1);

sol = ones(n, 1);
b = A*sol;
x0 = zeros(n, 1); 
kmax = 10000;
toll = 10^(-5);

[x, k, flag] = jacobi3(A,b,x0,toll,kmax); 

fprintf("\nIterazioni effettuate: "); k
%fprintf("\nVettore X: ");

for j=1:k
    err(j)=norm(x(:,j)-sol);
end

iter = 1:k;

%plot(iter, err, "-b"); 
%pause;

clf;
semilogy(1:k,err,'rs');