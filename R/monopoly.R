##Dice function
#' @export
move_square = function(current) {
  df = data.frame(d1 = sample(seq(1, 6), 3, replace = TRUE),
                  d2 = sample(seq(1, 6), 3, replace = TRUE))
  
  df$Total = apply(df, 1, sum)
  df$IsDouble = df$d1 == df$d2
  
  if (df$IsDouble[1] & df$IsDouble[2] & df$IsDouble[3]) {
    current = 11#Go To Jail
  } else if (df$IsDouble[1] & df$IsDouble[2]) {
    current = current + sum(df$Total[1:3])
  } else if (df$IsDouble[1]) {
    current = current + sum(df$Total[1:2])
  } else {
    current = current + df$Total[1]
  }
  return(current)
}

##Helper function to avoid code replication
check_state = function(current) {
  if (current > 40) {
    current = current - 40
  } else if (current < 1) {
    current = current + 40
  }
  return(current)
}
update_state_vector = function(current, move, landings) {
  if (move != current) {
    landings[current] = landings[current] + 1
  }
  return(landings)
}
community_chest = function(current) {
  u = runif(1)
  goto = current#Default. Do nothing
  if (u < 1 / 16) {
    goto = 1#Go
  } else if (u < 2 / 16) {
    goto = 11#Jail
  } else if (u < 3 / 16) {
    goto = 2#Old Kent Rd
  } else if (u < 4 / 16) {
    goto = chance(current)
  }
  return(goto)
}


#' @importFrom stats runif
chance = function(current) {
  u = runif(1)
  goto = current#Default. Do nothing
  if (u < 1 / 16) {
    goto = 1#Go
  } else if (u < 2 / 16) {
    goto = 25#Tra Square
  } else if (u < 3 / 16) {
    goto = 12#Pall Mall
  } else if (u < 4 / 16) {
    goto = 11#Jail
  } else if (u < 5 / 16) {
    goto = 16#Mary' Stat
  } else if (u < 6 / 16) {
    goto = 40#Mayfair
  } else if (u < 7 / 16) {
    goto = check_state(current - 3)#Must check, since goto maybe negative!
  } else if (u < 8 / 16) {
    if (current > 29  | current < 13) {
      goto = 13
    } else {
      goto = 29
    }
  }
  return(goto)
}


#' Monte Carlo Simulation of Monopoly
#'
#' An R function for simulating the game of Monopoly
#' @param no_of_turns How many dice rolls should we take
#' @export
simulate_monopoly = function(no_of_turns) {
  landings = numeric(40)
  ##Start GO
  current = 1
  for (i in 1:no_of_turns) {
    current = move_square(current)
    current = check_state(current)
    landings = update_state_vector(current,-1, landings)
    
    if (current == 8 | current == 23 | current == 37) {
      #Chance
      move = chance(current)
      landings = update_state_vector(move, current, landings)
      current = move
    }
    
    if (current == 3 |
        current == 18 | current == 34) {
      #Community Chest
      move = community_chest(current)
      landings = update_state_vector(move, current, landings)
      current = move
    }
    
    ##Go To Jail. Chance could also send you here by
    ##going back three places
    if (current == 31) {
      current = 11
      landings = update_state_vector(current,-1, landings)
    }
    
  }
  return(landings)
}
