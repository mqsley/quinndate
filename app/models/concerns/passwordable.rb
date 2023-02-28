module Passwordable
  def generate_random_string
    SecureRandom.hex(10)
  end
end
