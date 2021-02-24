require_relative 'produto'

class EBook < Produto

    def matches?(query)
        %w[ebook digital].include? query
    end
end
