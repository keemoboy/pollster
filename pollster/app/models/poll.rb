class Poll < ActiveRecord::Base
  attr_accessible :edit_url, :name

  has_many :questions, :dependent => :destroy

  before_create :generate_edit_url


  private

  def generate_edit_url
    self.edit_url = SecureRandom.hex
  end

end
