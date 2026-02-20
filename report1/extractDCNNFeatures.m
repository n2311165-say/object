% DENN特徴量を抽出する関数
function X = extractDCNNFeatures(fileList, net, featLayer, inputSize)

    N = numel(fileList);

    % 特徴次元を確認
    I1 = imread(fileList{1});
    I1 = imresize(I1, [inputSize(1) inputSize(2)]);
    f1 = activations(net, I1, featLayer, 'OutputAs', 'rows');
    D = size(f1, 2);

    X = zeros(N, D);

    for i = 1:N
        I = imread(fileList{i});
        I = imresize(I, [inputSize(1) inputSize(2)]);

        f = activations(net, I, featLayer, 'OutputAs', 'rows');
        X(i, :) = f;
    end
end
