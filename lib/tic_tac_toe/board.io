Board := Object clone do(  
  init := method(
    self string   := "000000000"
    self asString := string
    self isOver   := false
    self isTie    := false
  )
)
