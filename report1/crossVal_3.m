% 線形SVMで5-fold cross validationを行う関数
function acc = crossVal_3(X, y)

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

        % 線形SVM
        model = fitcsvm(X_train, y_train, ...
            'KernelFunction', 'linear', ...
            'BoxConstraint', 1, ...
            'Standardize', true);


        y_pred = predict(model, X_test);
        acc_each(k) = mean(y_pred == y_test);
    end

    acc = mean(acc_each);
end
