get '/words' do
    @words = Word.all.order(:text)
    erb :"/words/index"
end