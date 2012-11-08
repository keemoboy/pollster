class Poll < ActiveRecord::Base
  attr_accessible :edit_url, :name

  def generate_edit_url
    self.edit_url = "http://localhost:3000/polls/#{SecureRandom.hex}"
  end

end
