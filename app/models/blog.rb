class Blog < ApplicationRecord
  ####################
  ## Valiation Area ##
  ####################
  validates :title, presence: true, length: { maximum: 255 }
  validate :validate_published_at_attr
  validates :content, presence: true

  def validate_published_at_attr
    if published_at.blank?
      errors.add(:published_at, 'Please add value for published_at')
      return;
    end

    published_at.to_date
  rescue ArgumentError
    errors.add(:published_at, 'Published_at must be a date')
  end

  has_rich_text :content

  ####################
  # Association Area #
  ####################
  has_many :comments
end
