def dar_boas_vindas
    puts
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                              "
    puts
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n \n \n \n"
    puts "Começaremos o jogo para você, #{nome}"
    nome
end

def pede_dificuldade
    puts "Qual o nível de dificuldade que deseja?"
    puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Muito difícil"
    puts "Escolha: "
    dificuldade = gets.to_i
end

def sortear_numero_secreto(dificuldade)
    maximo = case dificuldade 
             when 1
                30
             when 2
                60
             when 3
                100
             when 4
                150
             else
                200
             end

    puts "Escolhendo um número sereto entre 1 e #{maximo}..."
    sorteado = (rand * maximo).to_i
    puts "Escolhido... que tal adivinhar o nosso número secreto?!"
    sorteado
end

def solicita_um_numero(chutes, tentativa, limite_tentativas)
    puts "\n \n \n \n"

    puts "Tentativa #{tentativa} de #{limite_tentativas}"
    puts "Chutes até agora: #{chutes.join(', ')}"
    puts "Informe um número"
    chute = gets
    puts "Será que acertou?! Você chutou #{chute}"
    chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
    acertou = numero_secreto == chute

    if acertou
        ganhou
        return true
    end

    chute_maior = numero_secreto > chute
    if chute_maior
        puts "Número secreto é maior"
    else
        puts "Número secreto é menor"
    end
    false
end

def ganhou
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
end

def jogar nome, dificuldade
    numero_secreto = sortear_numero_secreto dificuldade
    pontos = 1000
    limite_tentativas = 5
    historico_chutes = []

    for tentativa in 1..limite_tentativas
        chute = solicita_um_numero historico_chutes, tentativa, limite_tentativas

        if nome == "Alex"
            ganhou
            break
        end

        pontos_perdidos = (chute - numero_secreto).abs / 2.0
        pontos  -= pontos_perdidos
        
        historico_chutes << chute

        break if verifica_se_acertou numero_secreto, chute
    end

    puts "Você ganhou #{pontos} pontos"
end

def nao_quer_jogar?
    puts "Deseja jogar novamente? (S/N)"
    nao_quero = gets.strip.downcase
    nao_quero == 'n' || nao_quero == 'não' || nao_quero == 'nao'
end


nome = dar_boas_vindas
dificuldade = pede_dificuldade

loop do
    jogar nome, dificuldade
    break if nao_quer_jogar?
end

# Entrada e saída de dados, string, concatenação e variáveis
# Comparação e boolean, conversão to_i e atribuição de valores
# Code smell: números mágicos, condições com nomes que fazem sentido, refatoração, copy/paste
# Execução de código condicional
# Execução de laços de repetição
# Extração de código, isolando/encapsulando comportamentos em funções
