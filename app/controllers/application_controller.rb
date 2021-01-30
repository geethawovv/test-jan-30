class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, raise: false
end
