require 'active_record'

class User < ActiveRecord::Base
  def index
    render plain: User.all.to_a
  end

  def to_pleasent_string
    "#{id}. #{name}, #{email}, #{password}"
  end
end
