# Make unique transitioner divs.
counter = () ->
  count = 0
  return () -> count++

uniqueIdMaker = counter()

Template.animate.created = ->
  @id = uniqueIdMaker()
  @animation = {
    in: @data?.in
    out: @data?.out
  }

Template.animate.helpers
  id: () -> Template.instance().id

Template.animate.rendered = ->
  t = @
  @find("#animate-"+@id)?._uihooks =
    insertElement: (node, next) ->
      animation = t.animation
      if _.isFunction animation?.in 
        animation.in.apply this, [node, next]
      else if _.isString animation?.in
        $(node).insertBefore(next)
          .velocity animation.in
      else if _.isArray animation?.in
        $node = $(node)
        $node.insertBefore(next)
          .velocity.apply($node, animation.in)
      else
        $(node).insertBefore(next)

    removeElement: (node) ->
      animation = t.animation
      if _.isFunction animation?.out 
        animation.out.apply this, [node]
      else if _.isString animation?.out
        $node = $(node)
        $node.velocity animation.out, 
          complete: -> $node.remove()
      else if _.isArray animation?.out
        $node = $(node)
        $node.velocity.apply($node, animation.out)
          .velocity {opacity: 0}, 
            duration:0
            queue: true
            complete: -> $node.remove()
      else
        $(node).remove()