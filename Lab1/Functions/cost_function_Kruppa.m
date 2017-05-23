function [ output_args ] = cost_function_Kruppa( w )


global Fs;

output_args = [];

for i=1:size(Fs,3)-1
    for j=i+1:size(Fs,4)
        
        %epipole computation
        [dummy, dummy, v] = svd(Fs(:,:,i,j)');
        ep1 = v(:,end);
        
        first_element =Fs(:,:,i,j) * w * Fs(:,:,i,j)' ;
        division = norm(Fs(:,:,i,j) * w * Fs(:,:,i,j)','fro');
        first_element = first_element / division ;
        
        
        second_element = ep1' * w * ep1 ;
        division = norm(ep1' * w * ep1,'fro');
        second_element = second_element / division ;
        
        
        both_elements = first_element - second_element ;
        
        final_norm = norm( both_elements , 'fro');
        %both_elements
        output_args = final_norm
    end
end


end

