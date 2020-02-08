class BTreeSort
  def initialize
    @output = []
  end

  class BinaryTree
    attr_accessor :payload, :left, :right
    def initialize(payload)
      @payload = payload
    end
  end

  def compare(num, node)
    return BinaryTree.new(num) if node.nil?
    if num < node.payload
      node.left = compare(num, node.left)
    else
      node.right = compare(num, node.right)
    end
    node
  end

  def start_tree(array)
    array.each do |num|
      if @root.nil?
        @root = compare(num, @root)
      else
        compare(num, @root)
      end
    end
  end

  def depth(current_node)
    if !current_node
      return
    end
    depth(current_node.left)
    @output.push(current_node.payload)
    depth(current_node.right)
  end

  def sort(array)
    start_tree(array)
    depth(@root)
    return @output
  end

end


puts BTreeSort.new.sort([7, 4, 9, 1, 6, 14, 10])
