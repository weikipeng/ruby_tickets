class AddImageToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :image, :string
  end
end
