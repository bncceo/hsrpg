class Hero
  constructor: (@maximumHitPoints) ->
    @hitpoints = @maximumHitPoints
    @damage = 0

  is_dead: ->
    get: -> @damage >= @hitpoints

  strike: (damage) ->
    if typeof damage == "string"
      damage = damage.length

    @damage += damage

module.exports = Hero
