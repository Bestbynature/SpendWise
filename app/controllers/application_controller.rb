class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_icons, if: :user_signed_in?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name email password password_confirmation current_password])
  end

  def set_icons
    images_directory = Rails.root.join('app', 'assets', 'images')
    all_files = Dir.glob(images_directory.join('*'))
    image_files = all_files.select { |file| file.downcase.ends_with?('.jpg', '.jpeg', '.png', '.gif', 'jfif') }
    @icon_names = image_files.map { |file| File.basename(file, '.*') }
    @icon_names.sort!
    return unless @icon_names.empty?

    flash[:alert] = 'No images found in the assets directory. Please add some images.'
    redirect_to groups_path
  end
end
