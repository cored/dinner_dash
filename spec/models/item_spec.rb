require "rails_helper"

describe Item do
  describe "#create_with_category" do
    context "with attributes that include a category name" do
      it "creates a new item associated to that category" do
        category = FactoryGirl.create(:category)
        attrs = {name: "Item 1", category: category.name}

        expect {
          Item.create_with_category(attrs)
        }.to change { category.items.count }.by 1
      end
    end

    context "with missing category" do
      it "creates an item without category" do
        attrs = {name: "Item 1"}

        expect {
          Item.create_with_category(attrs)
        }.to change(Item, :count).by 1
      end
    end
  end

  describe ".all_grouped_by_category" do
    it "retrieves all the items grouped by a given category" do
      category_1 = FactoryGirl.create(:category)
      category_2 = FactoryGirl.create(:category)

      item_1 = FactoryGirl.create(:item, category_id: category_1.id)
      item_2 = FactoryGirl.create(:item, category_id: category_1.id)
      item_3 = FactoryGirl.create(:item, category_id: category_2.id)

      items = [item_1, item_2, item_3]

      expect(
        Item.all_grouped_by_category(category_1.name)
      ).to match_array items.select { |item| item.category_id == category_1.id }
    end
  end
end
