class RateGraphCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    
  end

  def destroy
  end
  
  private
  
  def rate_graph_comment_params
    params.require(:rate_graph_comment).permit(:comment)
  end
end
