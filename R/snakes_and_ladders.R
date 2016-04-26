
check_snake = function(square) {
  switch(as.character(square), 
         '16'=6,  '49'=12, '47'=26, '56'=48, '62'=19, 
         '64'=60, '87'=24, '93'=73, '96'=76, '98'=78, 
         square)
}

check_ladders = function(square) {
  switch(as.character(square), 
         '1'=38,  '4'=14, '9'=31, '28'=84, '37'=43, 
         '51'=67, '69'=91, '79'=100,
         square)
}

move = function(square, die) {
  square = square + die
  if(square > 100)  square = 200 - square
  square
}

#' Snakes and Ladders
#' 
#' A simple game of snakes and ladders.
#' @param i A dummy argument needed for the parallel interface.
#' @return Number of rolls needed to win.
#' @export
snakes_ladders = function(i=1) {
  square = 1
  no_of_rolls = 0
  while(square < 100) {
    die = 6 # Keep moving if you get a 6!
    while(die == 6) {
      die = sample(1:6, 1)
      square = move(square, die)
      no_of_rolls = no_of_rolls + 1
    }
    square = check_snake(square)
    square = check_ladders(square)
  }
  no_of_rolls
}