# app/controllers/api/v1/categories_controller.rb
class Api::V1::CategoriesController < ApplicationController
  def create
    category = Category.new(category_params)
    if category.save
      render json: category, status: :created
    else
      render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.permit(:name)
  end
end
