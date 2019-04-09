class UsersController < ApplicationController

  def index
    @users = [
      User.new(
        id: 1,
        name: "Gru",
        username: "Mr.Gru",
      ),
      User.new(
        id: 2,
        name: "Nefario",
        username: "Dr. Nef",
      )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: "Mr.Gru",
      username: "Gru",
    )

    @questions = [
      Question.new(text: "Как дела?", created_at: Date.parse('27.03.2019')),
      Question.new(text: "В чем смысл жизни?", created_at: Date.parse('27.03.2019')),
      Question.new(text: "В чем смысл жизни?", created_at: Date.parse('27.03.2019')),
      Question.new(text: "В чем смысл жизни?", created_at: Date.parse('27.03.2019')),
      Question.new(text: "В чем смысл жизни?", created_at: Date.parse('27.03.2019')),
      Question.new(text: "В чем смысл жизни?", created_at: Date.parse('27.03.2019')),
      Question.new(text: "В чем смысл жизни?", created_at: Date.parse('27.03.2019')),
    ]

    @new_question = Question.new
  end
end
