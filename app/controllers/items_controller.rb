class ItemsController < ApplicationController
  def index
  end

  def new
    @item=Item.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end


  private

  def 

end
def item_params
  params.require(:item).permit(:, :image).merge(user_id: current_user.id)
end
