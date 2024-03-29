doRelativeFile("test-helper.io")

describe("Board",
	it("is initially empty",
	  board := Board clone
	  board isEmpty will == true
  )
  
  it("knows when it is empty",
    Board forString("000000000") isEmpty will == true
    Board forString("100000000") isEmpty will == false
  )
  
  it("knows when it is full",
    Board forString("112221120") isFull will == false
    Board forString("112221121") isFull will == true
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
  
  it("can represent itself in human readable form",
    board := Board forString("120000012")
    board humanReadable will == ("   |   |   \n" ..
                                " X | O |   \n" ..
                                "   |   |   \n" ..
                                "-----------\n" ..
                                "   |   |   \n" ..
                                "   |   |   \n" ..
                                "   |   |   \n" ..
                                "-----------\n" ..
                                "   |   |   \n" ..
                                "   | X | O \n" ..
                                "   |   |   \n")
  )
  
  it("supports undoing",
    board := Board forString("000000000")
    board mark(9, 1) mark(8, 2)
    board asString will == "000000021"
    board undo asString will == "000000001"
    board undo asString will == "000000000"
  )
)
