# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ($) ->
  $.localScroll.defaults.axis = 'y'
  ###*
  # NOTE: I use $.localScroll instead of $('#navigation').localScroll() so I
  # also affect the >> and << links. I want every link in the page to scroll.
  ###
  $('#sidebar ul li').click ->
    $('#sidebar ul li.active').removeClass('active');
    $this = $(this)
    if !$this.hasClass('active')
      $this.addClass 'active'
  $('#sidebar').localScroll()
    target: '#content'
    queue: true
    duration: 1000
    hash: true
    onBefore: (e, anchor, $target) ->
      # The 'this' is the settings object, can be modified
      return
    onAfter: (anchor, settings) ->
      # The 'this' contains the scrolled element (#content)
      return
  return

jQuery ($) ->
  options = $AutoPlay: true
  jssor_slider1 = new $JssorSlider$('slider1_container', options)
  return




$(window).scroll ->
#  is_touch_device = ->
#    'ontouchstart' of window or 'onmsgesturechange' of window
#    return
  if !is_touch_device()
    if $(window).scrollTop() > $(window).height()
      $('#sidebar').css 'position', 'fixed'
      $('#sidebar').css 'top', '0'
      $('#sidebar').css 'left', '0'
      $('#main-part').css 'padding-left', '300px'
    else
      $('#sidebar').css 'position', 'relative'
      $('#main-part').css 'padding-left', '0'

    if $(window).scrollTop() > $(window).height() * 0.9
      $('#sidebar').addClass('sidebar-main')
      $('#sidebar').removeClass('sidebar-second')
    if $(window).scrollTop() > $(window).height() * 1.9
      $('#sidebar').removeClass('sidebar-main')
      $('#sidebar').removeClass('sidebar-third')
      $('#sidebar').addClass('sidebar-second')
    if $(window).scrollTop() > $(window).height() * 2.9
      $('#sidebar').removeClass('sidebar-second')
      $('#sidebar').removeClass('sidebar-fourth')
      $('#sidebar').addClass('sidebar-third')
    if $(window).scrollTop() > $(window).height() * 3.9
      $('#sidebar').removeClass('sidebar-third')
      $('#sidebar').addClass('sidebar-fourth')


