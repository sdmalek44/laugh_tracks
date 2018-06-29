describe 'A visitor' do
  context 'visiting /comedians' do
    it 'can see each comedians name' do
      comedian1 = Comedian.create(name: 'bill burr', age: 43)
      comedian2 = Comedian.create(name: 'todd burr', age: 43)
      visit '/comedians'

      within("#name-1") do
        expect(page).to have_content("Name: #{comedian1.name}")
      end
    end
    it 'can see each comedians age' do
      comedian1 = Comedian.create(name: 'bill burr', age: 43)
      comedian2 = Comedian.create(name: 'todd burr', age: 43)
      visit '/comedians'

      within("#age-2") do
        expect(page).to have_content("Age: #{comedian2.age}")
      end
    end
    it 'can see list of each comedians specials' do
      comedian = Comedian.create(name: 'bill burr', age: 43)
      special = Special.create(name: 'a burr special', comedian_id: '1')

      visit '/comedians'

      within("#specials-1") do
        expect(page).to have_content("Specials: #{special.name}")
      end
    end
    xit 'can see average age for each comedian' do

    end
    xit 'can see the count of specials for each comedian'
  end
  context 'visiting /comedians?age' do
    xit 'can see all comedians with that age' do

    end
  end
end
