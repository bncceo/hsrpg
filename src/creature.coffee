NameGenerator = require 'sillyname'

class Creature

  constructor: (@maximumhitpoints) ->
    @hitpoints = @maximumhitpoints
    @name = NameGenerator()
    @damage = 0

  get_name: ->
    return @name

  hp: ->
    return @hitpoints

  is_dead: ->
    return @damage >= @hitpoints

  strike: (damage) ->
    if typeof damage == "string"
      damage = damage.length
    @damage += damage

module.exports = Creature
