class Project < ApplicationRecord
  belongs_to :user
  
  has_many :discussions, dependent: :destroy

  validates :title, presence: true, uniqueness: {scope: :title}

end
