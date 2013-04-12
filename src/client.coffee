runCmd = (cmd) ->
  req = $.get '/player/' + cmd
  req.success -> console.log cmd + " was called"
  req.error   -> console.error "could not run " + cmd

$(document).ready ->

  $("#pause").click -> runCmd 'pause'
  $("#stop" ).click -> runCmd 'stop'
  $("#next" ).click -> runCmd 'next'
  $("#prev" ).click -> runCmd 'prev'

  req = $.getJSON '/clients/*'
  req.success (clients) ->
    ul = $("#clients")
    for c in clients
      ul.append "<li>#{c.host}:#{c.port}</li>"
