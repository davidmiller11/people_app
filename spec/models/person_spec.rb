# person_spec.rb
require 'spec_helper'

describe Person do
  context 'when a Person is created' do
    subject(:person) { Person.new(  :first_name => 'John',
                                :last_name => 'Rambo',
                                :birth_date => '1950-10-10')}
    describe '#name' do
      it 'has a full name' do
        expect(person.full_name).to eq('John Rambo')
      end
    end
    describe '#birthday' do
      it 'has a birthday' do
        expect(person.birthday).to eq('October 10, 1950')
      end
    end
    describe '#have_a_drink' do
      context 'if person is over 21' do
        xit "increases a person's drinks attr by 1" do
        end
        xit "doesn't allow more than 3 drinks and returns string 'Go home you're drunk'"
      end
      context 'if person is under 21' do
        xit "returns a string 'wait a few years'" do
        end
      end
    end
  end

  describe '#drive_a_car' do
    context 'if user is under 18' do
      xit "returns a string 'not yet youngin'" do
      end
    end
    context 'if user is over 18 and has license' do
      xit "allows person to drive" do
      end
    end
    context 'if person is over 21, has license but is drunk' do
      xit "returns string 'looks like a cab for you tonight'"
    end
  end

  describe '#sober_up' do
    context 'if person has had drinks' do
      xit 'decreases drinks attr by 1' do
      end
    end
    context 'if person has 0 drinks' do
      xit 'does not change drinks attr' do
      end
    end
  end
  
end