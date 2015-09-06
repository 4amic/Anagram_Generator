get '/words' do
    @words = Word.all.order(:text)
    erb :"/words/index"
end

get '/words/new' do
	@word = Word.new
	erb :"/words/new"
end

get '/words/:id' do
	@word = Word.find(params[:id])
	#@anagrams = Word.find_anagrams(@word.text)
	erb :"/words/show"
end