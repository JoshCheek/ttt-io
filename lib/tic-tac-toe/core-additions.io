# for whatever reason, my Io has a Sequence asList method
# but others do not. This adds that so that it will work everywhere (my code uses it)

Sequence asList := method(
  toReturn := list
  foreach(x, toReturn append(x asCharacter))
  toReturn
)
