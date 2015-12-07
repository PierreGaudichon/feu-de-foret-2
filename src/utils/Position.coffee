


module.exports = class Position


	constructor: () ->
		if arguments.length is 1
			{@x, @y} = arguments[0]
		else if arguments.length is 2
			[@x, @y] = arguments
		else
			throw new Error "Position#constructor called with unvalid arguments."


	neighboors: ->
		north = new Position @x, @y+1
		south = new Position @x, @y-1
		east = new Position @x+1, @y
		west = new Position @x-1, @y
		r = [north, east, south, west]
		r.north = north
		r.east = east
		r.south = south
		r.west = west
		return r


	around: (r) ->
		throw new Error "Position#around not implemented."


	toString: ->
		@x + "_" + @y


	equals: ({x, y}) ->
		(@x is x) and (@y is y)
