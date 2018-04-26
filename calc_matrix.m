function mat = calc_matrix(levels, randarray, scaling_factor, mat_dim)
%{
This function calculates the matrix for the random surface using the
diamond-square algorithm.
Inputs: Number of itereations, the scaling factor and the matrix dimensions
Output: Matrix which holds all height values for the surface.
%}

    scale = 1;          % scale, which will change after each iteration

    mat = zeros(mat_dim, mat_dim);  % initialize surface matrix

    % fill corner points of matrix to obtain initial 2*2 square:
    mat(1, 1) = randarray(1);
    mat(1, mat_dim) = randarray(2);
    mat(mat_dim, 1) = randarray(3);
    mat(mat_dim, mat_dim) = randarray(4);
    counter = 4;    % counts how many random numbers have been used already

    %{
    Next we start with the main method:
    For each level, we imagine a grid consisting of the squares whose mid-
    and edge points have to be calculated on that level. We iterate
    through each level:
    %}
    for lvl = 1 : levels

        scale = scale * scaling_factor;     % decrease the scale

        % number of squares that have to be partitioned on this level
        no_squares = 2^((lvl-1)*2);
        no_rows = sqrt(no_squares); % (also equal to number of columns)
        index_in = (mat_dim - 1) / (no_rows);% index increment for corners

        % go through each square and calculate the midpoints and edges:
        for row = 1 : no_rows
            for col = 1 : no_rows

                % first find the indices of the square's corner points in
                % the main matrix "mat":
                left_up = [(row-1)*index_in + 1; (col-1)*index_in + 1];
                right_up = [left_up(1); left_up(2) + index_in];
                left_down = [left_up(1) + index_in; left_up(2)];
                right_down = [left_up(1) + index_in; left_up(2) + index_in];


                % calculate the midpoint and add a random number to it:
                
                % first, find values of the corner points
                left_up_val = mat(left_up(1), left_up(2));
                right_up_val = mat(right_up(1), right_up(2));
                left_down_val = mat(left_down(1), left_down(2));
                right_down_val = mat(right_down(1), right_down(2));

                % calculate average of the corner points
                avg = (left_up_val + right_up_val + left_down_val ...
                    + right_down_val) / 4;

                % compute midpoint value by adding a random number:
                midpoint_val = avg + scale*randarray(counter + 1);
                counter = counter + 1;

                % store the midpoint value in the matrix:
                mat(left_up(1) + (index_in / 2), left_up(2) + ...
                    (index_in / 2)) = midpoint_val;


                % calculate the edge points and add random numbers to them:
                left_val = (left_up_val + left_down_val + midpoint_val) ...
                    / 3 + scale*randarray(counter+1);
                mat(left_up(1) + (index_in / 2), left_up(2)) = left_val;

                top_val = (left_up_val + right_up_val + midpoint_val) ...
                    / 3 + scale*randarray(counter+2);
                mat(left_up(1), left_up(2) + (index_in / 2)) = top_val;

                bot_val = (left_down_val + right_down_val + ...
                    midpoint_val) / 3 + scale*randarray(counter+3);
                mat(right_down(1), right_down(2) - (index_in / 2)) ...
                    = bot_val;

                right_val = (right_down_val + right_up_val + ...
                    midpoint_val) / 3 + scale*randarray(counter+4);
                mat(right_down(1)- (index_in / 2), right_down(2)) ...
                    = right_val;
                
                counter = counter + 4;

            end     % end iterating through columns
        end 	% end iterating through rows
    end   	% end iterating through levels


return