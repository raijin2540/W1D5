class PolyTreeNode
 def initialize(value)
   @value = value
   @parent = nil
   @children = []
 end

 def parent
   @parent
 end

 def children
   @children
 end

 def value
   @value
 end

 def parent=(parent)
   unless @parent.nil?
     self.parent.children.delete(self)
   end

   @parent = parent
   unless parent.nil? || parent.children.include?(self)
     parent.children << self
   end
 end

 def add_child(child_node)
   child_node.parent = self
 end

 def remove_child(child_node)

   if @children.include?(child_node)
     child_node.parent = nil
   else
     raise "Error - not my child!"
   end

 end

end
