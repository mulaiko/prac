class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:text)
    end
end