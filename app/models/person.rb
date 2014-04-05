class Person < ActiveRecord::Base
  def full_name
    return [self.first_name,self.last_name].join(' ')
  end

  def birthday
    return self.birth_date.strftime('%Y-%m-%-d')
  end

  def have_a_drink

    if self.drinks == 3
      return "Go home, you're drunk!"
    elsif self.age_at_least(21)
      self.drinks += 1
    else
      return "Wait a few years!"
    end
  end

  def drive_a_car
    if !self.age_at_least(18)
      return "Not yet, youngin!"
    elsif self.age_at_least(18) && self.license
      if self.drinks < 3
        return "Have fun driving home!"
      else
        return "Looks like a cab for you tonight!"
      end
    end
  end

  def age_at_least(age)
    dob = Time.parse(self.birthday)
    today = Time.now

    if (today.year - dob.year) > age
      return true
    elsif (today.year - dob.year) > (age - 1)
      if (today.month > dob.month)
        return true
      elsif (today.month == dob.month)
        if (today.day >= dob.day)
          return true
        else
          return false
        end 
      else
        return false
      end  
    else
      return false
    end
  end
end