require_relative "../../../app/dinner_dash/items/presenters/list_of_item"

describe Items::Presenters::ListOfItem do
  subject(:list_of_item) { described_class.new(items) }
  describe "#message" do
    context "when there are no items in the list" do
      let(:items) { [] }
      it "returns a proper message" do
        expect(list_of_item.message).to eql "There are no items created"
      end
    end
  end

  describe "#each" do
    context "when items exist" do
      let(:items) { [double(:item)] }
      let(:block) { Proc.new {} }

      pending "calls the block 1 time" do
        expect(block).to receive(:call).once

        list_of_item.each block
      end
    end
  end
end
