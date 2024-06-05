
# Link >>> https://colab.research.google.com/drive/1LSXjII2WVPlVhZJ1jBXRmAZy1GGHsbsH?usp=sharing

## Def RPS game function
## ask Input user name, print game rule
## each turn will get 1 Score for winner
## print summary score when Stop play

game <- function() {
  
  ## return score value
  player_score <- 0
  com_score <- 0
  
  ## return RPS value
  hands <- c( "hammer", "sisscors", "paper" )
  
  ## welcome step
  print ( "Yo bro!, welcome into RPS game" )
  flush.console()
  
  print ( paste ( "Ok", readline( "What is your name?: " ), "lets play game." ) )
  flush.console()
  
  print ( "***please read the game rules below.***" )
  print ( "1) choose which one for your turn." )
  print ( "2) then let me choose too." )
  print ( "3) for each turn who win get 1 score." )
  print ( "4) type stop if want to end game and see summary score" )
  flush.console()
  
  while ( TRUE ) {
    
    ## player turn choose
    player_hand <- readline ( "Please choose hammer, sisscors, paper or stop: " )
    flush.console()
    
    ## Stop condition
    if ( player_hand == "stop" )
    { print ( "OK stop game, Then lets see our score" )
      print ( paste ( "yours_score = ",  player_score ) )
      print ( paste ( "my_score = ",  com_score ) )
      break }
    
    ## com turn random choose
    com_hand <- sample ( hands, 1 )
    print ( paste ( "You choose", player_hand ) )
    print ( paste ( "I'm choose", com_hand ) )
    flush.console()
    
    ## draw condition
    if ( player_hand == com_hand )
    { print ( "Oh We drawed this turn." ) }
    
    ## win conditions
    else if ( ( player_hand == "hammer" & com_hand == "sisscors" ) |
              ( player_hand == "sisscors" & com_hand == "paper" ) |
              ( player_hand == "paper" & com_hand == "hammer" ) )
    { print ( "You win this turn then got 1 score." )
      player_score <- player_score + 1 }
    
    ## lose condition
    else { print ( "You losed this turn, I got 1 score." )
      com_score <- com_score + 1 }
    flush.console()
  }
  
  ## end_score print conditions
  if ( player_score == com_score )
  { print ( "Oh! we draw this game, type game() for play again") }
  
  else if ( player_score > com_score )
  { print ("Great! you win this game, type game() for play again") }
  
  else
  { print ("Hahaha! you lose this game, type game() for play again") }
  
}
