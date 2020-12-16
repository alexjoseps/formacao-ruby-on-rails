def salvar_rank nome, pontos_totais
    conteudo = "#{nome}\n#{pontos_totais}"
    File.write "rank.txt", conteudo
end

def ler_rank
    conteudo_atual = File.read "rank.txt"
    dados = conteudo_atual.split("\n")
end