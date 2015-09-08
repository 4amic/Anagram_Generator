module ApplicationHelper
    
  def words_form_action(word)
    if word.new_record?
      @action = "/dictionary"
    else
      @action = "/dictionary/#{word.id}"
    end
    @action
  end

  def words_form_method(word)
    if word.new_record?
      @method = "post"
    else
      @method = "put"
    end
  end

  def words_form_class(word)
    @class
  end

  def words_form_id(word)
    if word.new_record?
      @form_id = "new-word"
    else
      @form_id = "edit-word"
    end
    @form_id
  end
end 

