class Person < ActiveRecord::Base
  def full_name
    return [self.first_name,self.last_name].join(' ')
  end
end