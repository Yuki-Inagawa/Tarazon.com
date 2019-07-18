class RemoveNicknameFromReviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :nickname, :string
  end
end
