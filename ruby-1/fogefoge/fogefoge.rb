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
    valor_posicao = mapa[posicao[0]][posicao[1]]
    atingiu_parede = valor_posicao == 'X'
    atingiu_fantasma = valor_posicao == 'F'

    ultrapassou_limites = ultrapassou_limite_linhas || ultrapassou_limite_colunas

    ultrapassou_limites || atingiu_parede || atingiu_fantasma
end

def movimentar_fantasmas(mapa)
    fantasma = 'F'
    mapa.each_with_index { |linha_atual, linha|
        linha_atual.chars.each_with_index {|caracter, coluna|
            eh_fantamas = caracter == fantasma
            if eh_fantamas
                move_fantasma mapa, linha, coluna
            end
        }
    }
end

def move_fantasma(mapa, linha, coluna)
    posicao = [linha, coluna+1]

    return if posicao_invalida? mapa, posicao

    mapa[linha][coluna] = ' '
    mapa[posicao[0]][posicao[1]] = 'F'
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

        movimentar_fantasmas mapa
    end
end

def inicia_fogefoge
    nome = da_boas_vindas
    joga nome
end