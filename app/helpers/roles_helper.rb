module RolesHelper
  def can_edit?(tip)
    return false unless logged_in?

    case(current_user.role)
    when 'admin'      then true
    when 'registered' then tip.user == current_user
    else false
    end
  end

  def can_update?(user)
    return false unless logged_in?

    case(current_user.role)
    when 'admin'      then true
    when 'registered' then user == current_user
    else false
    end
  end
end