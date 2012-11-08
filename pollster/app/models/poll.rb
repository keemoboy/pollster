class Poll < ActiveRecord::Base
  attr_accessible :edit_url, :name

  has_many :questions

  def generate_edit_url
    self.edit_url = "/polls/#{SecureRandom.hex}"
  end

end
