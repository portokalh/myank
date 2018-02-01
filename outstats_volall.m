
%ROI stats for ankB
prefix='volume';
suffix='all'; %'just5'
indwt=[1 3 4 5 6]
indankB=[7 8 9 10 11]
indwt=[1:6]
indankB=[7:12]

vol=1

if vol==1
    norm=1
else norm=0
end

path_out='/Users/alex/AlexBadea_MyPapers/AnkB/ank013018/ankB_ROI '; %'/Users/alex/AlexBadea_MyPapers/ankyrin_spectrin_dki/labels_stats/studywide_label_statistics/'

mystatsfile=['/Users/alex/AlexBadea_MyPapers/ankyrin_spectrin_dki/labels_stats/studywide_label_statistics/studywide_stats_for_' prefix '.txt'];


myval=readtable(mystatsfile,'HeaderLines',2,'Delimiter','\t');

vars={'Var1'};
for i=1:13 
    vars = [vars , {['Var' num2str(i+1)]}]
            end
        

for i=1:13
    myres(:,i)=myval.(vars{i})
end
myres2=myres(:,2:end);

writemystats1(myres2(:,indankB),myres2(:,indwt), [path_out prefix '_groupstats' suffix],norm); %feed treated in first
