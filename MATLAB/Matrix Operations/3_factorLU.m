function icount=factorLU(A)
n=size(A,1);
L = eye(n); 
icount=0;
U = zeros(n,n);
for i=1:n-1
    p=i;
    while p<=n & A(p,i)==0
        p=p+1;
    end
    if p==n+1 disp('The matrix is singular');L=NaN;U=NaN; return
    end
    if p~=i
       disp('Row interchange required');L=NaN;U=NaN; return
    end
    for j=i+1:n
        m=A(j,i)/A(i,i);
        icount=icount+1;
        L(j,i)=m;
        for k=i+1:n
            A(j,k)=A(j,k)-m*A(i,k);
            icount=icount+1;
        end
    end
end
if A(n,n)==0 disp('The matrix is singular');L=NaN;U=NaN; return; end

for i=1:n
    for j=i:n;
        U(i,j)=A(i,j);
    end
end