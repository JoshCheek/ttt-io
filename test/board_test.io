doRelativeFile("test_helper.io")
doFile("lib/tic_tac_toe.io")
doFile("test/mock_board_analyzer.io")

describe("Board") do(
	it("is initially empty", block(
	  board := Board clone
	  board asString will == "000000000"
  ))
  
  it("marks moves on the board", block(
    board := Board clone
    board mark(9, 1)
    board mark(8, 2)
    board asString will == "000000021"
  ))
  
  it("knows who is at a given position", block(
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
  ))
)
