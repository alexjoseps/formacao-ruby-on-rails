def dar_boas_vindas
    puts "Bem vindo ao jogo da forca"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    nome
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

def pede_um_chute(chutes, erros)
    puts "\n\n\n\n"
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes.join(', ')}"
    puts "Informe uma letra ou palavra: "
    chute = gets.strip
    puts "Será que acertou?! Você chutou #{chute}"
    chute
end

def joga(nome)
    palavra_secreta = sortei_palavra_secreta

    erros = 0
    chutes = []
    pontos = 0

    while erros < 5
         chute = pede_um_chute chutes, erros
         
         if chutes.include? chute
            puts "Você já chutou #{chute}"
            next
         end

         chutes << chute

         chutou_uma_letra = chute.size == 1
         if chutou_uma_letra
            total_encontrado = palavra_secreta.count(chute)

            if total_encontrado == 0
                puts "Letra não encontrada"
                erros += 1
            else
                puts "Letra encontrada #{total_encontrado} vezes"
            end
         else
           acertou = chute == palavra_secreta
           if acertou
                puts "Parabéns! Acertou!"
                pontos += 100
                break
           else
                puts "Que pena... errou!"
                pontos -= 30
                erros += 1
           end
         end
    end

    puts "Você ganhou #{pontos} pontos"
end

nome = dar_boas_vindas

loop do
    joga nome

    break if nao_quer_jogar?
end