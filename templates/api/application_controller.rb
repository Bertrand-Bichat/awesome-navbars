class ApplicationController < ActionController::API
  # before_action :user_authorized
  # before_action :front_authorized

  private

  def encode_token(payload)
    JWT.encode(payload, 's3cr3t')
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, 's3cr3t', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def user_authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  def front?
    if decoded_token
      token = decoded_token[0]['front_token']
      token == ENV['FRONT_TOKEN']
    end
  end

  def front_authorized
    # @token = encode_token({ front_token: ENV['FRONT_TOKEN'] })
    # render json: { token: @token }
    render json: { message: 'Not authorized' }, status: :unauthorized unless front?
  end
end
