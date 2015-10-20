class Item < ActiveRecord::Base
  belongs_to :categories

  def self.create_with_category(attrs)
    create(
      name: attrs.fetch(:name),
      category_id: Category.find_or_create_by(name: attrs.fetch(:category, "")).id
    )
  end

  def self.all_grouped_by_category(category_name)
    where(category_id: Category.find_by_name(category_name).id)
  end
end
