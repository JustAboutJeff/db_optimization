class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :karma_count

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  scope :page, lambda { |page_num, offset_num| offset(offset_num*(page_num-1)).limit(offset_num) }

  def update_karma_count(value)
    self.karma_count += value
  end

  def self.by_karma
    self.order('karma_count DESC')
  end

  def total_karma
    self.karma_count
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # def self.page(page_num)
  #   number_per_page = 20
  #   offset(number_per_page*(page_num-1)).limit(number_per_page)
  # end
end
