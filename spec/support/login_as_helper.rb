module LoginAsHelper
  def login_as(user)
    session[:current_user_id] = user.id
  end
end

    