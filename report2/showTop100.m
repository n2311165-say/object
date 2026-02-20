% 再ランキングした結果の上位100枚を表示する関数
function showTop100(rankedFiles,n)
topFiles = rankedFiles(1:100);
figure;
for i = 1:100
    img = imread(topFiles{i});
    subplot(10,10,i);
    imshow(img);
    axis off;
end
sgtitle(sprintf('n = %d Top 100 Images by SVM Score', n));
end