hasSlot("Cli") ifFalse(Cli := Object clone)

Cli Output := Object clone do(
  init := method(
    self stream := File standardOutput
  )
  
  withStream := method(newStream,
    output := Cli Output clone
    output stream = newStream
    output
  )

  askForMoveOn := method(board, turn,
    stream write(board humanReadable)
    stream write("Where would you like to move (1-9)? ")
    self
  )

  showResults := method(board, winner,
    stream write(board humanReadable)
    winnerMarker := board playerNumberToMarker(winner)
    if(winner,
      stream write("\nThe winner is " .. winnerMarker .. "!\n"),
      stream write("\nThe game ended in a tie!\n")
    )
    self
  )
  
  goFirstOrSecond := method(
    stream write("Do you want to go first or second (1 or 2)? ")
  )
  
  alertInvalid := method(
    stream write("That is not a valid input.\n")
  )
)
