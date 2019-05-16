clear;clc;close;

data = textread('q6_data.txt');
set(gcf, 'position', [0 0 720 360]);
scatter(data(:,1), data(:,2), 80, 'b.')
xlabel('height/cm')
ylabel('weight/kg')
box on
saveas(gcf, 'hvw.png')
corrmatrix = corrcoef(data) 
%%
close;
%set(gcf, 'position', [0 0 720 360]);
hist(data(:,1))
xlabel('height/cm')
ylabel('frequency')
box on
saveas(gcf, 'hvf.png')
%%
close;
%set(gcf, 'position', [0 0 720 360]);
hist(data(:,2))
xlabel('weight/kg')
ylabel('frequency')
box on
saveas(gcf, 'wvf.png')
%% 
clc;
alpha = 0.05;
[h1, p1] = jbtest(data(:,1), alpha)
[h2, p2] = jbtest(data(:,2), alpha)
[h3, p3] = lillietest(data(:,1), alpha)
[h4, p4] = lillietest(data(:,2), alpha)
%% 
clc;
[mu1, sigma1, muci1, sigmaci1] = normfit(data(:,1), alpha)
[mu2, sigma2, muci2, sigmaci2] = normfit(data(:,2), alpha)
%% 
[h5, sig5, ci5] = ttest(data(:,1), 167.5, alpha, 0)
[h6, sig6, ci6] = ttest(data(:,2), 60.2, alpha, 0)