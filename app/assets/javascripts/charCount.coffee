(($) =>
  $.fn.charCount = (options) ->
    defaults =
      allowed: 140,
      warning: 25,
      css: 'counter',
      counterElement: 'span',
      cssWarning: 'warning',
      cssExceeded: 'exceeded',
      counterText: ''

    options = $.extend(defaults, options)

    calculate = (obj) =>
      count = $(obj).val().length
      available = options.allowed - count
      if available <= options.warning and available >= 0
        $(obj).next().addClass(options.cssWarning)
      else
        $(obj).next().removeClass(options.cssWarning)
      if available < 0
        $(obj).next().addClass(options.cssExceeded)
      else
        $(obj).next().removeClass(options.cssExceeded)
      $(obj).next().html(options.counterText + available)

    this.each(->
      $(this).after("<#{options.counterElement} class=\"#{options.css}\">#{options.counterText}</#{options.counterElement}>")
      calculate(this)
      $(this).bind('keyup keydown change', ->
        calculate(this)
      )
    )
)(jQuery)

