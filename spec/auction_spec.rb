require './lib/auction'

RSpec.describe do 
let(:auction) { Auction.new }
  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }

  describe '#initialize' do 
    it 'exists' do 
      expect(auction).to be_a(Auction)
    end

    it 'has attributes' do 
      expect(auction.items).to eq([])
    end
  end

  describe '#add_items' do 
    auction.add_item(item1)
    auction.add_item(item2)
    
    expect(auction.items).to eq([item1, item2])
  end
end