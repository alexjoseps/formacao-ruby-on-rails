class Heroi 
    attr_accessor :linha, :coluna

    def definir_nova_posicao(direcao)
        novo_heroi = self.dup
        movimentos = {
            "W" => [-1, 0],
            "S" => [+1, 0],
            "A" => [0, -1],
            "D" => [0, +1]
        }
        movimento = movimentos[direcao]
    
        return novo_heroi if movimento.nil?
    
        novo_heroi.linha += movimento[0]
        novo_heroi.coluna += movimento[1]
        novo_heroi
    end

    def to_array
        [linha, coluna]
    end

    def adiciona_no(mapa)
        mapa[linha][coluna] = 'H'
    end

    def remove_do(mapa)
        mapa[linha][coluna] = ' '
    end
end