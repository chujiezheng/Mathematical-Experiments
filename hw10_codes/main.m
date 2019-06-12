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
    
    % GG�㷨���������׼�����ֵ�����������������
    [tmp1,tmp2,tmp3,~] = normfit(GGbs);
    GGbias(i) = (tmp1-Nresult(i))/(Nresult(i)+1e-23);
    GGstd(i) = tmp2/(Nresult(i)+1e-23);
    GGbias_int(i,1:2) = (tmp3-Nresult(i))/(Nresult(i)+1e-23);
    
    [tmp1,~,tmp3,~] = normfit(GGts);
    GGtime(i) = tmp1;
    GGtime_int(i,1:2) = tmp3;
    
    % KKLLL�㷨���������׼�����ֵ�����������������
    [tmp1,tmp2,tmp3,~] = normfit(KKLLLbs);
    KKLLLbias(i) = (tmp1-Nresult(i))/(Nresult(i)+1e-23);
    KKLLLstd(i) = tmp2/(Nresult(i)+1e-23);
    KKLLLbias_int(i,1:2) = (tmp3-Nresult(i))/(Nresult(i)+1e-23);
    
    [tmp1,~,tmp3,~] = normfit(KKLLLts);
    KKLLLtime(i) = tmp1;
    KKLLLtime_int(i,1:2) = tmp3;
    
    % ��׼��̬������������׼�����ֵ�����������������
    [tmp1,tmp2,tmp3,~] = normfit(Rbs);
    Rbias(i) = (tmp1-Nresult(i))/(Nresult(i)+1e-23);
    Rstd(i) = tmp2/(Nresult(i)+1e-23);
    Rbias_int(i,1:2) = (tmp3-Nresult(i))/(Nresult(i)+1e-23);
   
    [tmp1,~,tmp3,~] = normfit(Rts);
    Rtime(i) = tmp1;
    Rtime_int(i,1:2) = tmp3;

end

%% ����������
close;

set(gcf, 'position', [0 0 500 250]);hold on;
plot(abs(GGbias),'r','linewidth',2);
plot(abs(KKLLLbias),'b','linewidth',2);
plot(abs(Rbias),'g','linewidth',2);

legend('GG�㷨��������','KKLLL�㷨��������','��׼��̬�����������','location','northwest');
xlabel('p*10'); ylabel('������=|��ֵ-��ȷֵ|/��ȷֵ');
saveas(gcf,'n=25,������������.jpg');

%%% �Ƚϱ�׼��
close;

set(gcf, 'position', [0 0 500 250]);hold on;
plot(GGstd,'r','linewidth',2);
plot(KKLLLstd,'b','linewidth',2);
plot(Rstd,'g','linewidth',2);

legend('GG�㷨�ı�׼��','KKLLL�㷨�ı�׼��','��׼��̬����ı�׼��','location','northwest');
xlabel('p*10'); ylabel('��׼��/��ȷֵ');
saveas(gcf,'n=25,��������׼��.jpg');

%%% ���������������
close;
set(gcf, 'position', [0 0 500 250]);
rcoplot(GGbias,GGbias_int);
xlabel('p*10'); ylabel('������=(��ֵ-��ȷֵ)/��ȷֵ');
title('');
saveas(gcf,'n=25,GG�㷨����ֵ�����������������.jpg');

%pause;
close;
set(gcf, 'position', [0 0 500 250]);
rcoplot(KKLLLbias,KKLLLbias_int);
xlabel('p*10'); ylabel('������=(��ֵ-��ȷֵ)/��ȷֵ');
title('');
saveas(gcf,'n=25,KKLLL�㷨����ֵ�����������������.jpg');

%pause;
close;
set(gcf, 'position', [0 0 500 250]);
rcoplot(Rbias,Rbias_int);
xlabel('p*10'); ylabel('������=(��ֵ-��ȷֵ)/��ȷֵ');
title('');
saveas(gcf,'n=25,��׼��̬�������ֵ�����������������.jpg');

%%% �����ʱ����������
close;
set(gcf, 'position', [0 0 500 250]);hold on;
rcoplot(GGtime,GGtime_int);
plot(Ntime,'x'); ylim('auto');
xlabel('p*10'); ylabel('�����ʱ');
title('');
saveas(gcf,'n=25,GG�㷨�ļ����ʱ.jpg');

%pause;
close;
set(gcf, 'position', [0 0 500 250]);hold on;
rcoplot(KKLLLtime,KKLLLtime_int);
plot(Ntime,'x'); ylim('auto');
xlabel('p*10'); ylabel('�����ʱ');
title('');
saveas(gcf,'n=25,KKLLL�㷨�ļ����ʱ.jpg');

%pause;
close;
set(gcf, 'position', [0 0 500 250]);hold on;
rcoplot(Rtime,Rtime_int);
plot(Ntime,'x'); ylim('auto');
xlabel('p*10'); ylabel('�����ʱ');
title('');
saveas(gcf,'n=25,��׼��̬����ļ����ʱ.jpg');


%% �����۲����ʱ��
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
xlabel('p'); ylabel('log(�����ʱ)');
title('GG�㷨�ڲ�ͬ�����ģ�µļ����ʱ');
saveas(gcf,'GG�㷨�ڲ�ͬ�����ģ�µļ����ʱ.jpg');

close;
set(gcf, 'position', [0 0 500 250]);hold on;
for i=1:length(is)
    plot(ps,log(KKLLLtime(1:length(ps),i)),'linewidth',2);
end
legend('n=2^5','n=2^7','n=2^9','n=2^{11}','n=2^{13}');
xlabel('p'); ylabel('log(�����ʱ)');
title('KKLLL�㷨�ڲ�ͬ�����ģ�µļ����ʱ');
saveas(gcf,'KKLLL�㷨�ڲ�ͬ�����ģ�µļ����ʱ.jpg');

close;
set(gcf, 'position', [0 0 500 250]);hold on;
for i=1:length(is)
    plot(ps,log(Rtime(1:length(ps),i)),'linewidth',2);
end
legend('n=2^5','n=2^7','n=2^9','n=2^{11}','n=2^{13}');
xlabel('p'); ylabel('log(�����ʱ)');
title('��׼��̬��������ڲ�ͬ�����ģ�µļ����ʱ');
saveas(gcf,'��׼��̬��������ڲ�ͬ�����ģ�µļ����ʱ.jpg');
