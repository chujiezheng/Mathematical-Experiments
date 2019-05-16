clear all
data = textread('q10_data.txt');
n1 = 10000;
alpha = 0.05; %显著性水平
z = norminv(1-alpha/2); %公式中的z
%% 举个简单的例子来验证近似的合理性
clc;
num = (n1 - 1) * data(2, 3)^2 - data(2, 5)^2;
den = (data(2,2) - data(2,4))^2 * n1 / z / z - data(2,3)^2;
n2 = num / den
%%
n2s = 71.78:0.00001:71.80;
leftnum = abs(data(2,2) - data(2,4));
leftden1 = sqrt(1/n1 + 1 ./ n2s);
leftden2 = sqrt(((n1-1)*data(2,3)^2 + (n2s - 1)*data(2,5)^2) ./ (n1+n2s-2));
lefts = leftnum ./ leftden1 ./ leftden2;
rights = tinv(1-alpha/2, n1+n2s-2);

set(gcf, 'position', [0 0 720 360]);
plot(n2s, lefts,'LineWidth',2)
hold on
plot(n2s, rights,'LineWidth', 2)
xlabel('n_2')
ylabel('equation value')
legend('左端', '右端', 'Location', 'NorthWest')
grid on; box on
saveas(gcf, 'valid.png')
%% 临界值的计算
clc;
format long;
numsmale = (n1 - 1) * data(:, 3) .^ 2 - data(:, 5) .^ 2;
densmale = (data(:,2) - data(:,4)) .^ 2 * n1 / z / z - data(:,3) .^ 2;
n2smale = numsmale ./ densmale
numsfemale = (n1 - 1) * data(:, 7) .^ 2 - data(:, 9) .^ 2;
densfemale = (data(:,6) - data(:,8)) .^ 2 * n1 / z / z - data(:,7) .^ 2;
n2sfemale = numsfemale ./ densfemale