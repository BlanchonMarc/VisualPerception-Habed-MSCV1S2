function cost = cost_function_MC(input_arg)
    global Fs;
    Aj = [input_arg(1)  0  input_arg(2) ; 0 input_arg(3) input_arg(4) ; 0 0 1];
    Ai = [input_arg(1)  0  input_arg(2) ; 0 input_arg(3) input_arg(4) ; 0 0 1];
    cost = 0;
    
    for i=1:size(Fs,3)
        for j=i+1:size(Fs,4)
            [U,S,V] = svd(Aj'*Fs(:,:,i,j)*Ai);
            cost = cost + (S(1,1) - S(2,2)) / (S(1,1) + S(2,2));
        end
    end
end