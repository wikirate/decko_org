decko.slot.ready (slot) ->
  slot.find('#decko-animated-logo').each (i) ->
    logo = decko.logo
    logo.createlogoCards()
    logo.animateSequence()

toggleSidebarOnResize = ($el) ->
  $(window).resize ->
    toggleSidebar $el

toggleSidebar = ($el) ->
  if $(document).width() < 768
    $el.collapse 'hide'
  else
    $el.collapse 'show'

decko.slot.ready (slot) ->
  toggleSidebar $('#_deckoSidebar')
  toggleSidebarOnResize $('#_deckoSidebar')
