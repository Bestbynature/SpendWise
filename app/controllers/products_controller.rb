class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_group, only: %i[ new edit update create destroy ]

  def new
    @product = Product.new
    
  end

  def edit
  end

  def create
    # @group = Group.find(params[:group_id])
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to group_url(@group), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    def product_params
      params.require(:product).permit(:name, :amount, :author_id, :group_id)
    end
end
