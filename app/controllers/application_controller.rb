class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']
  protect_from_forgery with: :exception
  add_flash_types(:danger)
end
