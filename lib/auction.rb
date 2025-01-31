class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items.push(item)
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

 def unpopular_items
    @items.map do |item|
      if item.bids.empty?
        item
      end
    end.compact
  end

  def potential_revenue
    highest_bids = []
    @items.each do |item|
      highest_bids << item.bids.values.max
    end
    highest_bids.compact.sum
  end

  def bidders
    highest_bidders = []
    @items.each do |item| 
      item.bids.find_all do |attendee, bid_amount|
      bid_amount > 0
      highest_bidders.push(attendee)
      end
    end
    highest_bidders.uniq
  end

  def bidder_info
    bidder_info_hash = Hash.new 
    @items.each do |item|
      item.bids.each do |attendee, bid_amount|
        bidder_info_hash[attendee] = {}
      end
      bidder_info_hash.keys.each do |attendee_key|
        bidder_info_hash[attendee] 
        require 'pry'; binding.pry
        end
      end
    end
    

  end

end