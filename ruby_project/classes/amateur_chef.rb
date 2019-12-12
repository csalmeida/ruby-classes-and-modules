require_relative 'chef'

class AmateurChef < Chef
  def make_dinner
    puts "Read recipe"
    super
    puts "Clean up mess."
  end
end