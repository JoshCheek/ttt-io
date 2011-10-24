doRelativeFile("../test-helper.io")

describe("Cli Driver",
  it("knows its board",
    driver := Cli Driver clone withBoard("121000000") withInput(MockInput clone) withOutput(MockOutput)
    driver board asString will == "121000000"
  )
  
  it("prompts the player for every move until the game is over",
    input  := MockInput withLines(list(1, 2, 5, 9, 4, 6, 7, 3, 8))
    output := MockOutput clone
    driver := Cli Driver clone withBoard("000000000") withInput(input) withOutput(output)
    driver input will == input
    driver output will == output
    driver drive
    output numberOfTimesWasAskedForMove will == 7
    output wasAskedToShowResultsWith("120112102", 1) will == true
  )
)
