# Diamond-Square Algorithm
This code is a MATLAB implementation of the diamond-square algorithm to create a random surface.

The goal of the diamond-square method is to generate a random surface - for example for the purpose of creating a landscape.
One iteration of the algorithm, which is also graphically outlined in the figure below, is briefly described as follows:

      1. Start with a 2x2 square with four randomly chosen corner points, as outlined in the left part
      of Figure 10.
      2. Calculate the average of the four corner points and add a random value to the result. For this
      implementation we use the self-built random number generator to generate random numbers
      between -1 and 1, which are multiplied with a scaling factor. This scale initially equals 1,
      but decreases by a factor of 2 with every iteration of this algorithm. The resulting value is
      assigned to the midpoint of the square as illustrated in the middle part of Figure 10.
      3. Calculate the edge points of the square by taking the average of the midpoint and the two
      neighboring corner points and adding a scaled random number to the result. This step is
      illustrated in the right part of Figure 10.
