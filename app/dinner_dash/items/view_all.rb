module Items
  class ViewAll
    def initialize(item_repository:)
      @item_repository = item_repository
    end

    def call
      Presenters::ListOfItem.new(item_repository.all)
    end

    class ListOfItem
      NO_ITEMS_MSG = "There are no items created"

      def initialize(items)
        @items = items
      end

      def message
        NO_ITEMS_MSG if items.empty?
      end

      def to_a
        items.map do |item|
          Row.new(item)
        end
      end

      def each(&block)
        items.each(&block)
      end

      private

      class Row
        def initialize(item)
          @item = item
        end

        def to_h
          {
            name: item.name
          }
        end

        private

        attr_reader :item
      end

      attr_reader :items
    end

    attr_reader :item_repository
  end
end
