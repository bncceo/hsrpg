class Storage
  constructor: (@robot) ->
    @robot.brain.on 'loaded', @load_storage
    @db = {}

  load_storage: =>
    now = Date.now()
    @db = @robot.brain.data.hsrpg ||= {

    }
