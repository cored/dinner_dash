module Items
  class AddNew
    def initialize(item_repository:)
      @item_repository = item_repository
    end

    def call(item_attrs)
      item_repository.create(item_attrs)
    end

    private

    attr_reader :item_repository
  end
end
