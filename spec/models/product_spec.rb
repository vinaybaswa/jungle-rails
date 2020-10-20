require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "validates presence of name" do
      categ = Category.new
      record = Product.new
      record.name = nil
      record.price = 5
      record.quantity = 5
      record.category = categ
      record.valid?
      expect(record.errors.full_messages).to include("Name can't be blank")
      expect(record.errors.full_messages).to_not include("Price is not a number")
      expect(record.errors.full_messages).to_not include("Quantity can't be blank")
      expect(record.errors.full_messages).to_not include("Category can't be blank")
    end
    it "validates presence of price" do
      categ = Category.new
      record = Product.new
      record.name = "string"
      record.price = nil
      record.quantity = 5
      record.category = categ
      record.valid?
      expect(record.errors.full_messages).to_not include("Name can't be blank")
      expect(record.errors.full_messages).to include("Price is not a number")
      expect(record.errors.full_messages).to_not include("Quantity can't be blank")
      expect(record.errors.full_messages).to_not include("Category can't be blank")
    end
    it "validates presence of quantity" do
      categ = Category.new
      record = Product.new
      record.name = "string"
      record.price = 5
      record.quantity = nil
      record.category = categ
      record.valid?
      expect(record.errors.full_messages).to_not include("Name can't be blank")
      expect(record.errors.full_messages).to_not include("Price is not a number")
      expect(record.errors.full_messages).to include("Quantity can't be blank")
      expect(record.errors.full_messages).to_not include("Category can't be blank")
    end
    it "validates presence of category" do
      categ = Category.new
      record = Product.new
      record.name = "string"
      record.price = 5
      record.quantity = 5
      record.category = nil
      record.valid?
      expect(record.errors.full_messages).to_not include("Name can't be blank")
      expect(record.errors.full_messages).to_not include("Price is not a number")
      expect(record.errors.full_messages).to_not include("Quantity can't be blank")
      expect(record.errors.full_messages).to include("Category can't be blank")
    end
    it "is valid with valid attributes" do
      categ = Category.new
      record = Product.new
      record.name = "string"
      record.price = 5
      record.quantity = 5
      record.category = categ
      record.valid?
      expect(record.errors.full_messages).to_not include("Name can't be blank")
      expect(record.errors.full_messages).to_not include("Price is not a number")
      expect(record.errors.full_messages).to_not include("Quantity can't be blank")
      expect(record.errors.full_messages).to_not include("Category can't be blank")
    end
  end
end
