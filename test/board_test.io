doRelativeFile("test_helper.io")
doFile("lib/tic_tac_toe.io")

describe("Board") do(
	it("is initially empty", block(
	  board := Board clone
	  board asString will == "000000000"
  ))
  
  it("knows when it is not over", block(
    board := Board clone
    board isOver will == false
  ))
  
  it("knows when it is not a tie", block(
    board := Board clone
    board isTie will == false
  ))
  
  it("marks moves on the board", block(
    board := Board clone
    board mark(9, 1)
    board mark(8, 2)
    board asString will == "000000021"
  ))
)
