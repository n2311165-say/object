% 画像ファイルをまとめる関数
function [fileList, y] = makeFileList(posDir, negDir)

    pos = dir(fullfile(posDir, '*.jpg'));
    neg = dir(fullfile(negDir, '*.jpg'));

    numPos = numel(pos);
    numNeg = numel(neg);
    N = numel(pos) + numel(neg);

    fileList = cell(N,1);
    y = zeros(N,1);

    idx = 1;
    for i = 1:numPos
        fileList{idx} = fullfile(posDir, pos(i).name);
        y(idx) = 1;
        idx = idx + 1;
    end

    for i = 1:numNeg
        fileList{idx} = fullfile(negDir, neg(i).name);
        y(idx) = 0;
        idx = idx + 1;
    end
end
