class Utils
  @join_and: (stringArray) ->
    outStr = ''
    sep_and = 'and '
    sep = ', '
    if stringArray.length == 1
      outStr = stringArray[0]
    else if stringArray.length == 2
      outStr = stringArray.join(" #{sep_and}")
    else if stringArray.length > 2
      outStr = stringArray.slice(0, -1).join(sep) + "#{sep} #{sep_and}" + stringArray.slice(-1)
    outStr

module.exports = Utils
