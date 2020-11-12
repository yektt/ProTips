module RolesHelper
  def can_edit?(tip)
    case(current_user.role)
    when 'admin'      then true
    when 'registered' then tip.user == current_user
    else false
  end
end