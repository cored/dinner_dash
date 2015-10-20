module Categories
  class AddNew
    def initialize(category_repository:)
      @category_repository = category_repository
    end

    def call(category_attrs)
      category_repository.create(category_attrs)
    end

    private

    attr_reader :category_repository
  end
end
