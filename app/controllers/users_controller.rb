class UsersController < ApplicationController

  def index
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: "Mr.Gru",
      username: "Gru"
    )

    @questions = [
      Question.new(text: "How do you do?", created_at: Date.parse('27.03.2019')),
      Question.new(text: "Are you pussy?", created_at: Date.parse('27.03.2019'))
    ]
    
    @new_question = Question.new
  end
end
