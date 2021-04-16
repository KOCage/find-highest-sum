require './ArrayAnalyzer'
require 'rspec'

RSpec.describe "An ArrayAnalyzer can" do 
    context 'When given an invalid array, raises argument error' do
        it 'Given an empty array' do
            testArray = []
            expect{ ArrayAnalyzer.findHighestSum(testArray) }
            .to raise_error('Invalid Array! Input array must contain two or more integers') 
        end
        it 'Given an array with only one integer' do
            testArray = [1]
            expect{ ArrayAnalyzer.findHighestSum(testArray) }
            .to raise_error('Invalid Array! Input array must contain two or more integers')
        end
    end
    context 'Given an array, it can find the two non-adjacent integers with the highest sum' do
        # Basic case: just two integers
        it "Given [1,2], expect [1,2]" do
            testArray = [1,2]
            expectedResult = [1,2]
            result = ArrayAnalyzer.findHighestSum(testArray)
            expect(result).to match(expectedResult)
        end
        # Basic case: more than two integers, but no duplicates
        it "Given [2,4,2,3,1], expect [4,3]" do
            testArray = [2,4,2,3,1]
            expectedResult = [4,3]
            result = ArrayAnalyzer.findHighestSum(testArray)
            expect(result).to match(expectedResult)
        end
        # Edge case: more than two integers, but duplicates 
        it "Given [1,10,11,11,12,1], expect [11,12]" do
            testArray = [1,10,11,11,12,1]
            expectedResult = [11,12]
            result = ArrayAnalyzer.findHighestSum(testArray)
            expect(result).to match(expectedResult)
        end
        # Edge case: more than two integers, the two largest integers are adjacent
        it "Given [3,6,5,1,1], expect [3,5]" do
            testArray = [3,6,5,1,1]
            expectedResult = [3,5]
            result = ArrayAnalyzer.findHighestSum(testArray)
            expect(result).to match(expectedResult)
        end
        # Edge case: more than two integers, duplicates that are the highest
        it "Given [1,2,6,6,6,2,1], expect [6,6]" do
            testArray = [1,2,6,6,6,2,1]
            expectedResult = [6,6]
            result = ArrayAnalyzer.findHighestSum(testArray)
            expect(result).to match(expectedResult)
        end
        # Edge case: more than two integers, and highest are the first and final integers
        it "Given [7,1,1,1,1,8], expect [7,8]" do
            testArray = [7,1,1,1,1,8]
            expectedResult = [7,8]
            result = ArrayAnalyzer.findHighestSum(testArray)
            expect(result).to match(expectedResult)
        end
        # Edge case: more than two integers, and the highest are the last and second to last
        it "Given [1,1,1,5,3,8], expect [5,8]" do
            testArray = [1,1,1,5,3,8]
            expectedResult = [5,8]
            result = ArrayAnalyzer.findHighestSum(testArray)
            expect(result).to match(expectedResult)
        end
        # Edge case: more than two integers, and the highest are the first and third
        it "Given [5,2,4,1,1,1], expect [5,4]" do
            testArray = [5,2,4,1,1,1]
            expectedResult = [5,4]
            result = ArrayAnalyzer.findHighestSum(testArray)
            expect(result).to match(expectedResult)
        end
        # Edge case: more than two integers, all are zeros
        it "Given [0,0,0,0,0,0], expect [0,0]" do
            testArray = [0,0,0,0,0,0]
            expectedResult = [0,0]
            result = ArrayAnalyzer.findHighestSum(testArray)
            expect(result).to match(expectedResult)
        end
    end
end