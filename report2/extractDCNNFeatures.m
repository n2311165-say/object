function [Xtest, imdsTest] = extractDCNNFeatures()
testDir = fullfile(pwd, 'interesting');
imdsTest = imageDatastore(testDir);

% DCNN特徴抽出(Alexnet)
net = alexnet;
inputSize = net.Layers(1).InputSize;
augTest = augmentedImageDatastore(inputSize(1:2), imdsTest);

featureLayer = "fc7";
Xtest = activations(net, augTest, featureLayer, "MiniBatchSize", 64, "OutputAs","rows");

end