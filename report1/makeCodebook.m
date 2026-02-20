% codebookを作る関数
function codebook = makeCodebook(fileList)

    maxDescPerImage = 200;
    Features=[];

    for i = 1:numel(fileList)
        I = rgb2gray(imread(fileList{i}));
        
        targetPixels = 320 * 240; %画素数を揃える
        [H, W, ~] = size(I);
        currentPixels = H * W;
        scale = sqrt(targetPixels / currentPixels);
        I = imresize(I, scale);
        
        p = createRandomPoints(I, 2000);
        [f,~] = extractFeatures(I,p);
        if size(f,1) > maxDescPerImage
            rp = randperm(size(f,1), maxDescPerImage);
            f = f(rp,:);
        end
        Features=[Features; f];
    end
    opts = statset('MaxIter', 300);
    [~,codebook] = kmeans(Features, 1000, 'Options', opts);
end
