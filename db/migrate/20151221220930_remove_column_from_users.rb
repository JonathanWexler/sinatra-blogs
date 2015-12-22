class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :created_at
  end
end
