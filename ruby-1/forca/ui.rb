def dar_boas_vindas
    puts "Bem vindo ao jogo da forca"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    nome
end

def cabecalho_de_tentativas chutes, erros, palavra_mascarada
    puts "\n\n\n\n"
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes.join(', ')}"
    puts "Palavra secreta: #{palavra_mascarada}"
end

def pede_um_chute
    puts "Informe uma letra ou palavra: "
    chute = gets.strip
    puts "Será que acertou?! Você chutou #{chute}"
    chute
end

def sortei_palavra_secreta
    puts "Escolhendo uma palavra..."
    palavra_secreta = "programador"
    puts "Escolhido uma palavra com #{palavra_secreta.size} letras"
    palavra_secreta
end

def nao_quer_jogar?
    puts "Deseja jogar novamente?"
    resposta = gets.strip
    nao_quero = resposta.downcase == 'n' || resposta.downcase == 'nao' || resposta.downcase == 'não'
end

def avisa_chute_repetido chute
    puts "Você já chutou #{chute}" 
end

def avisa_letra_nao_encontrada
    puts "Letra não encontrada"
end

def avisa_letra_encontrada total_encontrado
    puts "Letra encontrada #{total_encontrado} vezes"
end

def avisa_acertou_palavra
    puts "Parabéns! Acertou!"
end

def avisa_errou_palavra
    puts "Que pena... errou!"
end

def avisa_quantidade_de_pontos pontos
    puts "Você ganhou #{pontos} pontos"
end