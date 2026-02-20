function acc = crossVal_2(X, y)

    N = size(X,1);

    perm = randperm(N);
    fold_id = zeros(N,1);
    for i = 1:N
        fold_id(perm(i)) = mod(i-1, 5) + 1;
    end

    acc_each = zeros(5,1);

    for k = 1:5
        test_mask  = (fold_id == k);
        train_mask = ~test_mask;

        X_train = X(train_mask, :);
        y_train = y(train_mask);
        X_test  = X(test_mask, :);
        y_test  = y(test_mask);

        % 非線形SVM
        model = fitcsvm(X_train, y_train, ...
            'KernelFunction', 'rbf', ...
            'BoxConstraint', 1, ...
            'KernelScale', 'auto', ...
            'Standardize', true);

        y_pred = predict(model, X_test);
        acc_each(k) = mean(y_pred == y_test);
    end

    acc = mean(acc_each);
end
