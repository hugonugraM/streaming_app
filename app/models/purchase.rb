class Purchase < ApplicationRecord
  validates_presence_of :purchase_option, :user
  validate :prevent_user_duplicated_active_content

  belongs_to :purchase_option
  belongs_to :user

  scope :active, -> { where( "purchases.created_at > ?", ( Time.current - 2.days )) }

  def remaining_time
    2.days - (Time.current - self.created_at)
  end

  def content
    self.purchase_option.content
  end

  def prevent_user_duplicated_active_content
    if self.purchase_option && self.user
      user_active_content = self.user.purchases.active.map{|purchase| purchase.purchase_option.content_id}
      if ( user_active_content.include?( self.purchase_option.content_id ))
        errors.add( :number, "A same content can´t be purchased twice while is active")
      end
    end
  end
end
