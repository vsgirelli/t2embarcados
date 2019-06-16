# estrutura dos dados
struct Result
	class   :: String
	threads :: Int
	seconds :: Float64
	energy  :: Float64
end

# informações extraídas
t = " Number of available threads:"
s = "Tempo de execucao em segundos:"
e = "Energia consumida em Joules:"

# resultados por classe
A = []
B = []
C = []

# parse de cada arquivo .out
function parse_result_file(filename, class)
	out_result = []

    threads::Int = 0
    seconds::Float64 = 0.0
    energy::Float64 = 0.0

    file = open(filename)
	lines = readlines(file)

	for line in lines
		if startswith(line, t)
			threads = parse(Int, last(split(line, " ")))
		elseif startswith(line, s)
			seconds = parse(Float64, last(split(line, " ")))
		elseif startswith(line, e)
			energy = parse(Float64, last(split(line, " ")))
			push!(out_result, Result(class, threads, seconds, energy))
		end
	end

	return out_result
end

# caminha por todos arquivos na pasta 'slrum' dentro do repositório do trabalho,
# escolhe apenas os .out e pelo nome do arquivo já define a classe dele 
filenames = readdir()
for fname in filenames
	if endswith(fname, "out")
		class = split(fname, ".")[2]	
		if class == "A"
			append!(A, parse_result_file(fname, class))
		elseif class == "B"
			append!(B, parse_result_file(fname, class))
		elseif class == "C"
			append!(C, parse_result_file(fname, class))
		end
	end
end

# cria o .csv da classe A
new_file = "A_results.csv"
open(new_file, "w") do f
	write(f, "CLASS, THREADS, SECONDS, ENERGY\n")

	for a in A
		write(f, "$(a.class), $(a.threads), $(a.seconds), $(a.energy)\n")
	end
end

# cria o .csv da classe B
new_file = "B_results.csv"
open(new_file, "w") do f
	write(f, "CLASS, THREADS, SECONDS, ENERGY\n")

	for b in B
		write(f, "$(b.class), $(b.threads), $(b.seconds), $(b.energy)\n")
	end
end

# cria o .csv da classe C
new_file = "C_results.csv"
open(new_file, "w") do f
	write(f, "CLASS, THREADS, SECONDS, ENERGY\n")

	for c in C
		write(f, "$(c.class), $(c.threads), $(c.seconds), $(c.energy)\n")
	end
end

# cria o .csv de todas as classes
new_file = "ALL_results.csv"
open(new_file, "w") do f
	write(f, "CLASS, THREADS, SECONDS, ENERGY\n")

	for a in A
		write(f, "$(a.class), $(a.threads), $(a.seconds), $(a.energy)\n")
	end
	for b in B
		write(f, "$(b.class), $(b.threads), $(b.seconds), $(b.energy)\n")
	end
	for c in C
		write(f, "$(c.class), $(c.threads), $(c.seconds), $(c.energy)\n")
	end
end

# println(A)
# println(B)
# println(C)









