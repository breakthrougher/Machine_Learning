function W=randomInitialWeights(Layer_in,Layer_out)
%   Note that W should be set to a matrix of size(L_out, 1 + L_in) as
%   the first column of W handles the "bias" terms
    W=zeros(Layer_out,Layer_in+1);
    epsilon_init = 0.12;
    W=rand(Layer_out, Layer_in+1) * 2 * epsilon_init - epsilon_init;    
end