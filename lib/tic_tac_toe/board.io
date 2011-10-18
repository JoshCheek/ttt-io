Board := Object clone do(  
  init := method(
    self string   := "000000000"
    self asString := method(string)
    self isOver   := method(false)
  )
)
