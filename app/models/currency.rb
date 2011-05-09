class Currency < ActiveRecord::Base
  attr_accessible :name, :code, :country_id

  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code, :allow_blank => true

  belongs_to :country, :primary_key => :code

  def self.named_like(name)
    where(["name LIKE ?", "%#{name}%"])
  end
end