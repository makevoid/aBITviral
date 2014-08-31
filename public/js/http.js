var http, json;

http = function(settings) {
  var req;
  req = new XMLHttpRequest();
  req.withCredentials = settings.credentials;
  req.onload = function() {
    if (req.readyState === 4) {
      if (req.status === 200) {
        settings.success(req);
      } else {
        settings.error(req);
      }
    }
  };
  req.open(settings.method, settings.url, true);
  req.send();
};

json = function(string) {
  return JSON.parse(string);
};
