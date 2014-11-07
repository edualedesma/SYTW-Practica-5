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
  property  :country,     String
  
  belongs_to  :shortenedurl


  before :create, :set_country

  def set_country
    xml = RestClient.get "http://ip-api.com/xml/#{self.ip}"  
    pais = XmlSimple.xml_in(xml.to_s, { 'ForceArray' => false })['country'].to_s
    p "Este es el pais: "
    p pais
    if (pais == "") 
      pais = "No encontrada"
    end
    self.country = pais
    self.save
  end

  def self.fecha_por_dias(id)
    repository(:default).adapter.select("SELECT date(created_at) AS date, count(*) AS count FROM visits WHERE shortenedurl_id = '#{id}' GROUP BY date(created_at)")
  end

  def self.pais_contador(id)
    repository(:default).adapter.select("SELECT country, count(*) AS count FROM visits WHERE shortenedurl_id = '#{id}' GROUP BY country")
  end  
                                   
end