Utils = require './utils'
_ = require 'underscore'
Creature = require './creature'

class Game
  prefix: '☠ '

  constructor: (@robot, @storage, @res=undefined) ->
    #console.log 'Game initiated'

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
    damage = _.random(1, 5)

    @creature.strike(damage, @hero_name)

    @send "#{@hero_name} strikes #{@creature.name} dealing #{@creature.damage} damage to his #{@creature.hitpoints} remaining hitpoints!"
    if @creature.is_dead
      @announce_creature_death()
      for hero, loot of @creature.get_loot()
        @level_up_hero(hero, loot)
      @new_creature()
      @announce_creature()
    else
      @send 'He lived! You must strike again!'
    @save()

  level_up_hero: (hero_name, allLoot) ->
    hero = @get_hero(hero_name)

    hero.xp += allLoot.xp || 0
    for loot in allLoot.loot
      hero.loot[loot] ||= 0
      hero.loot[loot]++

    if allLoot.loot
      loot_str = Utils.join_and(allLoot.loot)
      loot_announce = "#{hero_name} received the following: #{loot_str}"
    else
      loot_announce = ''

    @send "#{loot_announce}"


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

  reset: ->
    @storage.reset_storage()

  save: ->
    @storage.save()

  send: (message) ->
    @res.send @prefix + message

module.exports = Game
