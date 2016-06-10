NameGenerator = require 'sillyname'

class Creature

  constructor: (@maximumhitpoints) ->
    @hitpoints = @maxhitpoints = @maximumhitpoints
    @name = NameGenerator()

  get_name: ->
    return @name

module.exports = Creature
