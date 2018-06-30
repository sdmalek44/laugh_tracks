describe 'A visitor' do
  context 'visiting /comedians' do
    it 'can see each comedians name and age' do
      comedian1 = Comedian.create(name: 'boblkj', age: 234)
      comedian2 = Comedian.create(name: 'todd burr', age: 43)

      visit '/comedians'

      expect(page).to have_content("Name: #{comedian1.name}")
      expect(page).to have_content("Age: #{comedian1.age}")
      expect(page).to have_content("Name: #{comedian2.name}")
      expect(page).to have_content("Age: #{comedian2.age}")
    end
    it 'can see list of each comedians specials' do
      comedian = Comedian.create(name: 'bill burr', age: 43)
      special = Special.create(name: 'a burr special', comedian_id: '1')

      visit '/comedians'

      expect(page).to have_content("#{special.name}")
    end
    it 'can see average age for each comedian' do
      comedian1 = Comedian.create(name: 'bill burr', age: 2)
      comedian2 = Comedian.create(name: 'sdfasd', age: 4)

      visit '/comedians'

      expect(page).to have_content("Average-age: 3")
    end
    it 'can see the count of specials for each comedian' do
      comedian = Comedian.create(name: 'bis burr', age: 45)
      Special.create(name: 'the special', comedian_id: 1 )
      Special.create(name: 'another spec', comedian_id: 1 )

      visit '/comedians'

      expect(page).to have_content("Special Count: #{comedian.special_count}")
    end
  end
  context 'visiting /comedians?age=34' do
    it 'can see all comedians with that age' do
      comedian1 = Comedian.create(name: 'bis burr', age: 45)
      comedian2 = Comedian.create(name: 'bill bsdr', age: 34)
      comedian3 = Comedian.create(name: 'bsll burr', age: 23)

      visit '/comedians?age=34'

      expect(page).to have_content("#{comedian2.name}")
      expect(page).to_not have_content("#{comedian1.name}")
      expect(page).to_not have_content("#{comedian3.name}")
    end
  end
end
