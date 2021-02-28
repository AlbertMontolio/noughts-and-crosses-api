class UsersController < ApplicationController
  skip_before_action :authorize_request

  # move to sessions_controler, create, post request
  def sign_in_with_email
    email = params[:email]
    password = params[:password]
    user = User.find_by_email(email)

    if user
      auth_token = AuthenticateUser.new(user.email, password).call
    else
      user = User.create(
        email: email,
        password: password,
        password_confirmation: password # necessary for bcrypt, not implemented in frontend
      )

      AuthenticateUser.new(user.email, password).call
    end

    response = UserPresenter.new(user).as_json
    json_response response
  end

  private

  def user_params
    params.permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end
