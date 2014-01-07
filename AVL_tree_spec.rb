require './AVL_tree.rb'

describe AVLTree do
	let(:tree) { AVLTree.new }

	describe "rotates left properly once" do 
		before(:each) do
			tree.insert(1)
			tree.insert(2)
			tree.insert(3)
		end

		it "properly assigns new root" do 
			expect(tree.root.value).to eq(2)
		end

		it "properly assigns children" do
			expect(tree.root.right.value).to eq(3)
			expect(tree.root.left.value).to eq(1)
		end

		it "properly assigns parent of the children" do
			expect(tree.root.right.parent.value).to eq(2)
			expect(tree.root.left.parent.value).to eq(2)
		end

	end

	describe "rotates left properly twice" do
		before(:each) do 
			tree.insert(1)
			tree.insert(2)
			tree.insert(3)

			tree.insert(4)
			tree.insert(5)
		end

		it "properly assigns new root" do
			expect(tree.root.value).to eq(2)
		end

		it "has the right children for root(L1, R4)" do
			expect(tree.root.left.value).to eq(1)
			expect(tree.root.right.value).to eq(4)
		end


	end

	describe "rotates right properly once" do
		before(:each) do
			tree.insert(5)
			tree.insert(4)
			tree.insert(3)
		end

		it "properly assigns new root" do
			expect(tree.root.value).to eq(4)
		end

		it "properly assigns children" do
			expect(tree.root.right.value).to eq(5)
			expect(tree.root.left.value).to eq(3)
		end

	end

	describe "rotates right properly twice" do 
		before(:each) do
			tree.insert(5)
			tree.insert(4)
			tree.insert(3)

			tree.insert(2)
			tree.insert(1)
		end

		it "properly assigns new root" do
			expect(tree.root.value).to eq(4)
		end

		it "properly assigns children" do 
			expect(tree.root.left.value).to eq(2)
			expect(tree.root.right.value).to eq(5)
		end

		it "properly assigns grandchildren" do
			expect(tree.root.left.left.value).to eq(1)
			expect(tree.root.left.right.value).to eq(3)
		end

	end

end