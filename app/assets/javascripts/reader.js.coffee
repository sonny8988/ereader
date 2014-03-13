# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

timeInterval = 150
count = 0

start = (word) ->
  setInterval () ->
    $('#contents').html(word[count])
    count++
    if(count >= word.length)
      count = 0
  , 1000

pause =->
  clearInterval(start())


init = ->
  words = $('#contents').data('words')
  start(words) if words?

$(document).ready(init)

