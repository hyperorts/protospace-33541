class PrototypesController < ApplicationController
  def index
    # @prototypes = Prototype.all

  end

  def new
    @prototype = Prototype.new #Tweet.new(新規オブジェクト)のnewあとで要確認
  end

  def create
  end

end

private
def prototype_params
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
end
