class ProductsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.find(params[:group_id])
    @product = Product.new
  end

  def create
    @group = Group.find(params[:group_id])
    product_name = params[:product][:name]
    product_amount = params[:product][:amount]
    product_author_id = params[:product][:author_id]
    @group_ids = params[:product][:group_ids].reject(&:blank?)
    successfully_created_products = create_products(product_name, product_amount, product_author_id, @group_ids)

    if successfully_created_products.any?
      respond_to do |format|
        format.html { redirect_to group_url(@group), notice: 'Products were successfully created.' }
        format.json { render :show, status: :created, location: @product }
      end
    else
      respond_to do |format|
        format.html do
          redirect_to new_group_product_url(@group), alert: 'No products were created. Please fill all fields.'
        end
      end
    end
  end

  private

  def create_products(name, amount, author_id, group_ids)
    created_products = []
    group_ids.each do |group_id|
      product = Product.new(name:, amount:, author_id:, group_id:)
      if product.save
        created_products << product
      else
        flash[:alert] = "Product #{name} could not be created: #{product.errors.full_messages.join(', ')}"
      end
    end
    created_products
  end
end
