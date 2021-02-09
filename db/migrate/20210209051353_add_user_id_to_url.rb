class AddUserIdToUrl < ActiveRecord::Migration[6.1]
  def change
    add_reference :urls, :user, foreign_key: true
  end
end
