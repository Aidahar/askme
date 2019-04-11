module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'gru.jpg'
    end
  end

  def sklonenie(number)

    if number == nil || !number.is_a?(Numeric)
      number = 0
    end

    if (number % 100).between?(11, 19)
      return many
    end

    ostatok = number % 10

    if ostatok == 1
      return 'вопрос'
    end

    if ostatok >= 2 && ostatok <= 4
      return 'вопроса'
    end

    if (ostatok >= 5 && ostatok <= 9) || ostatok == 0
      return 'вопросов'
    end
  end
end
