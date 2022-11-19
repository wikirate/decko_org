decko.slotReady (slot) ->
  slot.find('#decko-animated-logo').each (i) ->
    logo = new deckoLogo
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

decko.slotReady (slot) ->
  toggleSidebar $('#_deckoSidebar')
  toggleSidebarOnResize $('#_deckoSidebar')
