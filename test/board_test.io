doRelativeFile("test_helper.io")
doFile("lib/tic_tac_toe.io")
doFile("test/mock_board_analyzer.io")

describe("Board") do(
	it("is initially empty", block(
	  board := Board clone
	  board asString will == "000000000"
  ))
  
  it("knows it's over when there is a winner", block(
    mockBoardAnalyzer := MockBoardAnalyzer clone setWinner(1)
    Board clone fromString("111220000") withBoardAnalyzer(mockBoardAnalyzer) isOver will == true
  ))
  
  it("knows it's over when there is a tie", block(
    mockBoardAnalyzer := MockBoardAnalyzer clone
    Board clone fromString("112221112") withBoardAnalyzer(mockBoardAnalyzer) isOver will == true
  ))
  
  it("knows when it is not over", block(
    mockBoardAnalyzer := MockBoardAnalyzer clone
    board := Board clone withBoardAnalyzer(mockBoardAnalyzer)
    board isOver will == false
  ))
  
  it("knows when it is not a tie", block(
    Board clone isTie will == false
    Board clone fromString("112221112") isTie will == true
  ))
  
  it("finds out who won from the board analyzer", block(
    mockBoardAnalyzer := MockBoardAnalyzer clone setWinner(1)
    board := Board clone withBoardAnalyzer(mockBoardAnalyzer)
    board winner will == 1
    mockBoardAnalyzer setWinner(2)
    board winner will == 2
  ))
  
  it("marks moves on the board", block(
    board := Board clone
    board mark(9, 1)
    board mark(8, 2)
    board asString will == "000000021"
  ))
  
  it("knows who is at a given position", block(
    board := Board clone fromString("120000210")
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
