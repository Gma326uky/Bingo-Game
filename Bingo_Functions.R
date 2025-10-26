# BINGO ----


## 1. A function that creates a Bingo card. ----


bingo_card <- function(){
  # Columns of bingo card.
  col_1 = c(sample(1:15, size = 5, replace = FALSE))
  col_2 = c(sample(16:30, size = 5, replace = FALSE))
  col_3 = c(sample(31:45, size = 5, replace = FALSE))
  col_4 = c(sample(46:60, size = 5, replace = FALSE))
  col_5 = c(sample(61:75, size = 5, replace = FALSE))
  # Set middle value of column 3 to 0 to represent Free space in Bingo card
  col_3[3] = 0
  # Create Bingo card.
  card <- matrix(c(col_1, col_2, col_3, col_4, col_5), nrow = 5, ncol = 5)
  # Name of columns of Bingo card.
  colnames(card) <- c("B", "I", "N", "G", "O")
  card <- card
}


## 2. A function that plays Bingo by "marking" a Bingo card according to a single number called. ----


marked_card <- function(my_bingo_card, called_number){{
  # If the called number is in the card, change number to 0 in the card.
  my_bingo_card[my_bingo_card == called_number] <- 0
}
  my_bingo_card <- my_bingo_card
}


## 3.A function that considers a Bingo card and states whether or not the card wins the game. ----


bingo_result_checker <- function(my_marked_card) {
  # Check for Bingo in rows.
  if(any(rowSums(my_marked_card) == 0)){
    "BINGO Row"
  # Check for Bingo columns.
  } else if(any(colSums(my_marked_card) == 0)){
    "BINGO Column"
  # Check for Bingo in diagonals.
  } else if(
  # Sum of diagonal
    sum(diag(my_marked_card)) == 0 |
  # Sum of inverse diagonal
    sum(diag(my_marked_card[, 5:1])) == 0
    ){
    "BINGO Diagonal"
  # If no Bingo, card is loser.
  } else {
    "Loser"
  }
}


