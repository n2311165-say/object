function report2()
SVMModel50 = makeModel('oyakodon50');
[X50, imdsTest50] = extractDCNNFeatures();
[label50, score50] = predict(SVMModel50, X50);
[~, idx50] = sort(score50(:,2),'ascend');
rankedFiles50 = imdsTest50.Files(idx50);
showTop20(rankedFiles50,50);
showTop100(rankedFiles50,50);
SVMModel25 = makeModel('oyakodon25');
[X25, imdsTest25] = extractDCNNFeatures();
[label25, score25] = predict(SVMModel25, X25);
[~, idx25] = sort(score25(:,2),'ascend');
rankedFiles25 = imdsTest25.Files(idx25);
showTop20(rankedFiles25,25);
showTop100(rankedFiles25,25);
end