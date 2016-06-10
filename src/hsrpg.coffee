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

Game = require './game'
Store = require './datastore'

module.exports = (robot) ->

  Store = new DataStore(robot)
  Game = new Game(robot, storage)

  robot.hear /^!fight/, (res) ->
    res.send 'You are fighting!'    
