%ankB connmat
mym=10;
mypath='/Users/alex/AlexBadea_MyPapers/AnkB/connectivity/ankb_ConnectivityMatrix/';
[mylegends,myabbrev]=xlsread([mypath 'CHASSSYMMETRIC2Legends09072017.xlsx'], 'thetruth', 'B2:B333');
mycolormap=jet(101);

corr(reshape(meanankLL,22*22,1), reshape(meanwtLL,22*22,1))
corr(reshape(meanankRR,22*22,1), reshape(meanwtRR,22*22,1))

corr(reshape(meanankLL,22*22,1), reshape(meanankRR,22*22,1))
corr(reshape(meanwtLL,22*22,1), reshape(meanwtRR,22*22,1))


corr(reshape(meanankRL,22*22,1), reshape(meanankRR,22*22,1))
corr(reshape(meanwtRL,22*22,1), reshape(meanwtRR,22*22,1))

corr(reshape(meanankRL,22*22,1), reshape(meanankLL,22*22,1))
corr(reshape(meanwtRL,22*22,1), reshape(meanwtLL,22*22,1))


suffix='top22';

myset=[2
3
4
6
17
18
21
22
28
33
36
61
71
77
79
82
88
121
131
142
158
166];

myn=numel(myset)
mynn=2*myn;

myorder=[1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
149
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
60
151
166
62
63
64
65
66
67
68
59
61
69
70
71
72
73
74
75
76
77
78
79
154
155
156
157
163
164
165
80
158
84
81
82
83
85
86
87
88
159
89
90
91
92
93
94
95
96
97
98
99
100
101
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
153
160
162
102
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
150];


runnos={'N54643',...
'N54645',...
'N54647',...
'N54649',...
'N54703',...
'N54694',...
'N54695',...
'N54696',...
'N54697',...
'N54698',...
'N54701',...
'N54702' };

indwt=[1 5 6 7 8 9]
indank=[2 3 4 10 11 12]

for i=1:numel(indwt)
  conwt(i)=load([mypath char(runnos(indwt(i))) '_connectivitymatrix.mat']);
  wtmat(:,:,i)=100*conwt(i).connectivity;
      end

for i=1:numel(indank)
  conank(i)=load([mypath char(runnos(indank(i))) '_connectivitymatrix.mat']);
  ankmat(:,:,i)=100*conank(i).connectivity;
end

% wtmat=wtmat([myset myset+166],[myset myset+166],:);
% ankmat=ankmat([myset myset+166],[myset myset+166],:);

meanank=mean(ankmat,3);
meanwt=mean(wtmat,3);

stdank=std(ankmat,0,3);
stdwt=std(wtmat,0,3);

meanankLL=meanank(1:2:332,1:2:332);
meanwtLL=meanwt(1:2:332,1:2:332);
% meanankLL=meanankLL(myorder,myorder);
% meanwtLL=meanwtLL(myorder,myorder);
meanankLL=meanankLL(myset,myset);
meanwtLL=meanwtLL(myset,myset);

meanankRR=meanank(2:2:332,2:2:332);
meanwtRR=meanwt(2:2:332,2:2:332);
% meanankRR=meanankRR(myorder,myorder);
% meanwtRR=meanwtRR(myorder,myorder);
meanankRR=meanankRR(myset,myset);
meanwtRR=meanwtRR(myset,myset);

meanankRL=meanank(2:2:332,1:2:332);
meanwtRL=meanwt(2:2:332,2:2:332);
% meanankRL=meanankRL(myorder,myorder);
% meanwtRL=meanwtRL(myorder,myorder);
meanankRL=meanankRL(myset,myset);
meanwtRL=meanwtRL(myset,myset);

%whole brain fig

figure1=figure('Name','Whole Brain'); 
%figure1;title('Whole Brain')
sax1=subplot(1,2,1);imagesc((log(meanwt))); title ('WT'); colorbar
mycolormap = jet(101);
mycolormap(1,:)=[1 1 1]
caxis(sax1,[0 mym])
colormap(sax1,mycolormap)

figure1; sax2=subplot(1,2,2);imagesc(log(meanank));  title ('ankBfs'); colorbar
mycolormap = jet(101);
mycolormap(1,:)=[1 1 1]
colormap(mycolormap)
colorbar
caxis(sax2,[0 mym])
colormap(sax2,mycolormap)

% 
% 
% h1=gca(figure1)
% h1.XTick=1:numel(myset);
% h1.YTick=1:numel(myset);
% h1.XTickLabel=myabbrev(myset)
% h1.YTickLabel=myabbrev(myset)
% h1.XTickLabelRotation=90
% set(h1, 'FontSize', 20, 'LineWidth', 2);

filename = strcat(mypath , suffix, 'fullset_conmat.png'); print(filename,'-dpng','-r300');
print(filename,'-dpng','-r300');

%Left-left

figure2=figure('Name','Left-Left'); 
%figure1;title('Whole Brain')
sax1=subplot(1,2,1) ;imagesc((log(meanwtLL))); title ('WT'); colorbar
mycolormap = jet(101);
mycolormap(1,:)=[1 1 1]
caxis(sax1,[0 mym])
colormap(sax1,mycolormap)
h1=gca(figure2)
h1.XTick=1:numel(myset);
h1.YTick=1:numel(myset);
h1.XTickLabel=myabbrev(myset)
h1.YTickLabel=myabbrev(myset)
h1.XTickLabelRotation=90
set(h1, 'FontSize', 20, 'LineWidth', 2);

