require_relative 'ui'

def joga(nome)
    palavra_secreta = sortei_palavra_secreta

    erros = 0
    chutes = []
    pontos = 0

    while erros < 5
        palavra_mascarada = gerar_palavra_mascarada palavra_secreta, chutes
        chute = pede_um_chute_valido  chutes, erros, palavra_mascarada

         chutes << chute

         chutou_uma_letra = chute.size == 1
         if chutou_uma_letra
            total_encontrado = palavra_secreta.count(chute)

            if total_encontrado == 0
                avisa_letra_nao_encontrada
                erros += 1
            else
                avisa_letra_encontrada total_encontrado
            end
         else
           acertou = chute == palavra_secreta
           if acertou
                avisa_acertou_palavra
                pontos += 100
                break
           else
                avisa_errou_palavra
                pontos -= 30
                erros += 1
           end
         end
    end

    avisa_quantidade_de_pontos pontos
end

def pede_um_chute_valido chutes, erros, palavra_mascarada
    cabecalho_de_tentativas chutes, erros, palavra_mascarada
    loop do
        chute = pede_um_chute
        if chutes.include? chute
            avisa_chute_repetido chute
        else
            return chute
         end
    end
end

def gerar_palavra_mascarada palavra_secreta, chutes
    palavra_mascarada = ""
    for letra in palavra_secreta.chars
        if chutes.include? letra
            palavra_mascarada += letra
        else
            palavra_mascarada += "_ "
        end
    end

    palavra_mascarada
end

def jogo_da_forca
    nome = dar_boas_vindas

    loop do
        joga nome

        break if nao_quer_jogar?
    end
end