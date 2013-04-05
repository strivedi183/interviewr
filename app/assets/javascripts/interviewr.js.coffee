window.app =
  ready: ->
    $('body').on('token', '.stripe-button', app.token_generated)

  token_generated: (e, token) ->
    e.preventDefault()
    $(this).siblings('form').append("<input type=hidden name=token value=#{token.id}>").submit()
    console.log(token)

$(document).ready(app.ready)