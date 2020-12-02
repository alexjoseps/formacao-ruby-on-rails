# Operadores comparativos
puts 175 == 175
puts 175 == 174
puts "175" == 175
puts "175" == "175"
puts "175" == "175".to_i

puts 175 != 174
puts 175 != 175

puts 175 > 174
puts 175 >= 175
puts 175 < 176
puts 175 <= 175

# Loop for
for dedo in 1..3
    puts "Contando " + dedo.to_s
end

# Array
chutes = [176, 100, 130, 150, 175]
chutes[3] = 300

puts chutes.size
for chute in chutes
    puts chute
end

# Interpolação de string
nome = gets.strip
puts nome + " tem " + nome.size.to_s + " caracteres"
puts "#{nome} tem #{nome.size} caracteres"

# Operadores aritméticos
treze = 13
cinco = 5
puts treze / cinco
puts treze % cinco
puts treze + cinco
puts treze - cinco
puts treze * cinco

numero = 5
puts numero += 1
puts numero -= 2
puts numero *= 2
puts numero /= 4
puts numero %= 10

# Números binários
# 0 => 0000 0000
# 1 => 0000 0001
# 2 => 0000 0010
# 3 => 0000 0011
# 4 => 0000 0100
# 5 => 0000 0101
# 6 => 0000 0110
# 7 => 0000 0111
# 8 => 0000 1000
# 9 => 0000 1001
# 10 => 0000 1010
# 11 => 0000 1011
# 12 => 0000 1100
# 13 => 0000 1101
# 14 => 0000 1110
# 15 => 0000 1111

# BINÁRIO => DECIMAL => HEXADECIMAL
# 01 => 0123456789 => 0..9ABCDEF
# ALGARISMOS
# 2 => 8 => 10 => 16

# A => 65 => 0100 0001
# B => 66 => 0100 0010
# ...
# Z => 90 => 0101 1010
# 8 bits => 1 byte => 256

# 1 / 3.0 => 0.333
# 00000000 00000011 00000011 00000011 