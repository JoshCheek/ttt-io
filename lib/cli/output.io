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
    player := board playerNumberToMarker(turn)
    stream write(board humanReadable)
    stream write("Where would you like to move, " .. (player asString) .. "? ")
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
)
