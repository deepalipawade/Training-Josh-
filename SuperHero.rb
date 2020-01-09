
module SuperPower

  def test_power power
    #puts power , power.class
    #puts @super_power ,@super_power.class
    if @super_power == power
      puts "\tcan #{power} ? : Yes"
      return true
    else
      puts "\tcan #{power} ? : No"
      return false
    end
  end
  
  def show_superhero
    puts "\n\n\t----#{@superhero_name} : #{@super_power}----\n\n"
  end
end

class SuperHero
  attr_reader :superhero_name , :super_power
  include SuperPower 
  
  def initialize superhero_name , super_power
    @super_power = super_power
    @superhero_name = superhero_name
  end
  
end


#testing powers
#spiderman's power is jump which is passed through constructor
spiderman = SuperHero.new("Spiderman" , "jump")
superman.show_superhero()
# passing wrong power to function for testing
spiderman.test_power("fly")
spiderman.test_power("run")
spiderman.test_power("jump")


shaktiman = SuperHero.new("Shaktiman","fly")
shaktiman.show_superhero()
shaktiman.test_power("run")
shaktiman.test_power("fly")
shaktiman.test_power("jump")


flash = SuperHero.new("Flash","run")
flash.show_superhero()
flash.test_power("run")
flash.test_power("fly")
flash.test_power("jump")
