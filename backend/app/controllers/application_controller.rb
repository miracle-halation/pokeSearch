require 'jwt'

class ApplicationController < ActionController::API
  include Pundit::Authorization
  before_action :authenticate
  after_action :verify_authorized

  def authenticate
    token = request.headers['Authorization']&.split(' ')&.last # Authorizationヘッダーからトークンを取得

    if token
      begin
        decoded_token = JWT.decode(token, nil, false)
        uid = decoded_token[0]['sub'] # Firebase UIDを取得
        # Firebaseに対して認証を行うか、Firebase UIDを使用してユーザーを特定します。
        user = User.find_by(uid:)

        if user
          @current_user = user
        else
          not_authenticated
        end
      rescue JWT::DecodeError
        not_authenticated
      end
    else
      not_authenticated
    end
  end

  def pundit_user
    @current_user
  end

  private

  def not_authenticated
    render json: { error: { messages: ["ログインしてください"] } }, status: :unauthorized
  end
end
