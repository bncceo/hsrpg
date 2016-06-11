# Description
#   An attempt to create a PvP & PvE game with RPG elements for HuBot
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot hello - <what the respond trigger does>
#   orly - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   bncceo

RpgGame = require './game'
DataStore = require './datastore'
Creature = require './creature'

module.exports = (robot) ->

  store = new DataStore(robot)
  game = new RpgGame(robot, store)
  creature = new Creature(5)

  random = (upper, lower = 0) ->
    return Math.floor(Math.random() * (upper - lower + 1) + lower)

  robot.hear /^!fightmonster/i, (res) ->
    if creature.is_dead()
      creature = new Creature(creature.hp() + random(creature.hp()))
      res.send 'A new enemy approaches: ' + creature.get_name() + ' of strength ' + creature.hp()
    herostrike = random(creature.hp())
    creature.strike(herostrike)
    res.send 'You struck ' + creature.get_name() + ' of strength ' + creature.hp() + ' and did ' + herostrike + ' damage.'
    if !creature.is_dead()
      res.send 'He lived! You must strike again!'
    else
      res.send 'Congratulations warrior, you have defeated the enemy and won one coin!'

  robot.hear /^!fight (.*)/i, (res) ->
    res.send 'Trying to fight ' + res.match[1].toLowerCase().trim()
