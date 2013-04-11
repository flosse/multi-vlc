###
Copyright (c) 2013 Markus Kohlhase <mail@markus-kohlhase.de>
###

express = require 'express'
app     = express()
{exec}  = require 'child_process'
fs      = require 'fs'

vlcInstances = require '../clients.js'
REQUEST_URL   = '/requests/status.xml?command='

app.use '/', express.static __dirname + './../public'

runCmd = (cmd) ->
  for i in vlcInstances then do (i) ->
    # NOTE: using http.get doesn't work reliably (bug in node.js?)
    exec "curl #{i.host}:#{i.port}#{REQUEST_URL}#{cmd}", (err) ->
      console.error err if err?

app.get '/pause', (req,res) ->
  runCmd 'pl_pause'
  res.end()

app.get '/stop', (req,res) ->
  runCmd 'pl_stop'
  res.end()

app.get '/next', (req,res) ->
  runCmd 'pl_next'
  res.end()

app.get '/prev', (req,res) ->
  runCmd 'pl_previous'
  res.end()

app.listen 3000
