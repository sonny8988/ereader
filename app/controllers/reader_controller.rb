class ReaderController < ApplicationController
  def index
    @reader = Reader.new(reader_params[:content])
  end
    private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def reader_params
      params.require(:reader).permit(:content)
    end
end
