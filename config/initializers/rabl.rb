require 'grape/rabl'

Rabl.configure do |config|
  config.include_json_root = false
  config.view_paths = [
    File.join(Padrino.root, "/api/templates"),
    File.join(Padrino.root, "/app/views")
  ]
end
