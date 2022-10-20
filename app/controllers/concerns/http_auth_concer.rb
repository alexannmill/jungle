# module HttpAuthConcern

#   include do
#     before action :http_authenticate
#   end


#   def http_authenticate
#     return true unless Rail.env == 'production'

#     authenticate_or_request_with_http_basic do |username, password|
#       username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
#     end
#   end
# end