require 'sinatra'
require 'notifo'
require 'yaml'

configure do
  config = YAML::load_file('config.yml')
  @notifo = Notifo.new(config[username], config[password]);
end

get '/' do
  "This is a notifo bot that reports the weather. Simply message your zip code to 'weather'!"
end

post '/fetch' do
  if notifo.verify_webhook_signature(params)
    notifo.post(params[:notifo_from_username], 'Hello, World!')
  end
end
