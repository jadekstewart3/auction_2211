require './lib/attendee'

RSpec.describe do 

  let(:attendee) { Attendee.new('Megan', '$50') }
  
  describe '#initialization' do 
    it 'exists' do 
      expect(attendee).to be_a(Attendee)
    end

    it 'has attributes' do 
      expect(attendee.name).to eq("Megan")
      expect(attendee.budget).to eq('$50')
    end
  end
end