require 'sinatra'

def valid_input(input)
  if input.length < 2
      raise Exception.new("Word must be 2 or more characters long.")
  end
end


get '/' do
  erb :index
end

post '/' do
  @word = params[:word]
  begin
    valid_input(@word)
    redirect "/anagrams/#{@word}"
  rescue Exception => error
    @error = error.message
    erb :index
  end
end


get '/anagrams/:word' do
  @word = params[:word]
    word_array = @word.chars.sort
    alphabetized_string = word_array.join
    @anagrams = Word.where("letters=?", alphabetized_string)
    @anagrams.sort.uniq

  erb :show
end