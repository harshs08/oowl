class Product < ActiveRecord::Base
  has_attached_file :image,
                    styles: { medium: ["300x300>", :png],
                              thumb: ["100x100>", :png],
                              original: ["100%", :png] },
                    processors: [:transparency]
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  scope :furniture, -> { where(category: 'furniture') }
  scope :dress, -> { where(category: 'dress') }
  scope :others, -> { where("category IS NULL") }
end
