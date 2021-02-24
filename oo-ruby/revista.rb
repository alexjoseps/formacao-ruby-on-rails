require_relative 'produto'

class Revista < Produto

    def initialize(titulo, preco, ano_lancamento, possui_reimpressao, numero, editora)
        super(titulo, preco, ano_lancamento, editora)
        @possui_reimpressao = possui_reimpressao
        @numero = numero
    end

    def matches?(query)
        %w[revista impresso].include? query
    end

    def possui_reimpressao?
        @possui_reimpressao
    end
end
