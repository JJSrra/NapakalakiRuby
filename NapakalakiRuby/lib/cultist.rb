# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki
  class Cultist
    attr_reader :name, :gained_levels
    
    def initialize(name, gained_levels)
      @name = name
      @gained_levels = gained_levels
    end
  end
end
