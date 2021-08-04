require "simple_queue"
require "clever_queue"

describe "CleverQueue" do
    subject(:small_queue) { CleverQueue.new(5, 2) }
    subject(:big_queue) { CleverQueue.new(8, 6) }

    it "should inherit from SimpleQueue" do
        expect(CleverQueue).to be < SimpleQueue
    end

    it "should not expose a writer for @capacity" do
        expect(small_queue).to_not respond_to(:capacity=)
    end

    it "should not expose a reader or writer for @hidden_array" do
        expect(small_queue).to_not respond_to(:hidden_array, :hidden_array=)
    end

    describe "#initialize" do
        it "should accept two numbers as arguments" do
            expect { CleverQueue.new(5, 2) }.to_not raise_error
            expect { CleverQueue.new }.to raise_error
        end

        it "should set @capacity to the first arg" do
            expect(small_queue.instance_variable_get(:@capacity)).to eq(5)
            expect(big_queue.instance_variable_get(:@capacity)).to eq(8)
        end

        it "should set @soft_limit to the second arg" do
            expect(small_queue.instance_variable_get(:@soft_limit)).to eq(2)
            expect(big_queue.instance_variable_get(:@soft_limit)).to eq(6)
        end

        it "should raise the error 'invalid args' if the soft limit is larger than the capacity" do
            expect { CleverQueue.new(2, 5) }.to raise_error(/invalid args/)
        end

        it "should set @hidden_array to an empty array" do
            expect(small_queue.instance_variable_get(:@hidden_array)).to eq([])
            expect(big_queue.instance_variable_get(:@hidden_array)).to eq([])
        end
    end

    describe "#capacity" do
        it "should return the capacity of the queue" do
            expect(small_queue.capacity).to eq(5)
            expect(big_queue.capacity).to eq(8)
        end
    end

    describe "#soft_limit" do
        it "should return the soft_limit of the queue" do
            expect(small_queue.soft_limit).to eq(2)
            expect(big_queue.soft_limit).to eq(6)
        end
    end

    describe "#soft_limit=" do
        it "should set @soft_limit to a given argument" do
            small_queue.soft_limit = 3
            expect(small_queue.instance_variable_get(:@soft_limit)).to eq(3)

            big_queue.soft_limit = 7
            expect(big_queue.instance_variable_get(:@soft_limit)).to eq(7)
        end
    end

    describe "#enqueue" do
        it "should accept any number of arguments" do
            expect { small_queue.enqueue(5, 2, 3) }.to_not raise_error
            expect { big_queue.enqueue(5, 2, 3, 9) }.to_not raise_error
        end

        context "when the number of arguments would cause the queue to exceed capacity" do
            it "should not add anything to the queue" do
                small_queue.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd', 'e'])
                expect { small_queue.enqueue('z') }.to raise_error(/queue is full/)
                expect(small_queue.instance_variable_get(:@hidden_array)).to eq(['a', 'b', 'c', 'd', 'e'])

                big_queue.instance_variable_set(:@hidden_array, ['q', 'r', 's', 't', 'u', 'v', 'w'])
                expect { big_queue.enqueue('x', 'z') }.to raise_error(/queue is full/)
                expect(big_queue.instance_variable_get(:@hidden_array)).to eq(['q', 'r', 's', 't', 'u', 'v', 'w'])
            end

            it "should raise the error 'queue is full'" do
                small_queue.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd', 'e'])
                expect { small_queue.enqueue('z') }.to raise_error(/queue is full/)

                big_queue.instance_variable_set(:@hidden_array, ['q', 'r', 's', 't', 'u', 'v', 'w'])
                expect { big_queue.enqueue('x', 'z') }.to raise_error(/queue is full/)
            end
        end

        context "when the number of arguments would not cause the queue to exceed capacity" do
            it "should add the given arguments to the queue (last argument at the back)" do
                hidden_array = small_queue.instance_variable_get(:@hidden_array)

                small_queue.enqueue('a')
                expect(hidden_array).to eq(['a'])

                small_queue.enqueue('b', 'c')
                expect(hidden_array).to eq(['a', 'b', 'c'])
            end

            it "should return the new total number of items on the queue" do
                expect(small_queue.enqueue('a')).to eq(1)
                expect(small_queue.enqueue('b', 'c')).to eq(3)
            end
        end
    end

    describe "#dequeue" do
        context "when no argument is passed in" do
            it "should remove the front item in the queue" do
                small_queue.instance_variable_set(:@hidden_array, ['a', 'b', 'c'])
                small_queue.dequeue
                expect(small_queue.instance_variable_get(:@hidden_array)).to eq(['b', 'c'])
            end

            it "should return an array containing the removed item" do
                small_queue.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'e'])
                expect(small_queue.dequeue).to match_array(['a'])
            end
        end

        context "when a number argument, n, is passed in" do
            it "should remove the first n items in the queue " do
                small_queue.instance_variable_set(:@hidden_array, ['a', 'b', 'c'])
                small_queue.dequeue(3)
                expect(small_queue.instance_variable_get(:@hidden_array)).to eq([])
            end

            it "should return an array containing the removed items" do
                small_queue.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'e'])
                expect(small_queue.dequeue(3)).to match_array(['a', 'b', 'c'])
            end

            it "should return the array of removed items sorted by the ordered that they were removed" do
                small_queue.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'e'])
                expect(small_queue.dequeue(3)).to eq(['a', 'b', 'c'])
            end

            context "and there are not enough items on the queue to remove" do
                it "should remove as many items as possible from the queue" do
                    small_queue.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'e'])
                    small_queue.dequeue(6)
                    expect(small_queue.instance_variable_get(:@hidden_array)).to eq([])
                end

                it "should return an array containing the items that were removed and nil values for the number of items that were unable to be dequeued" do
                    small_queue.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'e'])
                    expect(small_queue.dequeue(6)).to eq(['a', 'b', 'c', 'e', nil, nil])

                    big_queue.instance_variable_set(:@hidden_array, ['x'])
                    expect(big_queue.dequeue(2)).to eq(['x', nil])
                end
            end
        end
    end

    describe "#trim" do
        context "when the queue is not over the soft limit" do
            it "should not modify the queue" do
                small_queue.instance_variable_set(:@hidden_array, ['a'])
                small_queue.trim
                expect(small_queue.instance_variable_get(:@hidden_array)).to eq(['a'])
            end

            it "should return false" do
                expect(small_queue.trim).to eq(false)
            end
        end

        context "when the queue is over the soft limit" do
            it "should remove enough items from the back of the queue until the queue's size is at the soft limit" do
                small_queue.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd'])
                small_queue.trim
                expect(small_queue.instance_variable_get(:@hidden_array)).to eq(['a', 'b'])

                big_queue.instance_variable_set(:@hidden_array, ['q', 'r', 's', 't', 'u', 'v', 'w'])
                big_queue.trim
                expect(big_queue.instance_variable_get(:@hidden_array)).to eq(['q', 'r', 's', 't', 'u', 'v'])
            end

            it "should return true" do
                small_queue.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd'])
                expect(small_queue.trim).to eq(true)

                big_queue.instance_variable_set(:@hidden_array, ['q', 'r', 's', 't', 'u', 'v', 'w'])
                expect(big_queue.trim).to eq(true)
            end
        end


    end
end
