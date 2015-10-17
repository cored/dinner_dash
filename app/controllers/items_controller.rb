class ItemsController < ApplicationController
  def index
    @list_of_item = Items::ViewAll.new(item_repository: Item).call
  end
end
