class AddDocumentAttachmentToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :document_attachment, :string
  end
end
