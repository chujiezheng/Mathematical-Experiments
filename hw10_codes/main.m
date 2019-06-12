%%
clear;clc;close;

rng(123);
ps = 0.1:0.1:0.9;
n = 25; N = 200;

GGbias = zeros(length(ps),1);
GGbias_int = zeros(length(ps),2);
GGstd = zeros(length(ps),1);
GGtime = zeros(length(ps),1);
GGtime_int = zeros(length(ps),2);

KKLLLbias = zeros(length(ps),1);
KKLLLbias_int = zeros(length(ps),2);
KKLLLstd = zeros(length(ps),1);
KKLLLtime = zeros(length(ps),1);
KKLLLtime_int = zeros(length(ps),2);

Rbias = zeros(length(ps),1);
Rbias_int = zeros(length(ps),2);
Rstd = zeros(length(ps),1);
Rtime = zeros(length(ps),1);
Rtime_int = zeros(length(ps),2);

Nresult = zeros(length(ps),1);
Ntime = zeros(length(ps),1);

for i=1:length(ps)
    p = ps(i);
    A = rand(n) < p;
        
    tic
    Nresult(i) = Nperm(A);
    Ntime(i) = toc;
   
    GGbs = zeros(N,1);
    GGts = zeros(N,1);
    KKLLLbs = zeros(N,1);
    KKLLLts = zeros(N,1);
    Rbs = zeros(N,1);
    Rts = zeros(N,1);

    for j=1:N
        tic
        GGbs(j) = GGperm(A);
        GGts(j) = toc;

        tic
        KKLLLbs(j) = KKLLLperm(A);
        KKLLLts(j) = toc;
        
        tic
        Rbs(j) = Rperm(A);
        Rts(j) = toc;
    end
    
    % GG算法的相对误差、标准差相对值、置信区间的相对误差
    [tmp1,tmp2,tmp3,~] = normfit(GGbs);
    GGbias(i) = (tmp1-Nresult(i))/(Nresult(i)+1e-23);
    GGstd(i) = tmp2/(Nresult(i)+1e-23);
    GGbias_int(i,1:2) = (tmp3-Nresult(i))/(Nresult(i)+1e-23);
    
    [tmp1,~,tmp3,~] = normfit(GGts);
    GGtime(i) = tmp1;
    GGtime_int(i,1:2) = tmp3;
    
    % KKLLL算法的相对误差、标准差相对值、置信区间的相对误差
    [tmp1,tmp2,tmp3,~] = normfit(KKLLLbs);
    KKLLLbias(i) = (tmp1-Nresult(i))/(Nresult(i)+1e-23);
    KKLLLstd(i) = tmp2/(Nresult(i)+1e-23);
    KKLLLbias_int(i,1:2) = (tmp3-Nresult(i))/(Nresult(i)+1e-23);
    
    [tmp1,~,tmp3,~] = normfit(KKLLLts);
    KKLLLtime(i) = tmp1;
    KKLLLtime_int(i,1:2) = tmp3;
    
    % 标准正态矩阵的相对误差、标准差相对值、置信区间的相对误差
    [tmp1,tmp2,tmp3,~] = normfit(Rbs);
    Rbias(i) = (tmp1-Nresult(i))/(Nresult(i)+1e-23);
    Rstd(i) = tmp2/(Nresult(i)+1e-23);
    Rbias_int(i,1:2) = (tmp3-Nresult(i))/(Nresult(i)+1e-23);
   
    [tmp1,~,tmp3,~] = normfit(Rts);
    Rtime(i) = tmp1;
    Rtime_int(i,1:2) = tmp3;

end

%% 画出相对误差
close;

set(gcf, 'position', [0 0 500 250]);hold on;
plot(abs(GGbias),'r','linewidth',2);
plot(abs(KKLLLbias),'b','linewidth',2);
plot(abs(Rbias),'g','linewidth',2);

legend('GG算法的相对误差','KKLLL算法的相对误差','标准正态矩阵的相对误差','location','northwest');
xlabel('p*10'); ylabel('相对误差=|均值-精确值|/精确值');
saveas(gcf,'n=25,计算结果相对误差.jpg');

%%% 比较标准差
close;

set(gcf, 'position', [0 0 500 250]);hold on;
plot(GGstd,'r','linewidth',2);
plot(KKLLLstd,'b','linewidth',2);
plot(Rstd,'g','linewidth',2);

