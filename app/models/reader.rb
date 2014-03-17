class Reader 
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :content, :wpm

  def initialize(content)
    @content = content
  end

  def array_of_words_raw
    array = @content.split(' ')
    return array
  end

  def array_of_words
    array = array_of_words_raw
    array.each_with_index do |word,i|
      if word.length < 3
        array[i] = " " + word
      end
    end
    return array
  end
end

