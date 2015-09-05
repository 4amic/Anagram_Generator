get '/words' do
    @words = Word.all.order(:text)
    erb :"/words/index"
end

get '/words/:id' do
	@word = Word.find(params[:id])
	erb :"/words/show"
end