#Create section
sections = %w[Breakfast Lunch Dinner Drinks]
sections.each {|item| Section.create(name: item)}

#Create food_item
Section.all.each do |item|
	for i in 0..14
		FoodItem.create(
				name: Faker::Name.name,
				description: Faker::Lorem.paragraph,
				price: rand(1..100)*1000,
				img_url: Faker::LoremPixel.image("500x320", false, 'food', nil, Faker::Lorem.word),
				section_id: item.id
				)
	end
end
