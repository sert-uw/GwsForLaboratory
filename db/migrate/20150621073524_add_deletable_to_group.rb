class AddDeletableToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :deletable, :boolean, null: false, default: false
  end
end
