class Country < ActiveRecord::Base
  
  attr_accessible :name, :code, :visited

  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code, :allow_blank => true

  has_many :currencies, :primary_key => :code

  accepts_nested_attributes_for :currencies, :allow_destroy => true

  def self.named_like(name)
    where(["name LIKE ?", "%#{name}%"])
  end

end