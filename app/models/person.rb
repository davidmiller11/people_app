class Person < ActiveRecord::Base
  def full_name
    return [self.first_name,self.last_name].join(' ')
  end

  def birthday
    return self.birth_date.strftime('%Y-%m-%-d')
  end

  def have_a_drink
    dob = Time.parse(self.birthday)
    today = Time.now

    if (today.year - dob.year) > 21
      self.drinks += 1
    elsif (today.year - dob.year) > 20
      if (today.month > dob.month)
        self.drinks += 1
      elsif (today.month = dob.month)
        if (today.day >= dob.day)
          self.drinks += 1
        end 
      end  
    end
  end
end