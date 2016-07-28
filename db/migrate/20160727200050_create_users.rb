class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :handle
      t.string :uid
      t.string :oauth_token
      t.string :oauth_secret
      t.string :bio
      t.string :location
      t.string :avatar
      t.timestamps
    end
  end
end
