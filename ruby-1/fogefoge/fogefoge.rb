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
    case direcao
    when 'W'
        heroi[0] -= 1
    when 'S'
        heroi[0] += 1
    when 'A'
        heroi[1] -= 1
    when 'D'
        heroi[1] += 1
    end
    heroi
end

def posicao_invalida?(mapa, posicao)
    linhas = mapa.size
    colunas = mapa[0].size
    ultrapassou_limite_linhas = posicao[0] < 0 || posicao[0] >= linhas
    ultrapassou_limite_colunas = posicao[1] < 0 || posicao[1] >= colunas
    atingiu_uma_parade = mapa[posicao[0]][posicao[1]] == 'X'

    ultrapassou_limite_linhas || ultrapassou_limite_colunas || atingiu_uma_parade
end

def joga(nome)
    mapa = ler_mapa 1

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
    end
end

def inicia_fogefoge
    nome = da_boas_vindas
    joga nome
end