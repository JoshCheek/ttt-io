doRelativeFile("test-helper.io")
doFile("lib/tic-tac-toe.io")
doFile("test/mock-board-analyzer.io")

describe("Board",
	it("is initially empty",
	  board := Board clone
	  board asString will == "000000000"
  )
  
  it("marks moves on the board",
    board := Board clone
    board mark(9, 1)
    board mark(8, 2)
    board asString will == "000000021"
  )
  
  it("knows who is at a given position",
    board := Board forString("120000210")
    board playerAt(1) will == 1
    board playerAt(2) will == 2
    board playerAt(3) will == nil
    board playerAt(4) will == nil
    board playerAt(5) will == nil
    board playerAt(6) will == nil
    board playerAt(7) will == 2
    board playerAt(8) will == 1
    board playerAt(9) will == nil
  )
  
  it("knows what positions are available",
    board := Board forString("100212012")
    board availablePositions will == list(2, 3, 7)
  )
)