class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      temporary_password_cleanser_path(resource)
    end
end