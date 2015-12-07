


module.exports =

	rdm: Math.random

	below: (p) ->
		@rdm() < p

	ab: (a, b) ->
		Math.floor a + (b-a)*@rdm()
