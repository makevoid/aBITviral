# from github.com/zedshaw/jzed

http = (settings) ->
  req = new XMLHttpRequest()
  req.withCredentials = settings.credentials
  req.onload = ->
    if req.readyState == 4
      if req.status == 200
        settings.success req
      else
        settings.error req
    return

  req.open settings.method, settings.url, true
  req.send()
  return

json = (string) ->
  JSON.parse string

# http (settings) = ->
#   req = new XMLHttpRequest();
#   req.onload = settings.success(req);
#   req.open settings.method, settings.url, true
#   req.send()
#   true