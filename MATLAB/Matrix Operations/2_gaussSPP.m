function x=gaussSPP(A,b)

%The function returns in vector x the solution of the linear system Ax=b
%if a unique solution exists
%or a message 'No unique solution' if no unique solution exists

n=size(A,1);
A=[A b];
for i=1:n
    s(i)=abs(A(i,1));
    for j=2:n
        if s(i)<abs(A(i,j))
            s(i)=abs(A(i,j));
        end
    end
end

%Elimination
for i=1:n-1
    
%searching for "best" pivot
    p=i;c=abs(A(i,i))/s(i);
    for j=i+1:n
        if abs(A(j,i))/s(j)>c
            c=abs(A(j,i))/s(j);
            p=j;
        end
    end
    if c==0 
        disp('No unique solution')
        return
    end
    
%interchanging rows if necessary    
    if p~=i
        T=A(i,:); A(i,:)=A(p,:); A(p,:)=T;
        c=s(i); s(i)=s(p); s(p)=c;
    end
 
 %computations
    for j=i+1:n
        m=A(j,i)/A(i,i);
        for k=i+1:n+1
            A(j,k)=A(j,k)-m*A(i,k);
        end
    end
end
if A(n,n)==0 disp('No unique solution'); return; end

%Backward substitution 
x(n,1)=A(n,n+1)/A(n,n);
for i=n-1:-1:1
    s=0;
    for j=i+1:n
        s=s+A(i,j)*x(j);
    end
    x(i,1)=(A(i,n+1)-s)/A(i,i);
end  

