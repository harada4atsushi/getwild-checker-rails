class TrainingSet < ActiveRecord::Base
  validates :text, presence: true
end
