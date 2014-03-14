# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

timeInterval = 60000/200
count = 0
word = 0
looping = 0

setTimeInterval = (interval) ->
  timeInterval = interval

start = -> 
  looping = setInterval () ->
    $('#contents').html(word[count])
    count++
    if(count >= word.length)
      count = 0
  , timeInterval

pause =->
  clearInterval(looping)


init = ->
  word = $('#contents').data('words')
  start() if word?

@changeWPM = ->
  wpm = $('#WPM').val()
  pause()
  timeInterval = 60000/wpm
  start()

$(document).ready(init)

