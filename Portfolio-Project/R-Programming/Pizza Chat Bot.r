
## build chat bot function, for buy pizza
## ask Input user name, print menu name & price
## each choose menu will + bills value
## print summary bills when Finish choose menu

pizza <- function() {
  
  ## bills value
  bills <- 0
  
  ## welcome step
  print ( "Hi Sis!, Tama PizzaRea huge welcome." )
  flush.console()
  
  print ( paste ( "Lovely", readline( "What is your name?: " ), "lets see our menu and price below for today" ) )
  flush.console()
  
  print ( "number 1 >>> turtle pizza 700 THB" )
  print ( "number 2 >>> shark pizza 800 THB" )
  print ( "number 3 >>> slamander pizza 900 THB" )
  print ( "**Please type number of menu for choosing.**" )
  print ( "Then type finish for billing summary for pay." )
  flush.console()
  
  while ( TRUE ) {
    
    ## choose menu
    customer_choose <- readline ( "Please choose number of menu, or type finish for billing. >>>: " )
    flush.console()
    
    ## call billing step condition
    if ( customer_choose == "finish" )
    { print ( "OK, this is bills for your pay." )
      print ( paste ( "Your bills =", bills, "THB" ) )
      print ( "Thanks for your orders, hope you coming again Sis^^.")
      break }
    
    ## billing conditions
    else if ( customer_choose == "1" )
    { print ( "ok, turtle pizza 700 THB one box" )
      bills <- bills + 700
      print ( "Would you like some anything else?") }
    
    else if ( customer_choose == "2" )
    { print ( "ok, shark pizza 800 THB one box" )
      bills <- bills + 800
      print ( "Would you like some anything else?") }
    
    else if ( customer_choose == "3" )
    { print ( "ok, slamander pizza 900 THB one box" )
      bills <- bills + 800
      print ( "Would you like some anything else?") }
    
    else
    { print ( "So sorry, we don't have this menu, please choose again") }
    flush.console()
  }
  
  ## bills = 0 condition
  if ( bills == 0 )
  { print ( "Oh!, you not yet choose any menu, please type pizza() for choose again.") }
  
}
