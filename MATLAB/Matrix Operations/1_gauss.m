function x = gauss(A,b)
% The function returns in vector x the solution of the linear system Ax=b
% if a unique solution exists
% or a message 'No unique solution' if no unique solution exists
n=size(A,1);
A=[A b];

% Elimination

for i=1:n-1
    p=i;
    while p<=n & A(p,i)==0 
        p=p+1;
    end
    if p==n+1 disp('No unique solution');x=0; return
    end
    if p~=i
        T=A(i,:); A(i,:)=A(p,:); A(p,:)=T;
    end
    for j=i+1:n
        m=A(j,i)/A(i,i);
        for k=i+1:n+1
            A(j,k)=A(j,k)-m*A(i,k);
        end
    end
end
if A(n,n)==0 disp('No unique solution');x=0; return; end

% Backward substitution

x(n,1)=A(n,n+1)/A(n,n);
for i=n-1:-1:1
    s=0;
    for j=i+1:n
        s=s+A(i,j)*x(j);
    end
    x(i)=(A(i,n+1)-s)/A(i,i);
end 
