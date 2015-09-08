get '/dictionary' do
    @words = Word.all.paginate(page: params[:page]).order(:text)
    erb :"/dictionary/index"
end

post '/dictionary' do
  word = Word.create(text: params[:text])
  redirect "/dictionary/#{word.id}"
end

get '/dictionary/new' do
  @word = Word.new
  erb :"/dictionary/new"
end

get '/dictionary/:id/edit' do
  @word = Word.find_by_id(params[:id])
  erb :"/dictionary/edit"
end

delete '/dictionary/:id' do
  word = Word.find_by_id(params[:id])
  word.destroy
  redirect "/dictionary"
end

put '/dictionary/:id' do
  @word = Word.find_by_id(params[:id])
  @word.text = "#{params[:text]}"
  @word.save
  erb :"/dictionary/show"
end

get '/dictionary/:id' do
  @word = Word.find_by(id: params[:id])
  erb :"/dictionary/show"
end