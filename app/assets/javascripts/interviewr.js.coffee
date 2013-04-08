window.app =
  ready: ->
    $('body').on('token', '.stripe-button', app.token_generated)
    $('body').on('click', 'a[data-finish-question-form]', app.clear_questions_answers)
    $('body').on('keyup', '#search', app.filter_products)
    $('#q_header').hide()
    $('#finish_question').hide()
    $('#finish_quiz.btn').on('click', app.end_timer)


  start_timer: ->
    app.start = new Date
    app.timer = setInterval(app.update_timer, 1000)

  end_timer: ->
    console.log(app.time)
    clearInterval(app.timer)

  update_timer: ->
    app.time = $('#time').text((new Date - app.start) / 1000 + " Seconds")
    # $('#time').text(time)

  filter_products: (e) ->
    query = $('#search').val()
    settings =
      dataType: 'script'
      type: 'get'
      url: "/quizzes/search?query=#{query}"
    $.ajax(settings)

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