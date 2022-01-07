class Note < ApplicationRecord
  belongs_to :user

  validate :title_or_content_present?

  def public_attributes
    [:title, :content]
  end
  
  private
  def title_or_content_present?
    if self.title.blank? && self.content.blank?
      errors.add :base, 'At least one of title or content must exist'
    end
  end
end
