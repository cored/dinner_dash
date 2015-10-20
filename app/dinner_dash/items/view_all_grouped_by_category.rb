module Items
  class ViewAllGroupedByCategory
    def initialize(item_repository:)
      @item_repository = item_repository
    end

    def call(category_name)
      Presenters::ListOfItem.new(
        item_repository.all_grouped_by_category(category_name)
      )
    end

    private

    attr_reader :item_repository
  end
end
