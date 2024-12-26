#!/usr/bin/env julia

function part1(io=stdin)
    runic_words = split(chopprefix(readline(io), "WORDS:"), ",")
    readline(io)
    inscription = readline(io)

    sum(length, findall.(runic_words, inscription; overlap=true))
end

function part2(io=stdin)
    runic_words = split(chopprefix(readline(io), "WORDS:"), ",")
    append!(runic_words, reverse.(runic_words))
    readline(io)
    inscription = read(io, String)

    runic_symbol_locations = Set()
    for range in Iterators.flatmap(w -> findall(w, inscription; overlap=true), runic_words)
        push!(runic_symbol_locations, range...)
    end
    length(runic_symbol_locations)
end

function part3(io=stdin)
    runic_words = split(chopprefix(readline(io), "WORDS:"), ",")
    readline(io)
    inscription = readlines(io)

    CARDINAL_DIRECTIONS = (
        CartesianIndex(1, 0),
        CartesianIndex(0, 1),
        CartesianIndex(-1, 0),
        CartesianIndex(0, -1),
    )
    height = length(inscription)
    width = length(first(inscription))

    function wrapping(idx::CartesianIndex)
        r, c = Tuple(idx)
        CartesianIndex(r, mod1(c, width))
    end

    grid = Matrix{Char}(undef, height, width)
    for (i, row) in enumerate(inscription)
        for (j, ch) in enumerate(row)
            grid[i, j] = ch
        end
    end
    runic_symbol_locations = Set()
    for idx in CartesianIndices(grid)
        for word in runic_words
            for direction in CARDINAL_DIRECTIONS
                positions = [ch => wrapping(idx + (i - 1) * direction) for (i, ch) in enumerate(word)]
                if all(checkbounds(Bool, grid, idx) && grid[idx] == ch for (ch, idx) in positions)
                    push!(runic_symbol_locations, (idx for (ch, idx) in positions)...)
                end
            end
        end
    end
    length(runic_symbol_locations)
end

using Test
function run_tests()
    @testset "Examples" begin
        EXAMPLES = (
            part1 = IOBuffer(
                """
                WORDS:THE,OWE,MES,ROD,HER

                AWAKEN THE POWER ADORNED WITH THE FLAMES BRIGHT IRE
                """
            ),
            part2 = IOBuffer(
                """
                WORDS:THE,OWE,MES,ROD,HER,QAQ
                
                AWAKEN THE POWE ADORNED WITH THE FLAMES BRIGHT IRE
                THE FLAME SHIELDED THE HEART OF THE KINGS
                POWE PO WER P OWE R
                THERE IS THE END
                QAQAQ
                """
            ),
            part3 = IOBuffer(
                """
                WORDS:THE,OWE,MES,ROD,RODEO
                
                HELWORLT
                ENIGWDXL
                TRODEOAL
                """
            ),
        )

        @test part1(EXAMPLES.part1) == 4
        @test part2(EXAMPLES.part2) == 42
        @test part3(EXAMPLES.part3) == 10
    end
end

function (@main)(args)
    arg = get(args, 1, nothing)
    flags = Dict(
        "--test"  => run_tests,
        "--part1" => println ∘ part1,
        "--part2" => println ∘ part2,
        "--part3" => println ∘ part3,
    )
    func = get(flags, arg, nothing)

    if !isnothing(func)
        func()
        return
    end
    println("Usage: ./solve.jl [--test|--part1|--part2|--part3]")
end
