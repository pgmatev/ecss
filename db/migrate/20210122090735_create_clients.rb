class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name, limit: 128
      t.decimal :currency, precision: 10, scale: 2, array:true
      t.timestamps
    end
    create_table :users_clients, id: false do |t|
      t.belongs_to :user
      t.belongs_to :client
    end
  end
end
