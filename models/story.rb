class Story < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  
  unless ActiveRecord::Base.connection.table_exists?(:stories)
    ActiveRecord::Base.connection.create_table :stories do |t|
      t.text :title
    end
  end
  
end
