jQuery =>
  $('#tip_content').charCount(
    counterElement: 'div'
  )

  $('a').tooltip()

  $('.tip').hover(
    ->
      $(this).find('.tip-link').show()
    ->
      $(this).find('.tip-link').hide()
  )


