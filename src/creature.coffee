NameGenerator = require 'sillyname'

class Creature

  constructor: (@maximumhitpoints) ->
    @hitpoints = @maximumhitpoints
    @name = NameGenerator()

  get_name: ->
    return @name

module.exports = Creature
