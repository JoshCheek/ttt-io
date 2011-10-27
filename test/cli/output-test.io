doRelativeFile("../test-helper.io")

TestHelper linesFromOutput := method(
  file := File temporaryFile
  call evalArgAt(0) call(file)
  file rewind
  lines := file readLines
  file close
  lines
)

describe("Cli Output",
  
  it("askForMoveOn writes to output and has a question mark",
    lines := TestHelper linesFromOutput(block(file,
      output := Cli Output withStream(file)
      output askForMoveOn(MockBoard clone, 1)
    ))
    lines last containsSeq("?") will == true
  )
  
  it("askForMoveOn displays the board",
    board  := MockBoard clone
    lines := TestHelper linesFromOutput(block(file,
      output := Cli Output withStream(file)
      output askForMoveOn(board , 1)
    ))
    board wasAskedForHumanReadable will == true
  )
  
  it("showResults prints the winner when there is one",
    lines := TestHelper linesFromOutput(block(file,
      output := Cli Output withStream(file)
      output showResults(MockBoard clone, 1)
    ))
    lines select(containsSeq("winner is")) isEmpty will == false
    lines select(containsSeq("tie")) isEmpty will == true
  )
  
  it("showResults prints a tie when there isn't one",
    lines := TestHelper linesFromOutput(block(file,
      output := Cli Output withStream(file)
      output showResults(MockBoard clone, nil)
    ))
    lines select(containsSeq("winner is")) isEmpty will == true
    lines select(containsSeq("tie")) isEmpty will == false
  )
  
  it("showResults prints the board",
    board  := MockBoard clone
    lines := TestHelper linesFromOutput(block(file,
      output := Cli Output withStream(file)
      output showResults(board, 1)
    ))
    board wasAskedForHumanReadable will == true
  )
  
  it("goFirstOrSecond prompts user",
    lines := TestHelper linesFromOutput(block(file,
      output := Cli Output withStream(file)
      output goFirstOrSecond
    ))
    lines select(containsSeq("first")) isEmpty will == false
    lines select(containsSeq("second")) isEmpty will == false
  )  
)

