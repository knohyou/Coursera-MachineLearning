function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = [0.01 1 10 ];
sigma = [0.01, 0.1, 1, 10];

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
pred_error = zeros(length(C),length(sigma));
for i = 1:length(C)
  for j = 1:length(sigma)
model = svmTrain(X, y, C(i), @(x1, x2) gaussianKernel(x1, x2, sigma(j)));
predictions  = svmPredict(model, Xval); 
pred_error(i,j) = mean(double(predictions ~= yval));
  end
end

%imagesc(pred_error)
%colorbar

[C_min, sigma_min, min_val] = find(pred_error == min(min(pred_error))); 

C = C(C_min);
sigma = sigma(sigma_min);
% =========================================================================

end
