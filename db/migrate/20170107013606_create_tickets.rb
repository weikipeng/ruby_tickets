class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :set_id_seq
      t.text :address
      t.decimal :price_paid
      t.string :email_address

      t.timestamps
    end
  end
end