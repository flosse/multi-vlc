runCmd = (cmd) ->
  req = $.get '/' + cmd
  req.success -> console.log cmd + " was called"
  req.error   -> console.error "could not run " + cmd

$(document).ready ->

  $("#pause").click -> runCmd 'pause'
  $("#stop" ).click -> runCmd 'stop'
  $("#next" ).click -> runCmd 'next'
  $("#prev" ).click -> runCmd 'prev'
