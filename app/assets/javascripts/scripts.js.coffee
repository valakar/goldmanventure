
ready = ->
#  is_touch_device = ->
#    'ontouchstart' of window or 'onmsgesturechange' of window
#    return
  win = $(window)
  logo = $('#top-part .logo')
  logo-first = $('#top-part .logo div:first-child')
  logo-last = $('#top-part .logo div:last-child')
  logo-fix = $('#top-part .logo-left-fix')
  if is_touch_device()
    $('#sidebar').hide()
    $('.touch-only').show()
    $('#main-part').css 'padding-left', '0'
    $('#second-part').css 'padding-left', '0'
    $('#third-part').css 'padding-left', '0'
    $('#fourth-part').css 'padding-left', '0'
    $('.row-offcanvas').css 'height', 'auto'

#    $('body').css 'font-size', '200%'
    $('#third-part .images').css 'position', 'relative'
    $('#main-part article').css 'padding', '2em 1em'
    $('#main-part .navbar-touch li:nth-child(1)').addClass('active')
    $('#second-part .navbar-touch li:nth-child(2)').addClass('active')
    $('#third-part .navbar-touch li:nth-child(3)').addClass('active')
    $('#fourth-part .navbar-touch li:nth-child(4)').addClass('active')

    if win.width() <= 1280  && win.width() > 768
      logo.css 'line-height', '4em'
      logo-first.css 'font-size', '5em'
      logo-last.css 'font-size', '5em'
    if win.width() <= 768 && win.width() > 720
      logo-fix.css 'width', '10%'
      logo.css 'line-height', '6em'
      logo-first.css 'font-size', '7em'
      logo-last.css 'font-size', '7em'
    if win.width() <= 720 && win.width()
      logo-fix.css 'width', '1%'
      logo.css 'line-height', '6em'
      logo-first.css 'font-size', '7em'
      logo-last.css 'font-size', '7em'

    $('.navbar-toggle').on 'click', ->
      $target = $(this).parent().next()
      if $target.data('bs.collapse') then $target.collapse('toggle') else $target.collapse()
      return
  return

$(window).on 'load', ready