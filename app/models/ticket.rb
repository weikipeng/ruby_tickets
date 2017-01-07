class Ticket < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :document_attachment, DocumentAttachmentUploader
  
  # Setting up ElasticSearch integration
  include Tire::Model::Search
  include Tire::Model::Callbacks
	
  mapping _source: { excludes: ['attachment'] } do
    indexes :id, type: 'integer'
    indexes :name
    indexes :attachment, type: 'attachment'
  end

  def attachment
    path_to_attachment = document_attachment.file.file
    Base64.encode64(open(path_to_attachment) { |file| file.read })
  end

  def to_indexed_json
    to_json(methods: [:attachment])
  end
end
