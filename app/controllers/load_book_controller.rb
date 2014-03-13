class LoadBookController < ApplicationController
  def index
  end
  
  def new
    @reader = Reader.new('')
  end
end


