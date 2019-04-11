module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'gru.jpg'
    end
  end

  def sklonenie(number, one, few, many)
    if number == nil || !number.is_a?(Numeric)
      number = 0
    end

    if (number % 100).between?(11, 19)
      return many
    end

    ostatok = number % 10

    if ostatok == 1
      return one
    end

    if ostatok >= 2 && ostatok <= 4
      return few
    end

    if (ostatok >= 5 && ostatok <= 9) || ostatok == 0
      return many
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
