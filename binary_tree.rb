# frozen_string_literal: true

class Node
  attr_accessor :item, :left, :right
  def initialize(item)
    @item = item
    @left = nil
    @right = nil
  end
end

def insert_node(node, ele)
  return Node.new(ele) if node.nil?

  if ele < node.item
    node.left = insert_node(node.left, ele)
  else
    node.right = insert_node(node.right, ele)
  end
  node
end

def delete_node(node, val)
  return nil if node.nil?

  if val < node.item
    node.left = delete_node(node.left, val)
  elsif val > node.item
    node.right = delete_node(node.right, val)
  else
    return nil if node.left.nil? && node.right.nil?

    min_larger_right = find_min(node.right)
    node.item = min_larger_right.item
    node.right = delete_node(node.right, min_larger_right.item)
  end
  node
end

def find_min(node)
  node = node.left while node.left
  node
end

def make_binary_tree(data)
  btree = nil
  data.each do |ele|
    btree = insert_node(btree, ele)
  end
  btree
end

def print_with_inorder(btree)
  return if btree.nil?

  print_with_inorder(btree.left)
  puts btree.item
  print_with_inorder(btree.right)
end

def inorder_to_array(btree)
  return [] if btree.nil?

  inorder_to_array(btree.left) + [btree.item] + inorder_to_array(btree.right)
end


data = 3.times.to_a.shuffle

# make tree
btree = make_binary_tree(data)

# inorder
p inorder_to_array(btree)

# insert
insert_node(btree, 123)
p inorder_to_array(btree)

# delete
delete_node(btree, 0)
p inorder_to_array(btree)

