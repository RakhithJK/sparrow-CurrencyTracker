class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :login, :password, :password_confirmation, :remember_me

  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :user_country_relations, :dependent => :destroy
  has_many :visited_countries, :through => :user_country_relations, :source => :country, :conditions => ["user_country_relations.visited = ?", true]
  has_many :not_visited_countries, :class_name => "Country", :finder_sql => "SELECT * FROM countries WHERE id NOT IN (SELECT DISTINCT country_id FROM user_country_relations WHERE user_id = #{id})"

  def to_s
    username || email
  end

  def visited?(country)
    visited_countries.include?(country)
  end

  def collected?(currency)
    visited_countries.map(&:code).include?(currency.country_id)
  end

  def collected_currencies
    visited_countries(:include => :currencies).map(&:currencies).flatten
  end

  def not_collected_currencies
    not_visited_countries(:include => :currencies).map(&:currencies).flatten
  end

  protected

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["username = :value OR email = :value", { :value => login }]).first
  end
end
