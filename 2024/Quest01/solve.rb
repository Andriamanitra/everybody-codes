def part1(s)
  counts = s.chars.tally
  counts.fetch('B', 0) + 3 * counts.fetch('C', 0)
end

def part2(s)
  pairs = s.scan(/..?/)
  pairs.sum do |s|
    potions_required = s.count('B') + 3 * s.count('C') + 5 * s.count('D')
    together_bonus = s.count("ABCD") > 1 ? 2 : 0
    potions_required + together_bonus
  end
end

def part3(s)
  trios = s.scan(/..?.?/)
  potions_required = trios.sum do |s|
    potions_required = s.count('B') + 3 * s.count('C') + 5 * s.count('D')
    together_bonus =
      case s.count("ABCD")
        when 2 then 2
        when 3 then 6
        else 0
      end
    potions_required + together_bonus
  end
end
