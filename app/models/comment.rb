class Comment < ActiveRecord::Base
  acts_as_tree order: 'created_at DESC', :dependent => :destroy
  belongs_to :post
end
