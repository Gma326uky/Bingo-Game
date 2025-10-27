# Bingo Game

For this project, I simulated multiple bingo games, plotted the results, and analyzed the frequency of the types of wins (column, row, and diagonal), and the numbers called for each type of win.


## How It's Made:

**Tech used:** R, Rstudio (tidyverse, ggplot2)

The first thing I did was create 3 bingo functions, one that would generate a bingo card, another that would mark a bingo card if a number is called, and a third one that would check if a bingo card has Bingo. All of these functions are under the "Bingo_Functions" R file.

For the function that generates the bingo card, I had to specify the possible values for the numbers of each of the 5 columns (in Bingo, the first column has numbers from 1-15, the second from 16-30, and so on). Since the third value of the third column in a bingo card is a "Free Space", which counts as a space that is always marked, I set that value to "0" in my function to indicate a marked space.
I created a matrix with these 5 columns, and set the names of the columns to spell "BINGO" like a real Bingo card.

The function that marks the bingo cards takes on the inputs of a bingo card, and a number called, and if the number called is in the card, it is changed to "0" to indicate it was marked.

Finally, the function that checks if a card is a winner will check on the marked card, and see if the sum of any row, column, or diagonal is equal to 0 (since our card cells are marked with a 0 for called numbers), and if any of these sums are 0, it will return that the card is a winner and the type of win, otherwise it will return that the card is a loser.  

After having my 3 functions, I wanted to simulate multiple bingo games to check the frequency of each win type (row, column, and diagonal). These simulations can be found on the "Bingo-Game" file.

The first thing I did was create a new function that would play bingo until a card was a winner. This function would generate a bingo card using our previously created function, generate a hopper with all 75 possible numbers in bingo, and record the numbers called and the win type in a game. Then, while a bingo card was still a losing card, it would call a new number from the hopper and keep playing bingo until the card is a winning card, and return the win type and the amount of numbers called in the game.

After having my function that plays the bingo game, I created a new function that would run our function to play bingo for multiple games, and record the results of each game in a data frame. I plotted the results of this function for sets of 25, 50, 100, and 1,000 games using bar charts in ggplot, and compared the frequency of the win types for each set.

I also used multiple bingo games to check how the amount of numbers called differed by the win type, and after finding that diagonals win required less numbers called on average, I adjusted some of the previous created functions so that they would record if a win used the "Free" space or not, since I thought that might be the reason diagonal wins require less numbers called on average.



## Optimizations

For my function that marks a bingo card, I had originally used a for loop to mark the card, but realized it was unnecessary, as I just had to specify for any element in the bingo card that was equal to the called number to be changed to 0.

Something else I changed was that originally, my function that would check on a bingo win would return "Bingo" if the card was a winner, regardless of the win type. I changed this so that it would also return the win type, so that I would be able to use it in my calculations and plots for the multiple games.

I also improved the comments in my code so that they would be easier to understand step by step.


## Lessons Learned:

After completing this project, I learned that diagonal wins are the least common type of wins, which isn't surprising given that there are only 2 ways of getting a win using a diagonal, compared to 5 different ways using either a row or a column.

After realizing that diagonal wins also needed less numbers called on average, I thought it might be due to the usage of the "Free" for every diagonal win, while row and columns wins only use the "Free" space in 1 out of 5 wins. After checking if my theory was correct, I did found that wins using a "Free" space require less numbers called on average than those that didn't.

One challenge that I encountered in developing my functions was how to check for a bingo win in the inverse diagonal. The method I found most effective to do this was to invert the bingo card by specifying [ ,5:1], and then checking on the diagonal sum of the inverted card.

Something else that was challenging was checking on if a bingo win used the "Free" space or not. I had to adjust my function that checks on a bingo win, and if the win used the diagonals, or the middle rows or columns, record that it used the "Free" space, otherwise record that it didn't use it. Then I created new functions to play a bingo game, and multiple bingo games, using this new function to check on the results instead.

