get '/calculator' do
  erb :'calculator', layout: :application
end

post '/calculator/calculate' do
  fontmate_text = Metrics::Text.new(params)
  @lines = fontmate_text.measure_lines
  @words = fontmate_text.measure_long_words

  erb :'calculator', layout: :application
end

get '/' do
  redirect '/calculator'
end