figure2; sax2=subplot(1,2,2);imagesc(log(meanankLL));  title ('ankBfs'); colorbar
mycolormap = jet(101);
mycolormap(1,:)=[1 1 1]
colormap(mycolormap)
colorbar
caxis(sax2,[0 mym])
colormap(sax2,mycolormap)

h1=gca(figure2)
h1.XTick=1:numel(myset);
h1.YTick=1:numel(myset);
h1.XTickLabel=myabbrev(myset)
h1.YTickLabel=myabbrev(myset)
h1.XTickLabelRotation=90
set(h1, 'FontSize', 20, 'LineWidth', 2);

%figure2.PaperUnits = 'inches'; fig.PaperPosition = [0 0 6 3];

filename = strcat(mypath, suffix,'LLfullset_conmat.png'); print(filename,'-dpng','-r300');
print(filename,'-dpng','-r300');

%Right-Right

figure3=figure('Name','Right-Right'); 
sax1=subplot(1,2,1);imagesc((log(meanwtRR))); title ('WT'); colorbar
mycolormap = jet(101);
mycolormap(1,:)=[1 1 1]
caxis(sax1,[0 mym])
colormap(sax1,mycolormap)
h1=gca(figure3)
h1.XTick=1:numel(myset);
h1.YTick=1:numel(myset);
h1.XTickLabel=myabbrev(myset)
h1.YTickLabel=myabbrev(myset)
h1.XTickLabelRotation=90
set(h1, 'FontSize', 20, 'LineWidth', 2);

figure3; sax2=subplot(1,2,2);imagesc(log(meanankRR));  title ('ankBfs'); colorbar
mycolormap = jet(101);
mycolormap(1,:)=[1 1 1]
colormap(mycolormap)
colorbar
caxis(sax2,[0 mym])
colormap(sax2,mycolormap)

h1=gca(figure3)
h1.XTick=1:numel(myset);
h1.YTick=1:numel(myset);
h1.XTickLabel=myabbrev(myset)
h1.YTickLabel=myabbrev(myset)
h1.XTickLabelRotation=90
set(h1, 'FontSize', 20, 'LineWidth', 2);

filename = strcat(mypath,suffix, 'RRfullset_conmat.png'); print(filename,'-dpng','-r300');
print(filename,'-dpng','-r300');

%Right-Left

figure4=figure('Name','Right-Left'); 
sax1=subplot(1,2,1);imagesc((log(meanwtRL))); title ('WT'); colorbar
mycolormap = jet(101);
mycolormap(1,:)=[1 1 1]
caxis(sax1,[0 mym])
colormap(sax1,mycolormap)
h1=gca(figure4)
h1.XTick=1:numel(myset);
h1.YTick=1:numel(myset);
h1.XTickLabel=myabbrev(myset)
h1.YTickLabel=myabbrev(myset)
h1.XTickLabelRotation=90
set(h1, 'FontSize', 20, 'LineWidth', 2);

figure4; sax2=subplot(1,2,2);imagesc(log(meanankRL));  title ('ankBfs'); colorbar
mycolormap = jet(101);
mycolormap(1,:)=[1 1 1]
colormap(mycolormap)
colorbar
caxis(sax2,[0 mym])
colormap(sax2,mycolormap)
h1=gca(figure4)
h1.XTick=1:numel(myset);
h1.YTick=1:numel(myset);
h1.XTickLabel=myabbrev(myset)
h1.YTickLabel=myabbrev(myset)
h1.XTickLabelRotation=90
set(h1, 'FontSize', 20, 'LineWidth', 2);

filename = strcat(mypath, suffix,'RLfullset_conmat.png'); print(filename,'-dpng','-r300');
print(filename,'-dpng','-r300');

figure5=figure('Name','Histograms'); 
sax1=subplot(1,2,1); h1=histogram(nonzeros(reshape(meanwt, 110224,1)),32); h1.FaceColor='g'; title ('wt');axis([0 3500 0 50])
sax2=subplot(1,2,2); h2=histogram(nonzeros(reshape(meanank, 110224,1)),32); h2.FaceColor='r';title ('ankBfs');axis([0 3500 0 50])

figure4=figure('Name','Histograms'); 
 h1=histogram(nonzeros(reshape(meanwt, 110224,1)),64); h1.FaceColor='g'; title ('wt');axis([0 1000 0 50])
hold on; h2=histogram(nonzeros(reshape(meanank, 110224,1)),64); h2.FaceColor='r';title ('ankBfs');axis([0 1000 0 50])

% % ank_aggregate=reshape(ankmat, 332*332,6);
% % wt_aggregate= reshape(wtmat,332*332,6);
% % %[h p ci stats]=ttest2(ank_aggregate',wt_aggregate');
% % writemystats1(ank_aggregate,wt_aggregate,[mypath suffix 'aggregated_connstats'],0)
% % [myrows,mycols]=ind2sub([332,332],[1:332*332])
% % filename = strcat(mypath,suffix,'myindices.txt')
% % dlmwrite(filename,[myrows;mycols]');