legend('GG算法的标准差','KKLLL算法的标准差','标准正态矩阵的标准差','location','northwest');
xlabel('p*10'); ylabel('标准差/精确值');
saveas(gcf,'n=25,计算结果标准差.jpg');

%%% 相对误差的置信区间
close;
set(gcf, 'position', [0 0 500 250]);
rcoplot(GGbias,GGbias_int);
xlabel('p*10'); ylabel('相对误差=(均值-精确值)/精确值');
title('');
saveas(gcf,'n=25,GG算法估计值的置信区间的相对误差.jpg');

%pause;
close;
set(gcf, 'position', [0 0 500 250]);
rcoplot(KKLLLbias,KKLLLbias_int);
xlabel('p*10'); ylabel('相对误差=(均值-精确值)/精确值');
title('');
saveas(gcf,'n=25,KKLLL算法估计值的置信区间的相对误差.jpg');

%pause;
close;
set(gcf, 'position', [0 0 500 250]);
rcoplot(Rbias,Rbias_int);
xlabel('p*10'); ylabel('相对误差=(均值-精确值)/精确值');
title('');
saveas(gcf,'n=25,标准正态矩阵估计值的置信区间的相对误差.jpg');

%%% 计算耗时的置信区间
close;
set(gcf, 'position', [0 0 500 250]);hold on;
rcoplot(GGtime,GGtime_int);
plot(Ntime,'x'); ylim('auto');
xlabel('p*10'); ylabel('计算耗时');
title('');
saveas(gcf,'n=25,GG算法的计算耗时.jpg');

%pause;
close;
set(gcf, 'position', [0 0 500 250]);hold on;
rcoplot(KKLLLtime,KKLLLtime_int);
plot(Ntime,'x'); ylim('auto');
xlabel('p*10'); ylabel('计算耗时');
title('');
saveas(gcf,'n=25,KKLLL算法的计算耗时.jpg');

%pause;
close;
set(gcf, 'position', [0 0 500 250]);hold on;
rcoplot(Rtime,Rtime_int);
plot(Ntime,'x'); ylim('auto');
xlabel('p*10'); ylabel('计算耗时');
title('');
saveas(gcf,'n=25,标准正态矩阵的计算耗时.jpg');


%% 单独观察计算时间
clear;clc;close;

ps = 0.1:0.1:0.9;
is = 5:2:13;

GGtime = zeros(length(ps),length(is));
KKLLLtime = zeros(length(ps),length(is));
Rtime = zeros(length(ps),length(is));

for j=1:length(ps)
    p = ps(j);

    for i=1:length(is)
        n = 2^is(i);
        A = rand(n) < p;

        tic
        GGperm(A);
        GGtime(j,i) = toc;

        tic
        KKLLLperm(A);
        KKLLLtime(j,i) = toc;

        tic
        Rperm(A);
        Rtime(j,i) = toc;
    end

end

%%
ps = 0.1:0.1:0.9;
is = 5:2:13;

close;
set(gcf, 'position', [0 0 500 250]);hold on;
for i=1:length(is)
    plot(ps,log(GGtime(1:length(ps),i)),'linewidth',2);
end
legend('n=2^5','n=2^7','n=2^9','n=2^{11}','n=2^{13}');
xlabel('p'); ylabel('log(计算耗时)');
title('GG算法在不同矩阵规模下的计算耗时');
saveas(gcf,'GG算法在不同矩阵规模下的计算耗时.jpg');

close;
set(gcf, 'position', [0 0 500 250]);hold on;
for i=1:length(is)
    plot(ps,log(KKLLLtime(1:length(ps),i)),'linewidth',2);
end
legend('n=2^5','n=2^7','n=2^9','n=2^{11}','n=2^{13}');
xlabel('p'); ylabel('log(计算耗时)');
title('KKLLL算法在不同矩阵规模下的计算耗时');
saveas(gcf,'KKLLL算法在不同矩阵规模下的计算耗时.jpg');

close;
set(gcf, 'position', [0 0 500 250]);hold on;
for i=1:length(is)
    plot(ps,log(Rtime(1:length(ps),i)),'linewidth',2);
end
legend('n=2^5','n=2^7','n=2^9','n=2^{11}','n=2^{13}');
xlabel('p'); ylabel('log(计算耗时)');
title('标准正态矩阵估计在不同矩阵规模下的计算耗时');
saveas(gcf,'标准正态矩阵估计在不同矩阵规模下的计算耗时.jpg');
