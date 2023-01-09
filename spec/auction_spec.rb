require './lib/auction'
require './lib/item'
require './lib/attendee'

RSpec.describe do 
  let(:auction) { Auction.new }

  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }
  let(:item3) { Item.new('Homemade Chocolate Chip Cookies') }
  let(:item4) { Item.new('2 Days Dogsitting') }
  let(:item5) { Item.new('Forever Stamps') }

  let(:attendee1) { Attendee.new(name: 'Megan', budget: '$50') }
  let(:attendee2) { Attendee.new(name: 'Bob', budget: '$75') }
  let(:attendee3) { Attendee.new(name: 'Mike', budget: '$100') }


  describe '#initialize' do 
    it 'exists' do 
      expect(auction).to be_a(Auction)
    end

    it 'has attributes' do 
      expect(auction.items).to eq([])
    end
  end

  describe '#add_items' do 
    it 'adds items to items array' do
      auction.add_item(item1)
      auction.add_item(item2)
    
      expect(auction.items).to eq([item1, item2])
    end
  end

  describe '#item_names' do 
    it 'returns an array with names of items from the items array' do 
      auction.add_item(item1)
      auction.add_item(item2)

      expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end

  describe '#add_bid' do
     it 'starts with no bids' do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      expect(item1.bids).to eq({})
    end
    it 'can add bids' do 
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22) 

      expected = { attendee2 => 20,
                   attendee1 => 22
                  }

      expect(item1.bids).to eq(expected)
    end
  end

  describe '#current_high_bid' do 
    it 'returns the highest bid on an item' do 
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      
      expect(item1.current_high_bid).to eq(22)
    end
  end

  describe '#unpopular_items' do 
    it 'returns a list of items that have no bids' do 
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)

      expect(auction.unpopular_items).to eq([item2, item3, item5])

      item3.add_bid(attendee2, 15)  
      
      expect(auction.unpopular_items).to eq([item2, item5])
    end
  end

  describe '#potential_revenue' do 
    it 'calculates potential revenue' do 
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)

      expect(auction.potential_revenue).to eq(87)
    end
  end

  describe '#bidders' do 
    it 'returns an array of attendees who have placed a bid in the auction' do 
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)

      expect(auction.bidders).to eq([attendee2,attendee1, attendee3])
    end
  end
  
  describe '#bidder_info' do 
    it "returns a hash with keys that are attendees and values taht are a hash with attendees budget and array of items attendee has bid on" do 
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)

      expected = {attendee2 => {:budget => 75,
                                :items => [item1, item2]},
                  attendee1 => {:budget => 50,
                                :items => [item1]},
                  attendee3 => {:budget => 50,
                                :items => [item4]}}
      expect(auction.bidder_info).to eq(expected)
    end
  end
end