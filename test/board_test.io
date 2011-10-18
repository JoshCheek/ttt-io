doRelativeFile("test_helper.io")
doFile("lib/tic_tac_toe.io")

describe("Board") do(
	it("is initially empty", block(
	  board := Board clone
	  board asString will == "000000000"
  ))
  
  it("knows when it is not over", do(
    board := Board clone
    board isOver will == false
  ))
  
  it("knows when it is not a tie" do(
    board := Board clone
    board isTie will == false
  ))
)
