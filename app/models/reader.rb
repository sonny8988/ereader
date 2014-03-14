class Reader 
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :content, :wpm

  def initialize(content)
    @content = content
  end

  def array_of_words
    array = @content.split(' ')
    return array
  end
end

