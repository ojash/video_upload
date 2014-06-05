class MomentItem < ActiveRecord::Base
  mount_uploader :video, VideoUploader
  mount_uploader :audio, AudioUploader
end
