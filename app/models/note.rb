class Note < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
end
