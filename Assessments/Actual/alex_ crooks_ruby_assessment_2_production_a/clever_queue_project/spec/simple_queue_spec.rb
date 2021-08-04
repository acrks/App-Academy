require "simple_queue"

describe "SimpleQueue" do
    subject(:queue_1) { SimpleQueue.new }
    subject(:queue_2) { SimpleQueue.new }

    it "should not expose a reader or writer for @hidden_array" do
        expect(queue_1).to_not respond_to(:hidden_array, :hidden_array=)
    end

    describe "#initialize" do
        it "should set @hidden_array to an empty array" do
            expect(queue_1.instance_variable_get(:@hidden_array)).to eq([])
        end
    end

    describe "#size" do
        it "should return the total number of items currently on the queue" do
            expect(queue_1.size).to eq(0)

            queue_1.instance_variable_set(:@hidden_array, ['x', 'y', 'z'])
            expect(queue_1.size).to eq(3)

            queue_2.instance_variable_set(:@hidden_array, ['q', 'r', 's', 't', 'u', 'v'])
            expect(queue_2.size).to eq(6)
        end
    end

    describe "#vacant?" do
        context "when the queue contains no items" do
            it "should return true" do
                expect(queue_1.vacant?).to eq(true)
            end
        end

        context "when the queue contains some items" do
            it "should return false" do
                queue_1.instance_variable_set(:@hidden_array, ['a', 'b'])
                expect(queue_1.vacant?).to eq(false)
            end
        end
    end

    describe "#front" do
        it "should return the item at the front of the queue" do
            queue_1.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd'])
            expect(queue_1.front).to eq('a')

            queue_2.instance_variable_set(:@hidden_array, ['x', 'a', 'b', 'c', 'd'])
            expect(queue_2.front).to eq('x')
        end

        it "should not modify the queue" do
            queue_1.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd'])
            queue_1.front
            expect(queue_1.instance_variable_get(:@hidden_array)).to eq(['a', 'b', 'c', 'd'])
        end
    end

    describe "#back" do
        it "should return the item at the back of the queue" do
            queue_1.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd'])
            expect(queue_1.back).to eq('d')

            queue_2.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd', 'q'])
            expect(queue_2.back).to eq('q')
        end

        it "should not modify the queue" do
            queue_1.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd'])
            queue_1.back
            expect(queue_1.instance_variable_get(:@hidden_array)).to eq(['a', 'b', 'c', 'd'])
        end
    end

    describe "#first" do
        it "should accept a number, n, as an arg" do
            expect { queue_1.first(0) }.to_not raise_error
        end

        it "should return an array containing the first n items in the queue, in the same order that they appear in the queue" do
            queue_1.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd'])
            expect(queue_1.first(2)).to eq(['a', 'b'])

            queue_2.instance_variable_set(:@hidden_array, ['q', 'r', 's', 't', 'u'])
            expect(queue_2.first(3)).to eq(['q', 'r', 's'])
        end

        it "should not modify the queue" do
            queue_1.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd'])
            queue_1.first(2)
            expect(queue_1.instance_variable_get(:@hidden_array)).to eq(['a', 'b', 'c', 'd'])
        end
    end

    describe "#last" do
        it "should accept a number, n, as an arg" do
            expect { queue_1.last(0) }.to_not raise_error
        end

        it "should return an array containing the last n items in the queue, in the same order that they appear in the queue" do
            queue_1.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd'])
            expect(queue_1.last(2)).to eq(['c', 'd'])

            queue_2.instance_variable_set(:@hidden_array, ['q', 'r', 's', 't', 'u', 'e'])
            expect(queue_2.last(3)).to eq(['t', 'u', 'e'])
        end

        it "should not modify the queue" do
            queue_1.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd'])
            queue_1.last(2)
            expect(queue_1.instance_variable_get(:@hidden_array)).to eq(['a', 'b', 'c', 'd'])
        end
    end

    describe "#enqueue" do
        it "should accept an item as an argument" do
            expect { queue_1.enqueue('spinach') }.to_not raise_error
        end

        it "should add the given item to the back of the queue" do
            queue_1.enqueue('spinach')
            expect(queue_1.instance_variable_get(:@hidden_array)).to eq(['spinach'])

            queue_2.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd'])
            queue_2.enqueue('e')
            expect(queue_2.instance_variable_get(:@hidden_array)).to eq(['a', 'b', 'c', 'd', 'e'])
        end

        it "should return the new size of the queue" do
            expect(queue_1.enqueue('spinach')).to eq(1)

            queue_2.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd'])
            expect(queue_2.enqueue('e')).to eq(5)
        end
    end

    describe "#dequeue" do
        context "when there are no items in the queue" do
            it "should return nil" do
                expect(queue_1.dequeue).to eq(nil)
                expect(queue_1.instance_variable_get(:@hidden_array)).to eq([])
            end
        end

        context "when there is at least one item in the queue" do
            it "should remove the item at the front of the queue" do
                queue_1.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd'])
                queue_1.dequeue
                expect(queue_1.instance_variable_get(:@hidden_array)).to eq(['b', 'c', 'd'])

                queue_2.instance_variable_set(:@hidden_array, ['r'])
                queue_2.dequeue
                expect(queue_2.instance_variable_get(:@hidden_array)).to eq([])
            end

            it "should return the removed item" do
                queue_1.instance_variable_set(:@hidden_array, ['a', 'b', 'c', 'd'])
                expect(queue_1.dequeue).to eq('a')

                queue_2.instance_variable_set(:@hidden_array, ['r'])
                expect(queue_2.dequeue).to eq('r')
            end
        end
    end
end
