# person_spec.rb
require 'spec_helper'

describe Person do
  context 'when a Person is created' do
    subject(:person) { Person.create(  :first_name => 'John',
                                :last_name => 'Rambo',
                                :birth_date => '1950-10-10')}
    describe '#name' do
      it 'has a full name' do
        expect(person.full_name).to eq('John Rambo')
      end
    end

    describe '#birthday' do
      it 'has a birthday' do
        expect(person.birthday).to eq('1950-10-10')
      end
    end
  end
  
  describe '#have_a_drink' do
    context 'if person is over 21' do
      subject(:person1) { Person.create(:birth_date => '1950-10-10', :drinks => 0)}
      subject(:person2) { Person.create(:birth_date => '1950-10-10', :drinks => 3)}

      it "increases a person's drinks attr by 1" do
        expect{person1.have_a_drink}.to change{person1.drinks}.by(1)
      end

      context 'if person has already had 3 drinks' do
        it "doesn't allow more than 3 drinks and returns string 'Go home, you're drunk!'" do
          expect(person2.have_a_drink).to eq("Go home, you're drunk!")
        end
      end
    end

    context 'if person is under 21' do
      subject(:person1) {Person.create(:birth_date => '1993-6-1', :drinks => 0)}
      it "returns a string 'Wait a few years!'" do
        expect{person1.have_a_drink}.not_to change{person1.drinks}
        expect(person1.have_a_drink).to eq("Wait a few years!")
      end
    end
  end

  describe '#drive_a_car' do
    context 'if user is under 18' do
      subject(:person1) {Person.create(:birth_date => '2000-5-5')}
      it "returns a string 'Not yet, youngin!'" do
        expect(person1.drive_a_car).to eq("Not yet, youngin!")
      end
    end

    context 'if user is over 18 and has license' do
      subject(:person2) {Person.create(:birth_date => '1990-1-1', :license => true, :drinks => 0)}
      it "allows person to drive" do
        expect(person2.drive_a_car).to eq("Have fun driving home!")
      end
    end

    context 'if person is over 21, has license but is drunk' do
      subject(:person3) {Person.create(:birth_date => '1993-1-1', :license => true, :drinks => 3)}
      it "returns string 'looks like a cab for you tonight'" do
        expect(person3.drive_a_car).to eq("Looks like a cab for you tonight!")
      end
    end
  end

  describe '#sober_up' do
    context 'if person has had drinks' do
      subject(:person) {Person.create(:drinks => 2)}
      it 'decreases drinks attr by 1' do
        expect{person.sober_up}.to change {person.drinks}.by(-1)
      end
    end
    context 'if person has 0 drinks' do
      subject(:person) {Person.create(:drinks => 0)}
      it 'does not change drinks attr' do
        expect{person.sober_up}.not_to change {person.drinks}
      end
    end
  end
  
end