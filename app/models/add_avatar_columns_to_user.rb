class AddAvatarColumnsToUser < ActiveRecord::Base
  def up
    add_attachment :users, :avatar
  end

  def down
    remove_attachment :users, :avatar
  end
end
