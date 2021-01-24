class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new #Tweet.new(新規オブジェクト)のnewあとで要確認
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save #←のsaveは、単にdbへ保存する動き、createはnewからsaveまでrailsの仕組みによって最適化してくれている
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
