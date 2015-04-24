# Adapted from: http://api.rubyonrails.org/classes/ActionDispatch/TestProcess.html#method-i-fixture_file_upload
def fixture_file_upload(path, mime_type = nil, binary = false)
  path = File.join(fixture_path, path)
  Rack::Test::UploadedFile.new(path, mime_type, binary)
end

def fixture_path
  File.expand_path(File.dirname(__FILE__) + "/../fixtures")
end
