window.app =
  ready: ->
    $('body').on('token', '.stripe-button', app.token_generated)
    $('body').on('click', 'a[data-finish-question-form]', app.clear_questions_answers)
    $('#q_header').hide()
    $('#finish_question').hide()

  token_generated: (e, token) ->
    e.preventDefault()
    $(this).siblings('form').append("<input type=hidden name=token value=#{token.id}>").submit()
    console.log(token)

  clear_questions_answers: (e) ->
    e.preventDefault()
    $('#answer_form').empty()
    $('#question_form').empty()
    $('#question_form_btn form').submit()
    $('#finish_question').toggle()

$(document).ready(app.ready)