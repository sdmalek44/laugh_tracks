RSpec.describe Comedian do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 48)
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')
        expect(comic).to_not be_valid
      end
    end
  end
  describe 'Class Methods' do
    it 'can calculate average age for comedian' do
      Comedian.create(name: 'bill burr', age: 2)
      Comedian.create(name: 'sdfasd', age: 4)

      visit '/comedians'

      expect(Comedian.avg_age).to eq(3)
    end
  end
  describe 'Instance Methods' do
    it 'can calculate special count for each merchant' do
      comedian = Comedian.create(name: 'bis burr', age: 45)
      Special.create(name: 'the special', comedian_id: 1 )
      Special.create(name: 'another spec', comedian_id: 1 )

      visit '/comedians'

      expect(comedian.special_count).to eq(2)
    end
  end
end
