disp('请输入判断矩阵A(n阶)');
A=input('A=');
[n,n]=size(A);
x=ones(n,100);
y=ones(n,100);
m=zeros(1,100);
m(1)=max(x(:,1));
y(:,1)=x(:,1);
x(:,2)=A*y(:,1);
m(2)=max(x(:,2));
y(:,2)=x(:,2)/m(2);
p=0.0001;i=2;k=abs(m(2)-m(1));
while  k>p
  i=i+1;
  x(:,i)=A*y(:,i-1);
  m(i)=max(x(:,i));
  y(:,i)=x(:,i)/m(i);
  k=abs(m(i)-m(i-1));
end
a=sum(y(:,i));
w=y(:,i)/a;
t=m(i);
disp(w);disp(t);
         %以下是一致性检验
CI=(t-n)/(n-1);RI=[0 0 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59];
CR=CI/RI(n);
if CR<0.10
    disp('此矩阵的一致性可以接受!');
    disp('CI=');disp(CI);
    disp('CR=');disp(CR);
end

Array1=[1 1/3 1/3;3 1 1;3 1 1];
Array2=[1 1;1 1];
Array3=[1 3;1/3 1];
Array4=[1 3;1/3 1];
Array5=[1 5;1/5 1];
Array6=[1 3;1/3 1];
Array7=[1 1/5;5 1];
Array8=[1 7;1/7 1];
Array9=[1 1/5;5 1];
Array10=[1 1/3;7 1];

A=test1(Array1);
B1=test1(Array2);
B2=test1(Array3); 
B3=test1(Array4);
C1=test1(Array5);
C2=test1(Array6);
C3=test1(Array7);
C4=test1(Array8);
C5=test1(Array9);
C6=test1(Array10);
