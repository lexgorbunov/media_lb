class Admin::AdminController < ActionController::Base
  prepend_view_path 'app/views/admin'
  layout 'admin'
end
