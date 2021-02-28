class UserPresenter
  def initialize(user)
    @user = user
  end

  def as_json
    auth_token = JsonWebToken.encode(user_id: @user.id)
    puts "### auth_token"
    p auth_token

    # create method to camelize keys

    {
      authorization_token: auth_token,
      backendUserId: @user.id,
      email: @user.email,
      moveType: @user.move_type
    }
  end
end
