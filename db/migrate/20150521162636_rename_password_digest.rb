class RenamePasswordDigest < ActiveRecord::Migration
  def change
    rename_column :users, :password_digest, :password_hash
  end
end
