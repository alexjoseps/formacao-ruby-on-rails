require_relative 'ui'
require_relative 'rank'

def joga(nome)
    palavra_secreta = sorteia_palavra_secreta

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
    pontos
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

def sorteia_palavra_secreta
    avisa_escolhendo_palavra
    texto = File.read("dicionario.txt")
    todas_as_palavras = texto.split("\n")
    numero_aleatorio = rand(todas_as_palavras.size)
    palavra_secreta = todas_as_palavras[numero_aleatorio].downcase
    avisa_palavra_escolhida palavra_secreta
    palavra_secreta
end

def jogo_da_forca
    nome = dar_boas_vindas
    pontos_totais = 0

    campeao_atual = ler_rank

    if campeao_atual.any?
        avisa_campeao_atual campeao_atual
    end

    loop do
        pontos_totais += joga nome
        avisa_pontos_totais pontos_totais

        if campeao_atual[1].to_i < pontos_totais
            salvar_rank nome, pontos_totais
        end

        break if nao_quer_jogar?
    end
end