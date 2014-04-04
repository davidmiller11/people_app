class Person < ActiveRecord::Base
  def full_name
    return [self.first_name,self.last_name].join(' ')
  end

  def birthday
    return self.birth_date.strftime('%B %-d, %Y')
  end
end