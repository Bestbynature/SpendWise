class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[ show edit update destroy ]
  before_action :set_icons, only: %i[ new edit create ]

  def index
    @groups = Group.all.includes(:products)
    @total_value = {}
    @groups.each do |group|
      @products = Product.where(author_id: current_user.id, group_id: group.id)
      @total_value[group.id] = @products.sum(:amount)
    end
    @total_value
  end

  def show
    @products = Product.where(author_id: current_user.id, group_id: @group.id)
    @total = @products.sum(:amount)
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_url, notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { redirect_to groups_url, alert: "Unable to create group. Try a unique name!" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def group_params
      params.require(:group).permit(:name, :icon, :user_id)
    end

    def set_group
      @group = Group.find(params[:id])
    end

    def set_icons
      images_directory = Rails.root.join('app', 'assets', 'images')
      all_files = Dir.glob(images_directory.join('*'))
      image_files = all_files.select { |file| file.downcase.ends_with?('.jpg', '.jpeg', '.png', '.gif') }
      @icon_names  = image_files.map { |file| File.basename(file, '.*') }

      if @icon_names.empty?
        flash[:alert] = "No images found in the assets directory. Please add some images."
        redirect_to groups_path
      end
    end


end
