% BoFベクトルを作る関数
function X = makeBoF(fileList, codebook)
    N = numel(fileList);
    K = size(codebook,1);
    X = zeros(N, K);

    for i = 1:N
        I = rgb2gray(imread(fileList{i}));

        targetPixels = 320 * 240; %画素数を揃える
        [H, W, ~] = size(I);
        currentPixels = H * W;
        scale = sqrt(targetPixels / currentPixels);
        I = imresize(I, scale);

        p = createRandomPoints(I, 2000);
        [f, ~] = extractFeatures(I, p);
        D = pdist2(f, codebook, 'euclidean');
        [~, minIdx] = min(D, [], 2);
        X(i, :) = histcounts(minIdx, 1:K+1);
        X(i, :) = X(i, :) / sum(X(i, :));
    end
end