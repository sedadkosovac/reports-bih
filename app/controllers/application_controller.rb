class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'muri', password: 'kurva'

end
