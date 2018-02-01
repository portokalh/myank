%do asymmetry directly on connectivity
close all
mycolormap = jet(101);

mypathin='/Users/alex/AlexBadea_MyPapers/AnkB/connectivity/ankB_NetworkMeasures/'
%N54643_netproperties.txt
mypath=mypathin;

mypathin2='/Users/alex/Documents/MATLAB/ankBscripts/'
pathfigs=[mypathin2 '/figs/']

[mylegends2,mynames]=xlsread([mypathin 'CHASSSYMMETRIC2Legends09072017.xlsx'], 'thetruth', 'A2:A333');

runnos={'N54643', ...
'N54645', ...
'N54647', ...
'N54649', ...
'N54703' , ...%N54693/
'N54694', ...%outlier
'N54695', ...
'N54696', ...
'N54697', ...
'N54698', ...
'N54701', ...
'N54702'}'% outlier

groups=[1
2
2
2
1
1
1
1
1
2
2
2];

ind1=find(groups==1);
ind2=find(groups==2);

props={'degree(binary)',...
'strength(weighted)',...
'cluster_coef(binary)',...
'cluster_coef(weighted)',...
'local_efficiency(binary)',...
'local_efficiency(weighted)',...
'betweenness_centrality(binary)',...
'betweenness_centrality(weighted)',...
'eigenvector_centrality(binary)',...
'eigenvector_centrality(weighted)',...
'pagerank_centrality(binary)',...
'pagerank_centrality(weighted)',...
'eccentricity(binary)',...
'eccentricity(weighted)'}


myroino=332
%myrunno='N54900'
for i=1:numel(ind1)
    runno=runnos{ind1(i)} ;
    myprops1(i,:,:)=ank_getvprops(mypath,runno,myroino);
end
save([mypath 'G1props12.mat'],'myprops1')

for i=1:numel(ind2)
    runno=runnos{ind2(i)} ;
    myprops2(i,:,:)=ank_getvprops(mypath,runno,myroino);
end
save([mypath 'G2props12.mat'],'myprops2')

myvertices=[3 6 28 59 127 144 166 42,43,44,45,46]
myvertices=[51 59  65 66 166 120 122 24]



mynames(myvertices)

for i=1:numel(myvertices)
    indroi=myvertices(i)
    
myHc1_degreew=myprops1(:,2,i*2-1)
myHc2_degreew=myprops1(:,2,i*2)
myHc3_degreew=myprops2(:,2,i*2-1)
myHc4_degreew=myprops2(:,2,i*2)



wt_asym=100*(myHc1_degreew-myHc2_degreew)./myHc1_degreew;
ank_asym=100*(myHc3_degreew-myHc4_degreew)./myHc4_degreew;

h = {myHc1_degreew; myHc2_degreew;myHc3_degreew;myHc4_degreew}
hf = figure('Name',char(mynames(indroi)))

cmap=[0 1 0; 0 0 1 ; 1 1 1; 1 0 0]
aboxplot(h, 'labels', mynames(indroi), 'colormap', cmap,'WidthE', .4, 'WidthL', .8, 'WidthS', 1, 'outliermarkersize', 5); % Add a legend); % Advanced box plot

legend('WTLeft', 'WTRight', 'AnkBfsL','ANkBfsR')
%legend('$\sigma=2$','$\sigma=4$')


ylabel('Degree_w(#)', 'FontSize', 16, 'FontWeight', 'bold');

set(gca,'FontSize',16,'FontName','FixedWidth', 'FontWeight', 'bold');
%xticklabel_rotate([],90);
fname=char([pathfigs 'Deg' char(mynames(indroi)) 'just5.png'])

saveas(hf, fname,'png');
export_fig(fname, '-png', '-r200');

h = {wt_asym; ank_asym}
hf = figure('Name',char(mynames(indroi)))
cmap2=[1 1 1; 1 0 0 ]
aboxplot(h, 'labels', mynames(indroi), 'colormap', cmap2,'WidthE', .4, 'WidthL', .8, 'WidthS', 1, 'outliermarkersize', 5); % Add a legend); % Advanced box plot

legend('WTAsyn', 'AnkBfsAsym')
%legend('$\sigma=2$','$\sigma=4$')


ylabel('Degree_w(#)', 'FontSize', 16, 'FontWeight', 'bold');

set(gca,'FontSize',16,'FontName','FixedWidth', 'FontWeight', 'bold');
%xticklabel_rotate([],90);
fname2=char([pathfigs 'DegAsym' char(mynames(indroi)) 'just5.png'])

saveas(hf, fname2,'png');
export_fig(fname2, '-png', '-r200');
end

%assymetry for degree


%[h p ci1 stats]=ttest2(squeeze(myprops1(:,2,:)),squeeze(myprops2(:,2,:)));

suffix='all';
norm=0;

for j=1:14
    prefix=char(props{j});
    writemystats1(squeeze(myprops2(:,j,:))',squeeze(myprops1(:,j,:))', [mypath prefix '_groupstats' suffix],norm); %feed treated in first

end


%%%clustering coeffcient

for i=1:numel(myvertices)
    indroi=myvertices(i)
    
myHc1_degreew=myprops1(:,4,i*2-1)
myHc2_degreew=myprops1(:,4,i*2)
myHc3_degreew=myprops2(:,4,i*2-1)
myHc4_degreew=myprops2(:,4,i*2)

h = {myHc1_degreew; myHc2_degreew;myHc3_degreew;myHc4_degreew}
hf = figure('Name',char(mynames(indroi)))
%h = cat(1, reshape(cvn,[1 size(cvn)]), reshape(nos2,[1 size(nos2)])));
cmap=[0 1 0; 0 0 1 ; 1 1 1; 1 0 0];
aboxplot(h, 'labels', mynames(indroi), 'colormap', cmap,'WidthE', .4, 'WidthL', .8, 'WidthS', 1, 'outliermarkersize', 5); % Add a legend); % Advanced box plot

legend('WTLeft', 'WTRight', 'AnkBfsL','ANkBfsR')
%legend('$\sigma=2$','$\sigma=4$')


ylabel('ClusteringCoefficient', 'FontSize', 16, 'FontWeight', 'bold');

set(gca,'FontSize',16,'FontName','FixedWidth', 'FontWeight', 'bold');
%xticklabel_rotate([],90);
fname=char([pathfigs 'Clust' char(mynames(indroi)) 'just5.png'])

saveas(hf, fname,'png');
export_fig(fname, '-png', '-r200');
end
close all

%efficiency 6