class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end
  
  def create
    build_resource sign_up_params
    resource.skip_confirmation! if !Rails.env.production?
    puts "\n\n\n\n\n\n\n--------------------\n\n\n\n" + self.resource.attributes.to_s + "\n\n\n\n\n\n\n--------------------\n\n\n\n"
    #fail resource
    #resource.email
    #resource.username = (/(.*)@/.match resource.email)[1]
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end
  
  def update
    super
  end
end