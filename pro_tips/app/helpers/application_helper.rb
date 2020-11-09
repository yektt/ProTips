module ApplicationHelper
  Avatar_cat = "https://68.media.tumblr.com/7d65a925636d6e3df94e2ebe30667c29/tumblr_nq1zg0MEn51qg6rkio1_500.jpg"
  Avatar_octahedron = "https://68.media.tumblr.com/9f9b498bf798ef43dddeaa78cec7b027/tumblr_o51oavbMDx1ugpbmuo7_500.png"
  Avatar_pyramid = "http://78.media.tumblr.com/75bad14fee104f69652084d545213291/tumblr_mldfty8fh41qcnibxo5_1280.png"
  Avatar_happy_cone = "https://68.media.tumblr.com/22d1c50c3e2ca1062a94b47a65bfeb6d/tumblr_o51oavbMDx1ugpbmuo10_500.png"
  
  def default_avatar(user)
    case 
    when ( user.name.nil?)              then user.avatar_url ||= "#{Avatar_cat}"
    when ( user.name[0].downcase < 'h') then "#{Avatar_cat}"
    when ( user.name[0].downcase < 'n') then "#{Avatar_octahedron}"
    when ( user.name[0].downcase < 'u') then "#{Avatar_pyramid}"
    else "#{Avatar_happy_cone}"
    end
  end

  def pluralize_comments(comments)
    if ( comments.count > 1 )
      comments.count.to_s << " comments"
    else
      comments.count.to_s << " comment"
    end
  end

  def pluralize_tips(tips)
    if ( tips.count > 1 )
      tips.count.to_s << " tips"
    else
      tips.count.to_s << " tip"
    end
  end
end
