get '/words' do
  @words = Word.all
  erb :"/words/index"
end

post '/words' do
  word = Word.create(text: params[:text])
  redirect "/words/#{word.id}"
end

get '/words/new' do
  @word = Word.new
  erb :"/words/new"
end

get '/words/:id/edit' do
  @word = Word.find_by_id(params[:id])

  erb :"/words/edit"
end

delete '/words/:id' do
  word = Word.find_by_id(params[:id])
  word.destroy

  redirect "/words"
end

put '/words/:id' do
  @word = Word.find_by_id(params[:id])
  @word.text = "#{params[:text]}"
  @word.save

  erb :"/words/show"
end

get '/words/:id' do
  @word = Word.find_by(id: params[:id])
  erb :"/words/show"
end