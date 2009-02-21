class OldMcdonald
  attr_reader :song
  
  def initialize
    @song = ""
  end
  
  def e(chain="")
    @song += "e"
    self
  end
   
  def i(chain="")
    @song += "i"
    self
  end

  def o
    @song += "o"
  end

  def chained
    e.i.e.i.o
  end

  def nested
    e(i(e(i(o))))  
  end

end