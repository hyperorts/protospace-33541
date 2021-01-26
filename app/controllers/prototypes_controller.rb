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
    @prototype = Prototype.find(params[:id])
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
