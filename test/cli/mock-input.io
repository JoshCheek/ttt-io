MockInput := Object clone do(
  init := method(
    self lines := list()
    self timesGotFirstOrSecond := 0
  )
  
  withLines := method(_lines,
    input := MockInput clone
    input lines = _lines
    input
  )
  
  getMove := method(nextInput)
  
  goFirstOrSecond := method(
    timesGotFirstOrSecond = timesGotFirstOrSecond + 1
    nextInput
  )
  
  nextInput := method(lines removeAt(0))
  
)
