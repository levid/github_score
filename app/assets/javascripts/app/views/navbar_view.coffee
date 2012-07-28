GithubScore.NavbarView = Ember.View.extend JQ.Animate,
  templateName: "app/templates/navbar"
  cssProperties: ["height"]
  closedHeight: 100
  openedHeight: 300

  init: ->
    $('.logo').live "mouseover", (e) =>
      @mouseover()

    $('.logo').live "mouseout", (e) =>
      @mouseout()

  mouseover: ->
    console.log "mouseover"
    openedHeight = @get("openedHeight")
    @set "height", openedHeight

  mouseout: ->
    console.log "mouseout"
    closedHeight = @get("closedHeight")
    @set "height", closedHeight