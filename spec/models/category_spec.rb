require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:gossip) { Category.find_or_create_by(name: "Gossip") }
  let(:news) { Category.find_or_create_by(name: "News") }
  
  let(:gossip_post_1) { Post.create(title: "Justin Beiber's secret", content: "I heard he has green toes.") }
  let(:gossip_post_2) { Post.create(title: "Wardrobe Malfunction", content: "I heard that the boob was on purpose!") }
  let(:news_post_1) { Post.create(title: "Obama Elected Again", content: "Obama was elected to a second term as president...") }
  
  it "has a name" do
    expect(gossip.name).to eq("Gossip")
  end
  
  it "has many posts" do
    gossip.posts << [gossip_post_1, gossip_post_2]
    expect(gossip.posts).to include(gossip_post_1, gossip_post_2)
  end
end
