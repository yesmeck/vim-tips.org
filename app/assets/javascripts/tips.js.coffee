jQuery =>
  $('.tip').hover(
    ->
      $(this).find('.tip-link').show()
    ->
      $(this).find('.tip-link').hide()
  )
  $('#tip_content').charCount(
    counterElement: 'div'
  )
  $('a').tooltip()
