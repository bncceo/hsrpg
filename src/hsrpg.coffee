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

  robot.hear /^!fightmonster/i, (res) ->
    creature = new Creature(5)
    res.send 'You are fighting ' + creature.get_name()

  robot.hear /^!fight (.*)/i, (res) ->
    res.send 'Trying to fight ' + res.match[1].toLowerCase().trim()
