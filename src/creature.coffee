_ = require 'underscore'
nameGenerator = require 'sillyname'
emojis = require 'emoji-named-characters'

class Creature

  constructor: (@hp, @xp) ->
    if typeof @hp == 'undefined'
      @hp = 5
    if typeof @xp == 'undefined'
      @xp = 5
    @name = nameGenerator()
    @damage = 0
    @attackers = {}

  Object.defineProperties @prototype,
    is_dead:
      get: -> @damage >= @hp
    hitpoints:
      get: -> @hp


  @copy: (json) ->
    _.extend(new Creature(1,1), json)

  strike: (damage, hero) ->
    if typeof damage == "string"
      damage = damage.length
    @damage += damage

    @attackers[hero] ||= 0
    @attackers[hero] += damage

  get_loot: ->
    loot = {}
    if @is_dead
      for hero, damage of @attackers
        loot[hero] = {
          xp: Math.floor((damage / @hp) * @xp)
          loot: (emoji.character for emoji in _.sample(emojis, _.random(0,3)))
        }

    return loot

module.exports = Creature
