# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

timeInterval = 60000/200
count = 0
word = 0
looping = 0
running = true
showBlank = false

setTimeInterval = (interval) ->
  timeInterval = interval

incrementCount = ->
  if(count < word.length - 1 )
    count++
  else
    count = 0

decrementCount = ->
  if(count != 0)
    count--
  else
    count = word.length - 1

start = -> 
  looping = setInterval () ->
    if showBlank  
      #$('#contents').html(' ')
    else
      $('#contents').html(word[count])
    if showBlank #reset blank 
      showBlank = false
      incrementCount()
    else
      lastCharIndex = word[count].length - 1
      if word[count].charAt(lastCharIndex) == '.' or word[count].charAt(lastCharIndex) == ','
        showBlank = true
      else
        incrementCount()
  , timeInterval
  running = true

pause =->
  clearInterval(looping)
  running = false

init = ->
  word = $('#contents').data('words')
  start() if word?

@test = ->
  poop = 1

@changeWPM = ->
  wpm = $('#WPM').val()
  pause()
  timeInterval = 60000/wpm
  start()

@readerBack = ->
  decrementCount()
  $('#contents').html(word[count])

@readerNext = ->
  incrementCount()
  $('#contents').html(word[count])

@readerPausePlay = ->
  if running
    pause()
    $('#readerPauseButton').html('Start')
  else
    start()
    $('#readerPauseButton').html('Pause')

$(document).ready(init)

