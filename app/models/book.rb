class Book < ActiveRecord::Base
	mount_uploader :image, AvatarUploader

	validates :title, :author, :BookCode, :numOfCopies, presence: true
	validates :title, :author, length: { minimum: 3, maximum: 100 }
	validates :BookCode, length: { minimum: 11, maximum: 11 }
	validates :numOfCopies, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
	#validates_format_of :image, allow_blank: true:with => %r{\.(png|jpg|jpeg)\z}i, :message => "Unaccepted image format."
	validates :image, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\z}i,
      message: 'URL must point to GIT/JPG/PNG pictures'
  }
end
