# Factoring-Based Bit Commitment Scheme

require "securerandom"
require "prime"

def draw_random_prime(bit_length=16)
    loop do
        random_bits = SecureRandom.random_number(2 ** bit_length)

        # Ensure the random number is both significantly large and odd
        bit_mask = (1 << (bit_length - 1)) | 1
        random_bits |= bit_mask

        return random_bits if Prime.prime?(random_bits)
    end
end
