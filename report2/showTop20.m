function showTop20(rankedFiles,n)
topFiles = rankedFiles(1:20);
figure;
for i = 1:20
    img = imread(topFiles{i});
    subplot(4,5,i);
    imshow(img);
    axis off;
    title(sprintf('%d位', i), 'FontSize', 12);
end
sgtitle(sprintf('n = %d Top 20 Images by SVM Score', n));
end