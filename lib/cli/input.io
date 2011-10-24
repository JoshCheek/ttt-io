hasSlot("Cli") ifFalse(Cli := Object clone)

Cli Input := Object clone do(
  getMove := method(
    File standardInput readLine asNumber
  )
)
