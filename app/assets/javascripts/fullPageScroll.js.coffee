jQuery ($) ->
  # set to true to see the console.log debug info
  debug = false
  # setup default index of 0
  index = 0
  # setup scrolling flag
  scrolling = false
  # cache a few elements for reference
  win = $(window)
  body = $('body')
  container = $('#fullPageScroll')
  # setup a few more variables for future use
  lastTop = 0
  current = undefined
  offset = undefined
  # bind scroll event
  isTouchDevice = 'ontouchstart' in document.documentElement;

  updateActive = ->
    # get the current top offset
    top = win.scrollTop()
    # determine which direction we are scrolling
    if top > lastTop
      # down
      if debug
        console.log 'scrolling down'
      # let make sure we aren't on the last element
      if debug
        console.log index, $('.section').length
      if index == $('.section').length - 1
        if debug
          console.log 'on last element, nothing to do'
        return
      # update index & top
      if debug
        console.log index, 'index before'
      index++
      if debug
        console.log index, 'index after'
      lastTop = top
    else
      # up
      if debug
        console.log 'scrolling up'
      # let make sure we aren't on the first element
      if !index
        if debug
          console.log 'on first element, nothing to do'
        return
      # update index & top
      if debug
        console.log index, 'index before'
      index--
      if debug
        console.log index, 'index after'
      lastTop = top
    return

  is_touch_device = ->
    'ontouchstart' of window or 'onmsgesturechange' of window

  $('#sidebar').on 'click', 'ul li', (ev) ->
    ev.preventDefault()
    href = $(this).find('a').attr("data-href")
#    console.log('href ' + href)
    index = ++href
#    console.log('new index ' + index)
    $("#sidebar ul li a").trigger( "scroll" )
    $('#sidebar ul>li').blur()

#  win.on 'touchstart', (ev) ->
##    ev.preventDefault()
#  win.on 'touchmove', (ev) ->
#    ev.preventDefault()
#  win.on 'touchend', (ev) ->
##    ev.preventDefault()
#
#  win.on 'swipeup', (e,data) ->
##    e.preventDefault()
#
#  win.on 'swipedown', (e,data) ->
##    e.preventDefault()
#    # update a few variables for the next interaction

  if !is_touch_device()
    win.on 'scroll', (ev) ->
      # prevent the default event
      ev.preventDefault()
      # check to make sure we don't fire the scroll multiple times
      if debug
        console.log scrolling, 'scrolling'
      if scrolling
        return
      # set the scrolling flag to true
      scrolling = true
      # run the update function
      updateActive()
      # clear the scrolling flag to allow the user to access the next element
      setTimeout (->
        scrolling = false
        return
      ), 500
      # update a few variables for the next interaction
      current = container.find('.section[data-index=' + index + ']')
      offset = current.offset()
      lastTop = offset.top

      # changing active tab in sidebar
  #    $('#sidebar ul li.active').removeClass('active')
  #    console.log($('#sidebar>ul>li.active'))
      $('#sidebar ul>li.active').removeClass('active')

      $('#sidebar ul li:nth-child('+index+')').addClass 'active'
      $('#top-part').trigger( 'click' )
  #    $("#sidebar ul li").get(index-1).addClass 'active'

      # handle the animation
      body.animate scrollTop: offset.top + 'px'
      return