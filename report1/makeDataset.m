function [X, y] = makeDataset(posDir, negDir)

    X = [];
    y = [];

    % positive
    posImges = dir(fullfile(posDir, '*.jpg'));
    for i = 1:length(posImges)
        filename = fullfile(posDir, posImges(i).name);
        I = imread(filename);

        targetPixels = 320 * 240; %画素数を揃える
        [H, W, ~] = size(I);
        currentPixels = H * W;
        scale = sqrt(targetPixels / currentPixels);
        I = imresize(I, scale);

        h = makeHist(I);
        X = [X; h];
        y = [y; 1];
    end

    % negative
    negImges = dir(fullfile(negDir, '*.jpg'));
    for i = 1:length(negImges)
        filename = fullfile(negDir, negImges(i).name);
        I = imread(filename);

        targetPixels = 320 * 240; %画素数を揃える
        [H, W, ~] = size(I);
        currentPixels = H * W;
        scale = sqrt(targetPixels / currentPixels);
        I = imresize(I, scale);

        h = makeHist(I);
        X = [X; h];
        y = [y; 0];
    end

end
