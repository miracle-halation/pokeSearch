require 'jwt'

class ApplicationController < ActionController::API
  before_action :authenticate

  def authenticate
    token = request.headers['Authorization']&.split(' ')&.last # Authorizationヘッダーからトークンを取得

    if token
      begin
        decoded_token = JWT.decode(token, nil, false)
        uid = decoded_token[0]['sub'] # Firebase UIDを取得
        # Firebaseに対して認証を行うか、Firebase UIDを使用してユーザーを特定します。
        user = User.find_by(uid: uid)

        if user
          @current_user = user
        else
          self.not_authenticated
        end
      rescue JWT::DecodeError
        self.not_authenticated
      end
    else
      self.not_authenticated
    end
  end

  private

  def not_authenticated
    render json: { error: { messages: ["ログインしてください"] } }, status: :unauthorized
  end
end
