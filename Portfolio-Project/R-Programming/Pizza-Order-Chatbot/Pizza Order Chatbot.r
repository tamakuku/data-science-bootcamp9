
# Link >>> https://colab.research.google.com/drive/1uDgQEttuz78cvsSq8D-_0ZxlHmzE2IgJ?usp=sharing

## build chat bot function, for buy pizza
## ask Input user name, print menu name & price
## each choose menu will + bills value
## print summary bills when Finish choose menu

pizza <- function() {

  ## Initialize bills value
  bills <- 0

  ## Welcome message
  print("Hi Sis!, Tama PizzaRea huge welcome.")
  flush.console()

  print(paste("Lovely", readline("What is your name?: "), "lets see our menu and price below for today"))
  flush.console()

  ## Display menu
  print("number 1 >>> turtle pizza 700 THB")
  print("number 2 >>> shark pizza 800 THB")
  print("number 3 >>> slamander pizza 900 THB")
  print("**Please type number of menu for choosing.**")
  print("Then type finish for billing summary for pay.")
  flush.console()

  while (TRUE) {

    ## Choose menu
    customer_choose <- readline("Please choose number of menu, or type finish for billing. >>>: ")
    flush.console()

    ## Billing summary condition
    if (customer_choose == "finish") {
      print("OK, this is bills for your pay.")
      print(paste("Your bills =", bills, "THB"))
      print("Thanks for your orders, hope you coming again Sis^^.")
      break
    }

    ## Billing conditions
    else if (customer_choose == "1") {
      print("ok, turtle pizza 700 THB one box")
      bills <- bills + 700
      print("Would you like some anything else?")
    }

    else if (customer_choose == "2") {
      print("ok, shark pizza 800 THB one box")
      bills <- bills + 800
      print("Would you like some anything else?")
    }

    else if (customer_choose == "3") {
      print("ok, slamander pizza 900 THB one box")
      bills <- bills + 900
      print("Would you like some anything else?")
    }

    else {
      print("So sorry, we don't have this menu, please choose again")
    }
    flush.console()
  }

  ## Bills = 0 condition
  if (bills == 0) {
    print("Oh!, you not yet choose any menu, please type pizza() for choose again.")
  }

}
