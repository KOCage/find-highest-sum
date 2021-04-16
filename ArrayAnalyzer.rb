class ArrayAnalyzer 
    def self.findHighestSum(array)
        if (array.length < 2)
            raise(ArgumentError, 'Invalid Array! Input array must contain two or more integers')
        end
        if (array.length == 2)
            return array
        end

        results = [2]
        sum = -1

        for i in 0...array.length - 2
            for j in (i+2)...array.length   
                thisSum = array[i] + array[j]
                if (thisSum > sum)
                    sum = thisSum
                    results[0] = array[i]
                    results[1] = array[j]
                end
            end
        end 
        return results
    end
end