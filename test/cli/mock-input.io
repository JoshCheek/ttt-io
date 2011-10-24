MockInput := Object clone do(
  init := method(
    self lines := list()
  )
  
  withLines := method(_lines,
    input := MockInput clone
    input lines = _lines
    input
  )
  
  getMove := method(lines removeAt(0))
)
