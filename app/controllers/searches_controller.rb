class SearchesController < ApplicationController
  before_action :authenticate_user!


  def search
    @content = params[:content]
    @method = params[:method]
    @records = User.search_for(@content, @method).page(params[:page]).reverse_order
  end
end
