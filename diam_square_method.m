function diam_square_method(levels, scaling_factor, seed)
%{
-------------- Diamond-Square Algorithm ------------------
This function creates a random surface using the diamond-square algorithm
 and plots the result. The input parameters are the number of iterations
 of the algorithm (levels), the scaling factor with which the scale changes
 in each iteration and the seed value for the random number generation.
%}

    mat_dim = 2;    % initial matrix dimensions are 2x2
    
    % calculate how many rows and column the final matrix will have:
    for i = 1 : levels
        mat_dim = 2 * mat_dim - 1;
    end

    % generate random numbers between -1 and 1:
    n = 2 * mat_dim * mat_dim;  % number of random numbers
    rng(seed, 'multFibonacci');
    randarray = -1 + 2 * rand(n,1);

    surface_matrix = calc_matrix(...
        levels, randarray, scaling_factor, mat_dim);

    % plot the results
    surf(surface_matrix)
    colormap(summer)
    
return
    


