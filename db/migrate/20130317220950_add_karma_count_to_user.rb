class AddKarmaCountToUser < ActiveRecord::Migration
  def up
    add_column :users, :karma_count, :integer, :default => 0
    add_index :users, :karma_count
  end

  def down
    remove_column :users, :karma_count
    remove_index :users, :karma_count
  end
end
