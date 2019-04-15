class AddAuthorToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :author, index: true
    add_foreign_key :question, :user, column: :author_id
  end
end
