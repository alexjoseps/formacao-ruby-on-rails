class Livro
    attr_reader :titulo, :preco, :ano_lancamento

    def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
      @titulo = titulo
      @ano_lancamento = ano_lancamento
      @preco = calcula_preco(preco)
      @possui_reimpressao = possui_reimpressao
    end

    def possui_reimpressao?
        @possui_reimpressao
    end

    private

    def calcula_preco(base)
        if @ano_lancamento < 2000
            base * 0.7
        else
            base
        end
    end
end

rails = Livro.new(70.00, 'Agile Web Development with Rails', 2011, false)

ruby = Livro.new(60.00, 'Programming Ruby 1.9', 2010, false)

livros = [rails, ruby]

def imprime_nota_fical(livros)
    livros.each do |livro|
        puts "Título: #{livro.titulo} - #{livro.preco}"
    end
end

imprime_nota_fical(livros)

def newsletter(livro)
    if livro.ano_lancamento < 1999
        puts "Newsletter/Liquidação"
        puts livro.titulo
        puts livro.preco
    end
end

algoritmos = Livro.new('Algoritmos', 100, 1998, true)
newsletter(algoritmos)