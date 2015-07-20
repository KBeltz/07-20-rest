class User < ActiveRecord::Base
  has_many :stories
  validates :email, presence: true

  unless ActiveRecord::Base.connection.table_exists?(:users)
    ActiveRecord::Base.connection.create_table :users do |t|
      t.text :email
      t.text :password
    end
  end
  
end