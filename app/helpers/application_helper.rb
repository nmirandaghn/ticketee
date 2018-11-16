module ApplicationHelper
  def admins_only
    block.call if current_user.try(:admin?)
  end

  def admin?
    current_user && current_user.admin?
  end
end
