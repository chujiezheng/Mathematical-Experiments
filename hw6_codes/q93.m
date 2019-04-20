clear;clc;close;
x0=[-3,-1,-3,-1];
x0=[0,0,0,0]+1000;
v1=[-10,-10,-10,-10];
v2=[10,10,10,10];

opt = optimoptions('fmincon','tolx',1e-8,'tolf',1e-8, ...
    'MaxFunEvals',20000,'MaxIter',3000);

'interior-point num_grad'
opt1 = optimoptions(opt,'Algorithm','interior-point');
[x,fv,ef,out,~,~,~]=fmincon(@qfun93,x0,[],[],[],[],v1,v2, ...
    @qfun93con2,opt1)
qfun93con2(x)
pause;
'interior-point ana_grad'
opt2=optimoptions(opt1,'GradObj','on');%,'GradConstr','on');
[x,fv,ef,out,~,~,~]=fmincon(@qfun93,x0,[],[],[],[],v1,v2, ...
    @qfun93con2,opt2)
qfun93con2(x)
pause;

'sqp num_grad'
opt1 = optimoptions(opt,'Algorithm','sqp');
[x,fv,ef,out,~,~,~]=fmincon(@qfun93,x0,[],[],[],[],v1,v2, ...
    @qfun93con2,opt1)
qfun93con2(x)
pause;

'sqp ana_grad'
opt2=optimoptions(opt1,'GradObj','on');%,'GradConstr','on');
[x,fv,ef,out,~,~,~]=fmincon(@qfun93,x0,[],[],[],[],v1,v2, ...
    @qfun93con2,opt2)
qfun93con2(x)
pause;

'active-set num_grad'
opt1=optimoptions(opt,'Algorithm','active-set');
[x,fv,ef,out,~,~,~]=fmincon(@qfun93,x0,[],[],[],[],v1,v2, ...
    @qfun93con2,opt1)
qfun93con2(x)
pause;

'active-set ana_grad'
opt2=optimoptions(opt1,'GradObj','on');%,'GradConstr','on');
[x,fv,ef,out,~,~,~]=fmincon(@qfun93,x0,[],[],[],[],v1,v2, ...
    @qfun93con2,opt2)
qfun93con2(x)

