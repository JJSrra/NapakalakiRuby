# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki
  class DeathBadConsequence < NumericBadConsequence
    def initialize(text)
      super(text, Player.MAXLEVEL, @@MAXTREASURES, @@MAXTREASURES)
    end
    
    def to_s
      "#{@text}\n"
    end
  end
end
