function y_pred = nnClassify(X_train, y_train, X_test)

    Ntest = size(X_test, 1);
    y_pred = zeros(Ntest, 1);

    for i = 1:Ntest
        diff = X_train - X_test(i, :);
        dist2 = sum(diff.^2, 2);

        [~, idx] = min(dist2);
        y_pred(i) = y_train(idx);
    end
end
