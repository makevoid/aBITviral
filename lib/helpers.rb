

def partial(partial_name)
  path = File.expand_path "../../", __FILE__
  view = File.read "#{path}/haml/_#{partial_name}.haml"

  engine = Haml::Engine.new view
  haml_concat engine.render
end