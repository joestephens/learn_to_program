$nesting_depth = 0

def better_log desc, &block
  puts " " * $nesting_depth + "Beginning \"#{desc}\"..."
  $nesting_depth += 1
  output = block.call
  $nesting_depth -= 1
  puts " " * $nesting_depth + "...\"#{desc}\" finished, returning: #{output}"
end

better_log("outer block") do
  better_log("some little block") { 3 + 2 }
  better_log("yet another block") { "I like Thai food!" }
  1 == 2 # false
end
