class ArrayAnalyzer 
    def self.findHighestSumWithNestedLoops(array)
        verifyInput(array)

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

    
    # We need the two values that provide the highest sum, but they cannot be adjacent.
    # if we only get the two highest values, they might be adjacent
    # if we only get the three highest value, then the middle number might be large enough that the outer numbers do not exceed it
    # we should get the four highest values and store their indices. Then we can find the highest sum of those
    # that means O(n) to go through the array and find the four highest and O(1) to check the remaining four, and so O(n) total
    # will need to verify this through testing. Make some large arrays and compare nested v this
    def self.findHighestSumWithHighestValues(array)
        verifyInput(array)
        
        if (array.length == 2)
            return array
        end

        fourHighest = []
        fourHighest << 0
        for i in 1...array.length
            fourHighest = updateFourHighest(array, i, fourHighest)
        end

        maxSum = -1
        results = [-1,-1]
        for i in 0..1
            for j in i+1...fourHighest.length
                # if the absolute value of subtracting the indices is one, then these are adjacent
                if (fourHighest[i] - fourHighest[j]).abs == 1
                    next
                end
                newSum = array[fourHighest[i]] + array[fourHighest[j]]
                if (newSum > maxSum)
                    maxSum = newSum
                    results[0] = array[fourHighest[i]]
                    results[1] = array[fourHighest[j]]
                end
            end
        end
        return results
    end

    def self.updateFourHighest(array, i, fourHighest)
        # create a new array of the highest values (max of four) between the current array and this new value
        tempArray = []
        spaceFound = false
        for j in 0...fourHighest.length
            # if the current value from the array is greater than the current fourHighest indicies array value, then we add i to the tempArray
            if (array[i] >= array[fourHighest[j]])
                spaceFound = true
                tempArray << i
                # then we fill the temp array with the remaining values
                for k in j...fourHighest.length
                    tempArray << fourHighest[k]
                end
            else
                tempArray << fourHighest[j]
            end
        end
        if !spaceFound
            tempArray << i
        end
        # keep up to four
        if (tempArray.length > 4)
            return tempArray[0..3]
        else
            return tempArray.dup
        end
    end

    def self.verifyInput(array)
        if (array.length < 2)
            raise(ArgumentError, 'Invalid Array! Input array must contain two or more integers')
        end
    end
end