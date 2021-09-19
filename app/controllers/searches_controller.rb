class SearchesController < ApplicationController
  before_action :authenticate_user!


  def seach
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'user'
      @records = User.search_for(@content, @method)
    end
  end
end
