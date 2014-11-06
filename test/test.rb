ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require 'test/unit'
require_relative '../app.rb'
require_relative '../model.rb'

include Test::Unit::Assertions


include Rack::Test::Methods

def app
  Sinatra::Application
end



describe 'Tests de clase visita' do
  before :all do
    
    @id = '2'
    @ip = "127.0.0.1"
    @Objeto = Visit.new(:id => "1", :ip => "127.0.0.1")
  
  end
     

end



describe 'Tests de app.rb' do
  before :all do
    @Pagina = "http://www.diariodeavisos.com"
    @Pagina2 = "http://www.eldia.es"
    @ShortPagina = "periodidco"
    @Objeto = Shortenedurl.first_or_create(:url => "http://www.diariodeavisos.com", :myurl =>'periodico', :username => 'Edu')
    @ObjetoDist = Shortenedurl.first(:username=> 'Juan')

   end   
         
  it "Debe devolver diario de avisos está en la base de datos" do
    assert @Pagina, @Objeto.url 
  end

  it "Debe devolver que el username es igual" do
    assert 'Edu', @Objeto.username
  end    

  it "Debe devolver que no coincide el username de objeto con Pedro" do
    assert_not_same('Pedro', @Objeto.username)
  end

  it "Debe devolver que no coincide el username de objeto con el username de objeto distinto" do
    assert_not_same(@Pagina2, @Objeto.url)
  end

  it "Comprobar que va a la index" do
    get '/'
    assert last_response.ok?
  end


  it "Comprobar texto correcto" do
    get '/'
    assert_match 'Acortar', last_response.body
  end
    
    
end
