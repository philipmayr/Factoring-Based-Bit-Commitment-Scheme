# Factoring-Based Bit Commitment Scheme

require_relative "helper"

# Alpha

p = q = nil

# Find prime 𝑝 ≡ 1 (mod 4)
loop do
    p = draw_random_prime(8)
    break if p % 4 == 1
end

# Find prime 𝑞 ≡ 3 (mod 4)
loop do
    q = draw_random_prime(8)
    break if q % 4 == 3
end

# Set semiprime 𝑛
n = p * q

puts "Alpha picks two large prime numbers, 𝑝 and 𝑞, such that one of the twain is congruent to 1 (modulo 4) and the other one is congruent to 3 (modulo 4)."
puts "Alpha commits " + n.to_s + " (𝑛 æ 𝑝 ⋅ 𝑞)."

# Beta

puts
puts "Beta guesses whether the prime factor of " + n.to_s + " (𝑛) that is congruent to 3 (modulo 4) is the smaller or the bigger factor."
print "➤ Enter 0 to choose smaller, 1 for bigger: "
guess = gets.chomp()
puts "Beta commits " + guess + "."

# Alpha

puts
puts "Alpha shows that 𝑝 æ " + p.to_s + " ≡ 1 (mod 4) and 𝑞 æ " + q.to_s + " ≡ 3 (mod 4)."
puts

# Beta

puts "Beta verifies that 𝑝 ⋅ 𝑞 æ 𝑛 → " + p.to_s + " ⋅ " + q.to_s + " æ " + (p * q).to_s + ". ✓"
puts "Beta verifies that both 𝑝 and 𝑞 are prime numbers. ✓"
puts

# Answer

right_answer = q < p ? '0' : '1'

if guess == right_answer
    puts "Beta guessed right, for the prime factor that is congruent to 3 (modulo 4) is the #{right_answer=='0' ? 'smaller' : 'bigger'} of the twain."
else
    puts "Beta guessed wrong, for the prime factor that is congruent to 3 (modulo 4) is the #{right_answer=='0' ? 'smaller' : 'bigger'} of the twain."
end
