tags = ['추천상품', '계절상품', '가구', '가전제품', '사무용품', '업무용품']

tags.each do |tag|
	ActsAsTaggableOn::Tag.new(:name => tag).save
end

unless Rails.env.production?
	
	User.create!(name:  "관리자",
             email: "admin@admin.com",
             password:              "123123123",
             password_confirmation: "123123123",
             admin: true)
end
	
  1..20.times.each do |n|
    Post.create(
      title: "테스트 #{n}",
      content: "위키백과는 전 세계 누구나 편집할 수 있는, 다중 언어 웹 기반 자유 콘텐츠 백과사전 프로젝트입니다. “위키백과”라는 이름은 함께 참여하여 웹사이트를 만드는 기술인 ‘위키’(하와이어로 “빠른”을 뜻함)와 ‘백과사전’을 합한 혼성어입니다. 위키백과 항목은 관련 정보가 링크로 서로 연결되어 있습니다.

위키백과는 주로 익명의 인터넷 사용자가 대가 없이 공동으로 작성합니다. 문서를 훼손하지 못하게 편집을 제한한 경우를 제외하고 인터넷을 이용할 수 있는 누구라도 위키백과 항목을 쓰거나 수정할 수 있습니다 사용자는 익명으로든 필명으로든 실명으로든 자신이 선택해서 기여할 수 있습니다.

위키백과는 2001년에 설립되어 빠르게 성장해 왔습니다. 인터넷 마케팅을 연구하는 기업인 컴스코어에 따르면 2011년 3월 기준, 매달 4억 명이 방문하는 세계 최대 참고 웹사이트 가운데 한 곳이 되었습니다. 매일 전 세계 수십만 명의 방문자가 공동으로 수만 번의 편집을 하고 수천 건의 문서를 새로 만들어 위키백과의 지식을 증대하고 있습니다. 자세한 사항은 위키백과:통계를 참고하십시오.

위키백과는 종이 기반 참고 자료와는 아주 다르게 실시간으로 함께 편집합니다. 위키백과는 끊임없이 새로 만들어지고 갱신되므로 역사적 사건에 관한 항목은 수분 내에 생성됩니다. 반면에 종이 기반 백과사전에서는 이와 같은 과정이 수개월이나 수년이 걸립니다. 오래 전에 생성된 항목은 시간이 가면서 점점 더 일반화되고 중립적 시각으로 변합니다. 새로 만들어진 항목은 잘못된 정보, 백과사전에 싣기에 부적절한 내용 또는 문서를 훼손하는 내용을 포함할 수 있습니다. 이 점을 주의하면 유용한 정보를 취하고 잘못된 정보를 피하는 데 도움이 됩니다.",
      user: User.first
    )
  end

	(1..12).each do |i|
		Listing.create(
			title: "판매 제품 #{i}",
			realprice: "₩#{i}#{i}",
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