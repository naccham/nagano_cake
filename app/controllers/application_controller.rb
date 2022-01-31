class ApplicationController < ActionController::Base
  
  # before_action :authenticate_admin!,except: [:top, :about, :index]
  # before_action :authenticate_customer!,except: [:top, :index]

  # before_action :authenticate_customer!, if: :customer_signed_in?


  # def customer_signed_in?
    # unless controller_name == 'items' && action_name == 'index'
      # true
    # end
  # end
  
  # private

  # def after_sign_in_path_for(resource)
    # admin_root_path
  # end
  
end
