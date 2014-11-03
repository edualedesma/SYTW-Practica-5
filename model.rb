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

  end

                                   
end