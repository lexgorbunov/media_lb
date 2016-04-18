class Admin::AdminController < ActionController::Base
  prepend_view_path 'app/views/admin'
  layout 'admin'

  before_action :authenticate_user!
end
