require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save with all fields set' do
      @category = Category.create(name:'Aquatic')
      @product = Product.new()
      @product.category_id = @category.id
      @product.name = 'seaweed'
      @product.price_cents = 10
      @product.quantity = 3
      @product.save

      expect(@product).to be_valid
    end

    it 'should validate that NAME is valid' do
      @category = Category.create(name:'Aquatic')
      @product = Product.new()
      @product.category_id = @category.id
      @product.name = nil
      @product.price_cents = 10
      @product.quantity = 3
      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to be_present
    end

    it 'should validate that PRICE is valid' do 
      @category = Category.create(name:'Aquatic')
      @product = Product.new()
      @product.category_id = @category.id
      @product.name = 'seaweed'
      @product.price_cents = nil
      @product.quantity = 3
      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to be_present
    end

    it 'should validate that QUANTITY is valid' do 
      @category = Category.create(name:'Aquatic')
      @product = Product.new()
      @product.category_id = @category.id
      @product.name = 'seaweed'
      @product.price_cents = 10
      @product.quantity = nil

      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to be_present
    end

    it 'should validate that CATEGORY is valid' do 
      @category = Category.create(name:'Aquatic')
      @product = Product.new()
      @product.category_id = nil
      @product.name = 'seaweed'
      @product.price = 10
      @product.quantity = 3

      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to be_present
    end
  end
end
