require_relative 'livro'
require_relative 'revista'
require_relative 'ebook'
require_relative 'estoque'

# module Conversor
#     def string_para_alfanumerico(livro)
#         livro.gsub /[^\w\s]/, ''
#     end

#     def precos_formatados(precos)
#         precos.map{|preco| 
#             preco_formatador = "R$#{preco.to_s.gsub('.',',')}"
#             preco_formatador << '0' unless preco_formatador.match /(.*)(\d{2})$/
#             preco_formatador
#         }
#     end
# end

# rails = Livro.new(70.00, 'Agile Web Development with Rails', 2011, false)

# ruby = Livro.new(60.00, 'Programming Ruby 1.9', 2010, false)

# livros = [rails, ruby]

# def imprime_nota_fical(livros)
#     livros.each do |livro|
#         puts "Título: #{livro.titulo} - #{livro.preco}"
#     end
# end

# imprime_nota_fical(livros)

def newsletter(livro)
    if livro.ano_lancamento < 2000
        puts "Newsletter/Liquidação"
        puts livro.titulo
        puts livro.preco
    end
end

# algoritmos = Livro.new('Algoritmos', 100, 1998, true)

# newsletter(algoritmos)

# arquitetura = Livro.new('Introdução À Arquitetura e Design de Software', 70, 2011, true)
# programmer = Livro.new('The Pragmatic Programmer', 100, 1999, true)
# ruby = Livro.new('Programming Ruby', 100, 2004, true)

# estoque = Estoque.new

# estoque << algoritmos
# p estoque.maximo_necessario
# estoque << arquitetura
# p estoque.maximo_necessario
# estoque << programmer
# p estoque.maximo_necessario
# estoque << ruby
# p estoque.maximo_necessario
# estoque.livros << nil

# estoque.remove algoritmos
# p estoque.maximo_necessario

# estoque.exportar_csv
# estoque.total

# baratos = estoque.mais_barato_que 80

# baratos.each do |livro|
#     puts livro.titulo
# end

# livros_computacao = ["Agile Web Development with Rails",
#     "Domain Driven Design",
#     "Programming Ruby 1.9",
#     "Agile Web Development with Rails"]

# def livros_computacao.length 
#     unique = []
#     self.each do |item|
#         unique.push(item) unless unique.include?(item)
#     end
#     unique.length
# end

# puts livros_computacao.length

algoritmos = Livro.new("Algoritmos", 100, 1998, true, true, "editora")
arquitetura = Livro.new("Introdução À Arquitetura e Design de Software", 70, 2011, true, true, "editora")
programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true, true, "editora")
ruby = Livro.new("Programming Ruby", 100, 2004, true, true, "")
revistona = Revista.new("Revista de Ruby 3", 10, 2012, true, 3, "Revistas")
ebook_arquitetura = EBook.new("Introdução À Arquitetura e Design de Software", 70, 2011, "editora")

estoque = Estoque.new

estoque << algoritmos << algoritmos << arquitetura << programmer << ruby << ruby << ruby << revistona << revistona << ebook_arquitetura << ebook_arquitetura
estoque.vende ruby
# estoque.vende ruby
# estoque.vende ruby
estoque.vende algoritmos
estoque.vende algoritmos
estoque.vende revistona
estoque.vende ebook_arquitetura
p estoque.livro_que_mais_vendeu_por_titulo.titulo
p estoque.revista_que_mais_vendeu_por_titulo.titulo
p estoque.ebook_que_mais_vendeu_por_titulo.titulo
p estoque.respond_to? :ebook_que_mais_vendeu_por_titulo