function [ output_args ] = cost_function_Kruppa(F , parameters )

A = [parameters(1) parameters(3) parameters(4); 0 parameters(2) parameters(4); 0 0 1];

w =A*A';
output_args = [];
for i=1:size(F,3)
    for j=i+1:size(F,4)
        
        %epipole computation
        [dummy, dummy, v] = svd(F(:,:,i,j)');
        ep = v(:,3);
        ep1 = [0 -ep(3) ep(2) ; ep(3) 0 -ep(1) ; -ep(2) ep(1) 0];
        
        first_element =F(:,:,i,j) * w * F(:,:,i,j)' ;
        division = norm(F(:,:,i,j) * w * F(:,:,i,j)','fro');
        first_element = first_element / division ;
        
        
        second_element = ep1 * w * ep1' ;
        division = norm(ep1 * w * ep1','fro');
        second_element = second_element / division ;
        
        
        both_elements = first_element - second_element ;
        
        %final_norm = norm( both_elements , 'fro');
        %both_elements
        output_args = [output_args both_elements(1,:) both_elements(2,2:3) both_elements(3,3)];
    end
end


end

