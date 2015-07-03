module ApplicationHelper

  def sign_in_or_out_link
    if current_user
      link_to 'Sign Out', destroy_user_session_path, method: :delete
    else
      link_to 'Sign In', new_user_session_path
    end
  end
end
