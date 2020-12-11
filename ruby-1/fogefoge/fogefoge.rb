require_relative 'ui'

def ler_mapa(numero)
    arquivo = "mapas/mapa#{numero}.txt"
    texto = File.read arquivo
    mapa = texto.split "\n"
end

def encontrar_heroi(mapa)
    heroi = 'H'

    mapa.each_with_index do |linha_atual, linha|
        coluna_do_heroi = linha_atual.index heroi
        if coluna_do_heroi
            return [linha, coluna_do_heroi]
        end
    end

    return nil
end

def definir_nova_posicao(heroi, direcao)
    heroi = heroi.dup
    movimentos = {
        "W" => [-1, 0],
        "S" => [+1, 0],
        "A" => [0, -1],
        "D" => [0, +1]
    }
    movimento = movimentos[direcao]

    return heroi if movimento.nil?

    heroi[0] += movimento[0]
    heroi[1] += movimento[1]
    heroi
end

def posicao_invalida?(mapa, posicao)
    linhas = mapa.size
    colunas = mapa[0].size
    ultrapassou_limite_linhas = posicao[0] < 0 || posicao[0] >= linhas
    ultrapassou_limite_colunas = posicao[1] < 0 || posicao[1] >= colunas

    return true if ultrapassou_limite_linhas || ultrapassou_limite_colunas

    valor_posicao = mapa[posicao[0]][posicao[1]]
    atingiu_parede = valor_posicao == 'X'
    atingiu_fantasma = valor_posicao == 'F'

    return true if atingiu_parede || atingiu_fantasma
end

def movimentar_fantasmas(mapa)
    fantasma = 'F'
    novo_mapa = copia_mapa mapa
    mapa.each_with_index { |linha_atual, linha|
        linha_atual.chars.each_with_index {|caracter, coluna|
            eh_fantamas = caracter == fantasma
            if eh_fantamas
                move_fantasma mapa, novo_mapa, linha, coluna
            end
        }
    }
    novo_mapa
end

def move_fantasma(mapa, novo_mapa, linha, coluna)
    posicoes = posicoes_validas_a_partir_de mapa, novo_mapa, [linha, coluna]

    return if posicoes.empty?

    aletorio = rand posicoes.size
    posicao = posicoes[aletorio]

    mapa[linha][coluna] = ' '
    novo_mapa[posicao[0]][posicao[1]] = 'F'
end

def soma(vetor1, vetor2)
    [vetor1[0] + vetor2[0], vetor1[1] + vetor2[1]]
end

def posicoes_validas_a_partir_de(mapa, novo_mapa, posicao)
    posicoes = []
    movimentos = [[-1, 0], [0, +1], [+1, 0], [0, -1]]
    movimentos.each {|movimento|
        nova_posicao = soma posicao, movimento
        posicoes << nova_posicao unless posicao_invalida?(mapa, nova_posicao) && posicao_invalida?(novo_mapa, nova_posicao)
    }
    posicoes
end

def copia_mapa(mapa)
    novo_mapa = mapa.join('\n').tr('F', ' ').split('\n')
end

def joga(nome)
    mapa = ler_mapa 2

    while true
        desenha mapa
        direcao = pede_direcao
        heroi = encontrar_heroi mapa
        nova_posicao = definir_nova_posicao heroi, direcao

        if posicao_invalida? mapa, nova_posicao
            puts "Não é permitido se movimentar nessa direção"
            next
        end

        puts "Antes: #{heroi}"
        puts "Depois: #{nova_posicao}"

        mapa[heroi[0]][heroi[1]] = ' '
        mapa[nova_posicao[0]][nova_posicao[1]] = 'H'

        mapa = movimentar_fantasmas mapa

        nao_encontrou_heroi = encontrar_heroi(mapa).nil?
        if nao_encontrou_heroi
            fim_de_jogo
            break
        end
    end
end

def inicia_fogefoge
    nome = da_boas_vindas
    joga nome
end