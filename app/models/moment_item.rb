class MomentItem < ActiveRecord::Base
  mount_uploader :video, VideoUploader
  mount_uploader :audio, AudioUploader

  # after_save :transcode_video

  # def transcode_video
  #   binding.pry
  #   movie = FFMPEG::Movie.new(self.video.file.path)
  #   binding.pry
  # end

end
