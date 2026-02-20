function X = makeHist(I)

A = double(reshape(I,[],3));
B = floor(A / 64);

idx = B(:,1)*16 + B(:,2)*4 + B(:,3);
edges = 0:64;
counts = histc(idx, edges);
counts = counts(1:64);

X = counts(:).' / size(A,1);
end
