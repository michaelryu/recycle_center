tags = ['추천상품', '계절상품', '가구', '가전제품', '사무용품', '업무용품']

tags.each do |tag|
	ActsAsTaggableOn::Tag.new(:name => tag).save
end

# unless Rails.env.production?
	User.create!(name:  "관리자",
             email: "admin@admin.com",
             password:              "123123123",
             password_confirmation: "123123123",
             admin: true)
	
  1..20.times.each do |n|
    Post.create(
      title: "Test #{n}",
      content: "This is a test for the announcments",
      user: User.first
    )
  end

	(1..12).each do |i|
		Listing.create(
			title: "Listing #{i}",
			realprice: "$#{i}",
			user: User.first,
			picture: File.open("app/assets/images/seed/#{i}.png"),
			).tap do |listing|
				if i > 5
					listing.tag_list.add(tags[0])
				else
					listing.tag_list.add(tags[i])
				end
			listing.save
		end
	end
# end