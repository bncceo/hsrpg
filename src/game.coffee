Creature = require './creature'

class Game
  prefix: '☠ '

  constructor: (@robot, @storage, @res=undefined) ->
    console.log 'Game initiated'
    heroes: {}

  Object.defineProperties @prototype,
    creature:
      get: ->
        if typeof @storage.creature != 'Creature'
          @storage.creature = Creature.copy(@storage.creature)
        @storage.creature
      set: (c) ->
        @storage.creature = c
    hero:
      get: -> @get_hero(@hero_name)
    hero_name:
      get: -> @res.message.user.name
    heroes:
      get: -> @storage.heroes

  get_hero: (hero) ->
    @heroes[hero] ||= {xp: 0, loot: {}}
    @heroes[hero]

  fightmonster: (res) ->
    @creature.strike(3, @hero_name)

    @send "#{@hero_name} strikes #{@creature.name} dealing 3 damage! He has #{@creature.damage} damage done to his #{@creature.hitpoints} hitpoints!"
    if @creature.is_dead
      for adventurer, loot of @creature.get_loot()
        @announce_creature_death()

      @new_creature()
      @announce_creature()
    else
      @send 'He lived! You must strike again!'
    @save()

  announce_creature: ->
    @send "Suddenly a rabid #{@creature.name} appears!"

  announce_creature_death: ->
    @send "Huzzah! #{@hero_name} has defeated #{@creature.name}!"

  new_creature: ->
    xp = Math.floor(@creature.hp * 3.13) || 1
    hp = Math.floor(@creature.hp * 1.13) || 1

    if hp == hp then hp++
    if xp == xp then xp++

    @creature = new Creature(hp, xp)

  save: ->
    @storage.save()

  send: (message) ->
    @res.send @prefix + message

module.exports = Game
