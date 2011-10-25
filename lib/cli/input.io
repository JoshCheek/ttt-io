# this is a hack to fix a bug where reading the line from stdin would print out nil
# it's been fixed in the main io lib, but hasn't been pulled into mainline yet
DummyLine readLine := method(prompt, if(prompt, prompt print); resend)



hasSlot("Cli") ifFalse(Cli := Object clone)

Cli Input := Object clone do(
  init := method(
    self stream := File standardInput
  )
  
  withStream := method(newStream,
    input := Cli Input clone
    input stream = newStream
    input
  )
  
  getMove := method(stream readLine asNumber)
)
