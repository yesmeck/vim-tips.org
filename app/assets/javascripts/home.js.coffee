jQuery =>
  $('.tip').hover(
    ->
      $(this).find('.tip-link').show()
    ->
      $(this).find('.tip-link').hide()
  )
