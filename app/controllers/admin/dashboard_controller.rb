class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD'], except: [:index]

  def show
    @products = Product.all.order(created_at: :desc)
    @categories = Category.all.order(created_at: :desc)
    @productcount = @products.count
    @categoriescount = @categories.count
  end

end
