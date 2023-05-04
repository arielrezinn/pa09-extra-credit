# Given an array of integers nums and an integer target, return
# indices of the two numbers such that they add up to target. You
# may assume that each input would have exactly one solution, and
# you may not use the same element twice. You can return the answer
# in any order.
defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    Enum.reduce_while(nums, {%{}, 0}, fn num, {acc, index} ->
      diff = target - num
      if Map.has_key?(acc, diff) do
        {:halt, [Map.get(acc, diff), index]}
      else
        acc = Map.put(acc, num, index)
        {:cont, {acc, index + 1}}
      end
    end)
  end
end
