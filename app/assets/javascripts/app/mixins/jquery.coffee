JQ = JQ or {}

JQ.Animate = Ember.Mixin.create(
  cssProperties: [
    "background",
    "backgroundAttachment",
    "backgroundColor",
    "backgroundImage",
    "backgroundPosition",
    "backgroundRepeat",
    "border",
    "borderBottom",
    "borderBottomColor",
    "borderBottomStyle",
    "borderBottomWidth",
    "borderColor",
    "borderLeft",
    "borderLeftColor",
    "borderLeftStyle",
    "borderLeftWidth",
    "borderRight",
    "borderRightColor",
    "borderRightStyle",
    "borderRightWidth",
    "borderStyle",
    "borderTop",
    "borderTopColor",
    "borderTopStyle",
    "borderTopWidth",
    "borderWidth",
    "clear",
    "clip",
    "color",
    "cursor",
    "display",
    "filter",
    "font",
    "fontFamily",
    "fontSize",
    "fontVariant",
    "fontWeight",
    "height",
    "left",
    "letterSpacing",
    "lineHeight",
    "listStyle",
    "listStyleImage",
    "listStylePosition",
    "listStyleType",
    "margin",
    "marginBottom",
    "marginLeft",
    "marginRight",
    "marginTop",
    "overflow",
    "padding",
    "paddingBottom",
    "paddingLeft",
    "paddingRight",
    "paddingTop",
    "pageBreakAfter",
    "pageBreakBefore",
    "position",
    "styleFloat",
    "textAlign",
    "textDecoration",
    "textIndent",
    "textTransform",
    "top",
    "verticalAlign",
    "visibility",
    "width",
    "zIndex"
  ]

  elementIsInserted: false

  didInsertElement: ->
    @_super()
    @set "elementIsInserted", true
    @_gatherProperties()

  willDestroyElement: ->
    @_super()
    @set "elementIsInserted", false

    # Tear down any observers that were created
    observers = @_observers
    for prop of observers
      @removeObserver prop, observers[prop]  if observers.hasOwnProperty(prop)

  _gatherProperties: ->
    cssProperties = @get("cssProperties")

    # The view can specify a list of css properties that should be treated
    # as Ember properties.
    cssProperties.forEach ((key) ->

      # Set up an observer on the Ember property.
      # When it changes, call animate()
      observer = ->
        @animate()

      @addObserver key, observer

      # Insert the observer in a Hash so we can remove it later.
      @_observers = @_observers or {}
      @_observers[key] = observer
    ), this


  # Do the animation. Called whenever a css property changes.
  # You can define a beforeAnimate() function that will be called before the actual animation takes place
  # You can also define a afterAnimate() function that will be called just after the animation ends
  animate: ->
    cssProperties = @get("cssProperties")
    properties    = {}
    duration      = @get("duration") or 400
    easing        = @get("easing") or null
    self          = this

    # Ensure this view is inserted. If not, animate later.
    unless @get("elementIsInserted")
      return Ember.run.next(this, ->
        @animate()
      )

    # Gather css properties values
    cssProperties.forEach ((key) ->
      properties[key] = self.get(key)
    ), this

    # Before animation
    @beforeAnimate() if typeof @beforeAnimate is "function"

    # Animate
    @$().animate properties, duration, easing, ->
      self.afterAnimate() if typeof self.afterAnimate is "function"

)

window.JQ = JQ