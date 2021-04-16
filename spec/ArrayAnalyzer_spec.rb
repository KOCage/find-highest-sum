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
        testCases = [
            # Basic case: just two integers
            [
                [1,2],
                [1,2]
            ],
            # Basic case: more than two integers, but no duplicates
            [
                [2,4,2,3,1],
                [4,3]
            ],
            # Edge case: more than two integers, but duplicates 
            [
                [1,10,11,11,12,1],   
                [11,12]
            ],
            # Edge case: more than two integers, the two largest integers are adjacent
            [
                [3,6,5,1,1],
                [3,5]
            ],
            # Edge case: more than two integers, duplicates that are the highest
            [
                [1,2,6,6,6,2,1],
                [6,6]
            ],
            # Edge case: more than two integers, and highest are the first and final integers
            [
                [7,1,1,1,1,8],
                [7,8]
            ],
            # Edge case: more than two integers, and the highest are the last and second to last
            [
                [1,1,1,5,3,8],
                [5,8]
            ],
            # Edge case: more than two integers, and the highest are the first and third
            [
                [5,2,4,1,1,1],
                [5,4]
            ],
            # Edge case: more than two integers, all are zeros
            [
                [0,0,0,0,0,0],
                [0,0]
            ]
        ]   
            
        for i in 0...testCases.length
            it "Test #{i}: Given #{testCases[i][0]}, returns #{testCases[i][1]}" do
                result = ArrayAnalyzer.findHighestSum(testCases[i][0])
                expect(result).to match(testCases[i][1])
            end
        end
    end
end