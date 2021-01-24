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