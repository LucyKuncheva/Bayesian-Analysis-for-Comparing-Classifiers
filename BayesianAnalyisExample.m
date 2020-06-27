clear, clc, close all

%% Initialisation
% Values used in the paper
prior = 0.5; 
r = 1; % rope

%% Load the data
z = xlsread('NBC_AODE_differences.xlsx','Data','a1:a54');
% From a file containing the differences NBC-AODE (Table 7)

%% Histogram (Figure 10 in the paper)
T = 150000; % number of repetitions
S = signed_rank_test_diff(z,0,prior,T); % rope = 0

figure('Un','N','Pos',[0.05,0.4,0.4,0.25])
h2 = histogram(S(:,1),500);
set (h2,'EdgeColor','none','FaceColor',[0.3 0.8 1],'FaceAlpha',1);
xlabel('Pleft')
title('AODE vs NBC (Signed Rank Test)')
grid on
axis([0.5 1 0 1500])


%% Barycentric coordinates (Figure 11 in the paper)
% (minus the density colour-coding)
T = 50000; % number of repetitions
[R,probs] = signed_rank_test_diff(-z,r,prior,T); 
% Need AODE-NBC, hence use -z

barycentric_plot(R, probs,{'NBC','AODE'},14);

