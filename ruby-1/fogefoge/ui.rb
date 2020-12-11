def da_boas_vindas
    puts "Bem vindo ao Foge-Foge"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    nome
end

def pede_direcao
    puts "Para onde deseja ir?"
    direcao = gets.strip
end

def desenha(mapa)
    puts mapa
end

def fim_de_jogo
    puts "\n\n\n\n"
    puts "Você perdeu o jogo"
end