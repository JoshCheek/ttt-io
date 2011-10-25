doRelativeFile("../test-helper.io")

describe("Cli Input",
  it("getMove reads lines from its input",
    file := File temporaryFile
    file write("3\n2\n1")
    file rewind
    input := Cli Input withStream(file)
    input getMove will == 3
    input getMove will == 2
    input getMove will == 1
    file close
  )
)
