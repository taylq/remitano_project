class Users::SessionsController < Devise::SessionsController
  before_action :check_user_exists, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end

  protected

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  def build_resource(hash = {})
    self.resource = resource_class.new_with_session(hash, session)
  end

  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  private

  def check_user_exists
    user = User.find_by(email: params[:user][:email])
    unless user.present?
      build_resource(sign_up_params)

      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource) if is_navigational_format?
  end
end
