class UserCountryRelation < ActiveRecord::Base
  belongs_to :user
  belongs_to :country

  validates_presence_of :user, :country
  validates_uniqueness_of :user_id, :scope => :country_id

  def self.update_attributes_by_user_id_and_country_id(user_id, country_id, attributes)
    user_country_relation = UserCountryRelation.find_or_initialize_by_user_id_and_country_id(user_id, country_id)
    user_country_relation.update_attributes(attributes)
  end
end
