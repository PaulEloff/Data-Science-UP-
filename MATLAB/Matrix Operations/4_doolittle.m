function [L,U] = doolittle(A)
n = size(A,1);
L = eye(n);
U = eye(n);

if U(1,1)*L(1,1)==0
   error('Factorisation impossible');
else
    U(1,1) = A(1,1)/L(1,1);
end

for j=2:n
    U(1,j) = A(1,j)/L(1,1);
    L(j,1) = A(j,1)/U(1,1);
end

for i=2:n-1

    if U(i,i)*L(i,i)==0
        error('Factorisation impossible')
    else
        temp = 0;
        for k=1:i-1
            temp = temp + L(i,k)*U(k,i);
        end
        U(i,i) = (A(i,i)-temp)/L(i,i);
    end
    
    for j=i+1:n

        temp1=0;
        for k=1:i-1
            temp1 = temp1 + L(i,k)*U(k,j);
        end
        U(i,j) = (A(i,j)-temp1)/L(i,i);

        temp2=0;
        for k=1:i-1
            temp2 = temp2 + L(j,k)*U(k,i);
        end
        L(j,i) = (A(j,i) - temp2)/U(i,i);

    end
end
temp3 = 0;
for k=1:n-1
    temp3 = temp3 + L(n,k)*U(k,n);
end
U(n,n) = (A(n,n)-temp3)/L(n,n);
        


  