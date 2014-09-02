class Response < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :question
  has_many :votes

  validates_presence_of :response

end
