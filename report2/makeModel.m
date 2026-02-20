function svmMdl = makeModel(dir)
% 学習データの用意
posDir = fullfile(pwd, dir);
negDir = fullfile(pwd, 'bgimg');
posImg = imageDatastore(posDir);
negAll = imageDatastore(negDir);
numNeg = 500;

idx = randperm(numel(negAll.Files), numNeg);
negImg = imageDatastore(negAll.Files(idx));
posImg.Labels = categorical(repmat("pos", numel(posImg.Files), 1));
negImg.Labels = categorical(repmat("neg", numel(negImg.Files), 1));

imdsTrain = imageDatastore([posImg.Files; negImg.Files], 'Labels', [posImg.Labels; negImg.Labels]);

% DCNN特徴抽出(Alexnet)
net = alexnet;
inputSize = net.Layers(1).InputSize;

aug = augmentedImageDatastore(inputSize(1:2), imdsTrain);

featureLayer = "fc7";
X = activations(net, aug, featureLayer, "MiniBatchSize", 64, "OutputAs","rows");
Y = imdsTrain.Labels;

% SVM
svmMdl = fitcsvm(X, Y, "KernelFunction","linear", "Standardize", true, "ClassNames", categorical(["pos","neg"]));
[pred, score] = predict(svmMdl, X);
acc = mean(pred == Y);
fprintf("Train accuracy = %.2f%%\n", acc*100);
end