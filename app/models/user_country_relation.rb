class UserCountryRelation < ActiveRecord::Base
  belongs_to :user
  belongs_to :country

  validates_presence_of :user, :country
  validates_uniqueness_of :user_id, :scope => :country_id
end
