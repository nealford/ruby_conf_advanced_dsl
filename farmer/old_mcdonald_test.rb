require "test/unit"

require "old_mcdonald"

class TestOldMcdonald < Test::Unit::TestCase
  
  def setup
    @farmer = OldMcdonald.new
  end
  
  def test_chained
    @farmer.chained
    assert_equal "eieio", @farmer.song
    
  end             
  
  def test_nested
    @farmer.nested
    assert_equal "oieie", @farmer.song
  end
end