defmodule GenStateMachineExamplesTest do
  use ExUnit.Case
  doctest GenStateMachineExamples

  test "greets the world" do
    assert GenStateMachineExamples.hello() == :world
  end
end
