ops = [   :-, :*,
        :*, :*,  :*,
          :*, :-,
        :-, :+,  :+,
          :+, :*
      ]

results = [         30,
                    29,
                    12,
          27,  21,  20]

numbers = [1,2,2,3,4,5,6,7,8]

def go_figure(nums, operators, answers)
  nums.permutation.each do |i|
    if i[0].send(operators[0], i[1]).send(operators[1], i[2]) == answers[0]
      if i[3].send(operators[5], i[4]).send(operators[6], i[5]) == answers[1]
        if i[6].send(operators[10], i[7]).send(operators[11], i[8]) == answers[2]
          if i[0].send(operators[2], i[3]).send(operators[7], i[6]) == answers[3]
            if i[1].send(operators[3], i[4]).send(operators[8], i[7]) == answers[4]
              if i[2].send(operators[4], i[5]).send(operators[9], i[8]) == answers[5]
                p i[0..2]
                p i[3..5]
                p i[6..8]
                p ' '
              end
            end
          end
        end
      end
    end
  end
end

go_figure(numbers, ops, results)
