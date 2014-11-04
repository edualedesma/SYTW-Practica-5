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


class Visit
  include DataMapper::Resource

  property  :id,          Serial
  property  :created_at,  DateTime
  property  :ip,          IPAddress
  property  :country,     String
  belongs_to  :link

  after :create, :set_country

  def set_country
    xml = RestClient.get "http://ip-api.com/xml/#{self.ip}"  
    pais = XmlSimple.xml_in(xml.to_s, { 'ForceArray' => false })['country'].to_s
    if !pais 
      pais = "No encontrada"
    self.country = pais
    self.save
  end

                                   
end