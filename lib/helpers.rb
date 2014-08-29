# module Helpers

def partial(partial_name)
  path = File.expand_path "../../", __FILE__
  view = File.read "#{path}/haml/_#{partial_name}.haml"

  engine = Haml::Engine.new view
  haml_concat engine.render
end




########
# ok, next time

# # parser test
# #  [this] becomes a link (button style)
# #  plain text become paragraphized
# #  !image!
# #
# # then use textile for the rest

# def filter(&block)
#   button_link block.call
# end

# def button_link(string)
#   string.gsub(/\[\w+\]/, "<a href='\\1'>\\1</a>")
# end

# # end