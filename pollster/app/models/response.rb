class Response < ActiveRecord::Base
  attr_accessible :body, :question_id

  belongs_to :question
end
