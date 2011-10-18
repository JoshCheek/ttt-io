doRelativeFile("test_helper.io")
doFile("lib/tic_tac_toe.io")

describe("Board") do(
	it("is represented as a string of digits", block(
	  board := Board clone
	  board asString will == "000000000"
  ))
)
