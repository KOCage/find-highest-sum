require './ArrayAnalyzer'
require 'rspec'
require 'benchmark'

RSpec.describe "An ArrayAnalyzer can" do 
    context 'General Functionality' do
        context 'When given an invalid array, raises argument error' do
            it 'Given an empty array' do
                testArray = []
                expect{ ArrayAnalyzer.verifyInput(testArray) }
                .to raise_error('Invalid Array! Input array must contain two or more integers') 
            end
            it 'Given an array with only one integer' do
                testArray = [1]
                expect{ ArrayAnalyzer.verifyInput(testArray) }
                .to raise_error('Invalid Array! Input array must contain two or more integers')
            end
        end
    end
    context 'Given an array, it can find the two non-adjacent integers with the highest sum' do
        context 'Using Nested Loops' do
            # Basic case: just two integers
            it "Given [1,2], expect [1,2]" do
                testArray = [1,2]
                expectedResult = [1,2]
                result = ArrayAnalyzer.findHighestSumWithNestedLoops(testArray)
                expect(result).to match(expectedResult)
            end
            # Basic case: more than two integers, but no duplicates
            it "Given [2,4,2,3,1], expect [4,3]" do
                testArray = [2,4,2,3,1]
                expectedResult = [4,3]
                result = ArrayAnalyzer.findHighestSumWithNestedLoops(testArray)
                expect(result).to match(expectedResult)
            end
            # Edge case: more than two integers, but duplicates 
            it "Given [1,10,11,11,12,1], expect [11,12]" do
                testArray = [1,10,11,11,12,1]
                expectedResult = [11,12]
                result = ArrayAnalyzer.findHighestSumWithNestedLoops(testArray)
                expect(result).to match(expectedResult)
            end
            # Edge case: more than two integers, the two largest integers are adjacent
            it "Given [3,6,5,1,1], expect [3,5]" do
                testArray = [3,6,5,1,1]
                expectedResult = [3,5]
                result = ArrayAnalyzer.findHighestSumWithNestedLoops(testArray)
                expect(result).to match(expectedResult)
            end
            # Edge case: more than two integers, duplicates that are the highest
            it "Given [1,2,6,6,6,2,1], expect [6,6]" do
                testArray = [1,2,6,6,6,2,1]
                expectedResult = [6,6]
                result = ArrayAnalyzer.findHighestSumWithNestedLoops(testArray)
                expect(result).to match(expectedResult)
            end
            # Edge case: more than two integers, and highest are the first and final integers
            it "Given [7,1,1,1,1,8], expect [7,8]" do
                testArray = [7,1,1,1,1,8]
                expectedResult = [7,8]
                result = ArrayAnalyzer.findHighestSumWithNestedLoops(testArray)
                expect(result).to match(expectedResult)
            end
            # Edge case: more than two integers, and the highest are the last and second to last
            it "Given [1,1,1,5,3,8], expect [5,8]" do
                testArray = [1,1,1,5,3,8]
                expectedResult = [5,8]
                result = ArrayAnalyzer.findHighestSumWithNestedLoops(testArray)
                expect(result).to match(expectedResult)
            end
            # Edge case: more than two integers, and the highest are the first and third
            it "Given [5,2,4,1,1,1], expect [5,4]" do
                testArray = [5,2,4,1,1,1]
                expectedResult = [5,4]
                result = ArrayAnalyzer.findHighestSumWithNestedLoops(testArray)
                expect(result).to match(expectedResult)
            end
            # Edge case: more than two integers, all are zeros
            it "Given [0,0,0,0,0,0], expect [0,0]" do
                testArray = [0,0,0,0,0,0]
                expectedResult = [0,0]
                result = ArrayAnalyzer.findHighestSumWithNestedLoops(testArray)
                expect(result).to match(expectedResult)
            end
        end
        context 'Using highest values' do
            # Basic case: just two integers
            it "Given [1,2], expect [1,2]" do
                testArray = [1,2]
                expectedResult = [1,2]
                result = ArrayAnalyzer.findHighestSumWithHighestValues(testArray)
                expect(result).to match(expectedResult)
            end
            # Basic case: more than two integers, but no duplicates
            it "Given [2,4,2,3,1], expect [4,3]" do
                testArray = [2,4,2,3,1]
                expectedResult = [4,3]
                result = ArrayAnalyzer.findHighestSumWithHighestValues(testArray)
                expect(result).to match(expectedResult)
            end
            # Edge case: more than two integers, but duplicates 
            it "Given [1,10,11,11,12,1], expect [12,11]" do
                testArray = [1,10,11,11,12,1]
                expectedResult = [12,11]
                result = ArrayAnalyzer.findHighestSumWithHighestValues(testArray)
                expect(result).to match(expectedResult)
            end
            # Edge case: more than two integers, the two largest integers are adjacent
            it "Given [3,6,5,1,1], expect [5,3]" do
                testArray = [3,6,5,1,1]
                expectedResult = [5,3]
                result = ArrayAnalyzer.findHighestSumWithHighestValues(testArray)
                expect(result).to match(expectedResult)
            end
            # Edge case: more than two integers, duplicates that are the highest
            it "Given [1,2,6,6,6,2,1], expect [6,6]" do
                testArray = [1,2,6,6,6,2,1]
                expectedResult = [6,6]
                result = ArrayAnalyzer.findHighestSumWithHighestValues(testArray)
                expect(result).to match(expectedResult)
            end
            # Edge case: more than two integers, and highest are the first and final integers
            it "Given [7,1,1,1,1,8], expect [8,7]" do
                testArray = [7,1,1,1,1,8]
                expectedResult = [8,7]
                result = ArrayAnalyzer.findHighestSumWithHighestValues(testArray)
                expect(result).to match(expectedResult)
            end
            # Edge case: more than two integers, and the highest are the last and second to last
            it "Given [1,1,1,5,3,8], expect [8,5]" do
                testArray = [1,1,1,5,3,8]
                expectedResult = [8,5]
                result = ArrayAnalyzer.findHighestSumWithHighestValues(testArray)
                expect(result).to match(expectedResult)
            end
            # Edge case: more than two integers, and the highest are the first and third
            it "Given [5,2,4,1,1,1], expect [5,4]" do
                testArray = [5,2,4,1,1,1]
                expectedResult = [5,4]
                result = ArrayAnalyzer.findHighestSumWithHighestValues(testArray)
                expect(result).to match(expectedResult)
            end
            # Edge case: more than two integers, all are zeros
            it "Given [0,0,0,0,0,0], expect [0,0]" do
                testArray = [0,0,0,0,0,0]
                expectedResult = [0,0]
                result = ArrayAnalyzer.findHighestSumWithHighestValues(testArray)
                expect(result).to match(expectedResult)
            end
        end
    end
    context 'Given the same arrays, both algorithms will succeed, but highest values will be faster' do      
        it 'Highest Value solution is one hundred times faster than Nested Loop solution with arrays of at least 5000 values' do
            count = 5000
            min = 0
            max = 10000
            f = 100
            array1 = ArrayAnalyzer.generateRandomSourceArray(count, min, max)
            array2 = ArrayAnalyzer.generateRandomSourceArray(count, min, max)
            array3 = ArrayAnalyzer.generateRandomSourceArray(count, min, max)
            nLResult = []
            hVResult = []

            nLTime = Benchmark.realtime{
                nLResult = ArrayAnalyzer.findHighestSumWithNestedLoops(array1)
            }
            hVTime = Benchmark.realtime{
                hVResult = ArrayAnalyzer.findHighestSumWithHighestValues(array1)
            }
            expect(nLResult).to match_array(hVResult)
            expect(hVTime * f).to be < (nLTime)

            nLTime = Benchmark.realtime{
                nLResult = ArrayAnalyzer.findHighestSumWithNestedLoops(array2)
            }
            hVTime = Benchmark.realtime{
                hVResult = ArrayAnalyzer.findHighestSumWithHighestValues(array2)
            }
            expect(nLResult).to match_array(hVResult)
            expect(hVTime * f).to be < (nLTime)

            nLTime = Benchmark.realtime{
                nLResult = ArrayAnalyzer.findHighestSumWithNestedLoops(array3)
            }
            hVTime = Benchmark.realtime{
                hVResult = ArrayAnalyzer.findHighestSumWithHighestValues(array3)
            }
            expect(nLResult).to match_array(hVResult)
            expect(hVTime * f).to be < (nLTime)
        end
    end
end