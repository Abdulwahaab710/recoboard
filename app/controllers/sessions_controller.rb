# typed: true
# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action(:redirect_to_login, only: [:new, :create])

  before_action :redirect_if_logged_in, only: [:new, :create], if: :logged_in?

  layout false, only: [:new, :create]

  def index
    @sessions = current_user&.sessions
  end

  def new
    @session = Session.new
  end

  def create
    user = User.authenticate_by(session_params)

    if user.nil?
      flash.now[:error] = "Username or password is invalid."
      logger.error("Failed login attempt for username: #{session_params[:username]}")
      return render("new", status: :unauthorized)
    end

    create_and_set_session_for(user)
    redirect_to(root_path, notice: "Logged in!")
  end

  def destroy
    T.must(current_session).destroy

    redirect_to(root_path, notice: "You have successfully logged out!")
  end

  private

  sig { params(user: User).void }
  def create_and_set_session_for(user)
    user_session = Session.new(user: user)
    user_session.save!
    session[:session_uuid] = user_session.uuid
    logger.info("Successful login for username: #{session_params[:username]}")
  end

  sig { void }
  def redirect_if_logged_in
    redirect_to(root_path, notice: "You are already logged in!")
  end

  sig { returns(ActionController::Parameters) }
  def session_params
    params.require(:session).permit(:username, :password)
  end
end
