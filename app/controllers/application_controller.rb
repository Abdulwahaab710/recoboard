# typed: true
# frozen_string_literal: true

class ApplicationController < ActionController::Base
  extend T::Sig

  before_action :redirect_to_login, unless: :logged_in?

  private

  sig { void }
  def redirect_to_login
    redirect_to(login_path, error: "Please login!")
  end

  sig { returns(T::Boolean) }
  def logged_in?
    !current_user.nil?
  end

  sig { returns(T.nilable(User)) }
  def current_user
    current_session&.user
  end

  sig { returns(T.nilable(Session)) }
  def current_session
    Session.find_by(uuid: session[:session_uuid])
  end
end
