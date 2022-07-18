require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new(:name => "Vegetables")
    end
    it "Saves a new product if name, price, quantity, and category fields are set" do
      @product = Product.new(:name => "Cabbage", :price_cents => 199, :quantity => 10, :category => @category)
      expect(@product).to be_valid
    end
    it "Does not save a new product if the name field is not set" do
      @product = Product.new(:name => nil, :price_cents => 199, :quantity => 10, :category => @category)
      expect(@product).to_not be_valid
    end
    it "Does not save a new product if the price field is not set" do
      @product = Product.new(:name => "Cabbage", :price_cents => nil, :quantity => 10, :category => @category)
      expect(@product).to_not be_valid
    end
    it "Does not save a new product if the quantity field is not set" do
      @product = Product.new(:name => "Cabbage", :price_cents => 199, :quantity => nil, :category => @category)
      expect(@product).to_not be_valid
    end
    it "Does not save a new product if the category field is not set" do
      @product = Product.new(:name => "Cabbage", :price_cents => 199, :quantity => 10, :category => nil)
      expect(@product).to_not be_valid
    end
  end
end
