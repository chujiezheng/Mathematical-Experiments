clear;clc;close;
l0=1000;c0=0.8;s=1;
l1=5;c1=100;
l2=5;c2=60;
l3=5;c3=50;
a1=1;a2=1;a3=1;
b12=0.9;b23=0.6;

c=-[a1*l1,a2*l2,a3*l3];
A=[l1/(l0+l1),0,0;
    b12*l1/(l0+l1+l2),l2/(l0+l1+l2),0;
    b23*b12*l1/(l0+l1+l2+l3),b23*l2/(l0+l1+l2+l3),l3/(l0+l1+l2+l3)];
b=[s-l0*c0/(l0+l1),s-b12*l0*c0/(l0+l1+l2),s-b23*b12*l0*c0/(l0+l1+l2+l3)];

v1=[0,0,0];
v2=[c1,c2,c3];

[x,f,exitflag,output,lag]=linprog(c,A,b,[],[],v1,v2)

z=f+a1*l1*c1+a2*l2*c2+a3*l3*c3

%%
A=[b12*l1/(l0+l1),0,0;
    b23*b12*l1/(l0+l1+l2),b23*l2/(l0+l1+l2),0;
    0,0,0];
b=[s-b12*l0*c0/(l0+l1),s-b23*b12*l0*c0/(l0+l1+l2),0];

[x,f,exitflag,output,lag]=linprog(c,A,b,[],[],v1,v2)

z=f+a1*l1*c1+a2*l2*c2+a3*l3*c3

%% practice

