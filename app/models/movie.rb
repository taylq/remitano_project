class Movie < ApplicationRecord
  belongs_to :user
  has_many :ratings

  YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  validates :url, presence: true, format: YT_LINK_FORMAT

  before_create :set_info_movie

  default_scope { order(created_at: :desc) }

  def set_info_movie
    id = Movie.get_youtube_id(self.url)
    movie = Movie.init_youtube(id)
    self.title = movie.title
    self.description = movie.description
    self.youtube_id = id
  end

  def self.init_youtube(id)
    return Yt::Video.new(id: id)
  end

  def self.get_youtube_id(url)
    regex_id = /^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/
    match = regex_id.match(url)
    if match && !match[1].blank?
      match[1]
    else
      nil
    end
  end
end
