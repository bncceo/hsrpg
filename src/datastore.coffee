Creature = require './creature'

class DataStore
  constructor: (@robot) ->
    console.log 'Initializing Datastore'
    # @load_storage()
    @robot.brain.on 'loaded', @load_storage
    @db = { }

  load_storage: =>
    console.info 'Loading data for datastore'
    @db = @robot.brain.data.hsrpg ||= {
      heroes: {}
      creature: new Creature(1, 1)
    }

  Object.defineProperties @prototype,
    heroes:
      get: -> @db.heroes
    creature:
      get: -> @db.creature
      set: (c) -> @db.creature = c; @save()

  reset_storage: ->
    @robot.logger.info 'Resetting storage'
    @robot.brain.data.hsrpg = undefined
    @save()
    @robot.logger.info 'Reloading storage with new data'
    @load_storage()
    @save()

  save: ->
    @robot.brain.save()

module.exports = DataStore
