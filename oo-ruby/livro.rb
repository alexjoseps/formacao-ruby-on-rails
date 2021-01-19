class Livro
    attr_reader :titulo, :preco, :ano_lancamento

    def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
      @titulo = titulo
      @ano_lancamento = ano_lancamento
      @possui_reimpressao = possui_reimpressao
      @preco = calcula_preco(preco)
    end

    def possui_reimpressao?
        @possui_reimpressao
    end

    def to_csv
        "#{@titulo}, #{@ano_lancamento}, #{@preco}"
    end

    private

    def calcula_preco(preco)
        if @ano_lancamento < 2006
            if @possui_reimpressao
                preco * 0.90
            else
                preco * 0.95
            end
        elsif @ano_lancamento <= 2010
            preco * 0.96
        else
            preco
        end
    end
end

module Contador
    def << (livro)
      push (livro)
      if @maximo_necessario.nil? || @maximo_necessario < size
        @maximo_necessario = size
      end
      self
    end
  
    attr_reader :maximo_necessario
end

module Conversor
    def string_para_alfanumerico(livro)
        livro.gsub /[^\w\s]/, ''
    end

    def precos_formatados(precos)
        precos.map{|preco| 
            preco_formatador = "R$#{preco.to_s.gsub('.',',')}"
            preco_formatador << '0' unless preco_formatador.match /(.*)(\d{2})$/
            preco_formatador
        }
    end
end


class Estoque
    attr_reader :livros

    def initialize
        @livros = []
        @livros.extend Contador
    end

    def exportar_csv
        @livros.each do |livro|
            puts livro.to_csv
        end
    end

    def mais_barato_que(valor)
        @livros.select do |livro|
            livro.preco <= valor 
        end
    end

    def total
        puts  "Total de livros: #{@livros.size}"
    end

    def <<(livro)
        @livros << livro if livro
        self
    end

    def remove(livro)
        @livros.delete livro
    end

    def maximo_necessario
        @livros.maximo_necessario
    end
end

# rails = Livro.new(70.00, 'Agile Web Development with Rails', 2011, false)

# ruby = Livro.new(60.00, 'Programming Ruby 1.9', 2010, false)

# livros = [rails, ruby]

# def imprime_nota_fical(livros)
#     livros.each do |livro|
#         puts "Título: #{livro.titulo} - #{livro.preco}"
#     end
# end

# imprime_nota_fical(livros)

# def newsletter(livro)
#     if livro.ano_lancamento < 1999
#         puts "Newsletter/Liquidação"
#         puts livro.titulo
#         puts livro.preco
#     end
# end

algoritmos = Livro.new('Algoritmos', 100, 1998, true)

# newsletter(algoritmos)

arquitetura = Livro.new('Introdução À Arquitetura e Design de Software', 70, 2011, true)
programmer = Livro.new('The Pragmatic Programmer', 100, 1999, true)
ruby = Livro.new('Programming Ruby', 100, 2004, true)

estoque = Estoque.new

estoque << algoritmos
p estoque.maximo_necessario
estoque << arquitetura
p estoque.maximo_necessario
estoque << programmer
p estoque.maximo_necessario
estoque << ruby
p estoque.maximo_necessario
# estoque.livros << nil

estoque.remove algoritmos
p estoque.maximo_necessario

# estoque.exportar_csv
# estoque.total

# baratos = estoque.mais_barato_que 80

# baratos.each do |livro|
#     puts livro.titulo
# end


livros_computacao = ["Agile Web Development with Rails",
    "Domain Driven Design",
    "Programming Ruby 1.9",
    "Agile Web Development with Rails"]

def livros_computacao.length 
    unique = []
    self.each do |item|
        unique.push(item) unless unique.include?(item)
    end
    unique.length
end

puts livros_computacao.length