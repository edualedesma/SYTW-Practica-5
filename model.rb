require 'restclient'
require 'xmlsimple'

class ShortenedUrl
  include DataMapper::Resource

  property :id, Serial
  property :url, Text
  property :myurl, String
  property :username, Text
  
  has n, :visits
end


