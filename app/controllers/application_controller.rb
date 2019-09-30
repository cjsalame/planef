# ApplicationController
class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session
  # :exception --> :null_session
  # Así no tira error el PlanificationController#Update con InvalidAuthenticityToken
  # ..no sé por qué
end
