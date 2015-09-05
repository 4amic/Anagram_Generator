require 'sinatra'

def three_letters(input)
  if input.length > 3
    raise Exception.new("Word must be less than or equal to 3 characters.")
  end
end

def distinct_letters(input)
  letter_array = input.chars
  unique_letters = letter_array.uniq
  if unique_letters.length < letter_array.length
    raise Exception.new("Word must have distinct letters please!")
  end
end

def valid_input(input)
  three_letters(input)
  distinct_letters(input)
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
  @anagrams = Word.find_anagrams(@word)
  erb :show
end