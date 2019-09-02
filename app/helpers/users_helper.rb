module UsersHelper
    def isAdmin?
    user_signed_in? && current_user.role === 'Admin'
  end
end
