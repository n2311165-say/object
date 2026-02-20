% AlexNetの設定をする関数
function [net, featLayer, inputSize] = setAlexNet()

    net = alexnet;
    featLayer = 'fc7';
    inputSize = net.Layers(1).InputSize;

end
