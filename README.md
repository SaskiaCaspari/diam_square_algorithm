# Diamond-Square Algorithm
This code is a MATLAB implementation of the diamond-square algorithm to create a random surface.

The goal of the diamond-square method is to generate a random surface - for example for the purpose of creating a landscape.
One iteration of the algorithm, which is also graphically outlined in the figure below, is briefly described as follows:

1. Start with a 2x2 square with four randomly chosen corner points, as shown in the left part of the figure below.

2. Calculate the average of the four corner points and add a random value to the result. For this
implementation we use the self-built random number generator to generate random numbers
between -1 and 1, which are multiplied with a scaling factor. This scale initially equals 1,
but decreases by a factor of 2 with every iteration of this algorithm. The resulting value is
assigned to the midpoint of the square, as shown in the middle part of the figure below.

3. Calculate the edge points of the square by taking the average of the midpoint and the two
neighboring corner points and adding a scaled random number to the result. This step is illustrated
in the right part of the figure below

![Diagram1](https://github.com/SaskiaCaspari/diam_square_algorithm/blob/master/media/diam.JPG)

The procedure above is repeated for the new squares that were created in the process. In this Matlab implementation,
the algorithm iterates through each row and column
on each level, defines the corner points of the current square that is considered and conducts the
procedure to calculate midpoints and edges.

![Diagram2](https://github.com/SaskiaCaspari/diam_square_algorithm/blob/master/media/diam2.JPG)
