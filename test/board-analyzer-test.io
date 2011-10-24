doRelativeFile("test-helper.io")
doFile("lib/tic-tac-toe.io")

describe("BoardAnalyzer",
  it("has a factory to create instances for a given board",
    board := Board clone forString("000000000")
    analyzer := BoardAnalyzer forBoard(board)
    analyzer board will == board
  )
  
  it("knows about horizontal wins",
    BoardAnalyzer forBoard(Board forString("111220000")) winner will == 1
    BoardAnalyzer forBoard(Board forString("220111000")) winner will == 1
    BoardAnalyzer forBoard(Board forString("000220111")) winner will == 1
  )
  
  it("knows about vertical wins",
    BoardAnalyzer forBoard(Board forString("122100100")) winner will == 1
    BoardAnalyzer forBoard(Board forString("012210010")) winner will == 1
    BoardAnalyzer forBoard(Board forString("001221001")) winner will == 1
  )
  
  it("knows about diagonal wins",
    BoardAnalyzer forBoard(Board forString("100010001")) winner will == 1
    BoardAnalyzer forBoard(Board forString("001010100")) winner will == 1
  )
  
  it("identifies the correct winner",
    BoardAnalyzer forBoard(Board forString("111220000")) winner will == 1
    BoardAnalyzer forBoard(Board forString("222110000")) winner will == 2
  )
  
  it("does not find a winner when there isn't one",
    BoardAnalyzer forBoard(Board forString("112221121")) winner will == nil
  )
  
  it("knows there is not a tie when there is a winner",
    BoardAnalyzer forBoard(Board forString("112122121")) isTie will == false
  )
  
  it("knows there is not a tie when there are spaces left to move in",
    BoardAnalyzer forBoard(Board forString("112122021")) isTie will == false
  )
  
  it("knows there is a tie when there is nowhere to move and no winner",
    BoardAnalyzer forBoard(Board forString("112221121")) isTie will == true
  )
)
