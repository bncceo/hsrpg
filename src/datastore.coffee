class DataStore
  constructor: (@robot) ->
    console.log 'Initializing Datastore'
    @robot.brain.on 'loaded', @load_storage
    @db = {}

  load_storage: =>
    now = Date.now()
    @db = @robot.brain.data.hsrpg ||= {
      heroes: {}
      creature: new Creature(6, 7)
    }

  Object.defineProperties @prototype,
    heroes:
      get: -> @db.heroes
    creature:
      get: -> @db.creature
      set: (c) -> @db.creature = c; @save()

  save: ->
    console.log 'Saving brain state.'
    @robot.brain.save()

module.exports = DataStore
