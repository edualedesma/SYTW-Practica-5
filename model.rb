require 'restclient'
require 'xmlsimple'

class Shortenedurl
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
 # property  :country,     String
  
  belongs_to  :shortenedurl

  #after :create, :set_country

  def set_country
    xml = RestClient.get "http://ip-api.com/xml/#{self.ip}"  
    pais = XmlSimple.xml_in(xml.to_s, { 'ForceArray' => false })['country'].to_s
    if (!pais) 
      pais = "No encontrada"
    end
    self.country = pais
    self.save
  end

                                   
end