defmodule Switch do
  @moduledoc """
  Example module for a gen state machine

  To call:
  {:ok, pid} = Switch.start_link
  GenStateMachine.cast(pid, :flip)
  """

  use GenStateMachine, callback_mode: :state_functions

  def init(_) do
    {:ok, :off, 0}
  end

  def start_link do
    GenStateMachine.start_link(__MODULE__, [])
  end

  def flip(pid) do
    GenStateMachine.cast(pid, :flip)
  end

  def off(:cast, {:flip, digit}, data) when is_integer(digit) do
    new_data = data + round(digit / 2)
    IO.puts "ON: #{to_string(new_data)}"
    {:next_state, :on, new_data}
  end
  def off(:cast, :flip, data) do
    new_data = data + 1
    IO.puts "ON: #{to_string(new_data)}"
    {:next_state, :on, new_data, [{:state_timeout, 3_000, :off}]}
  end
  def off({:call, from}, :get_count, data) do
    {:keep_state_and_data, [{:reply, from, "OFF: #{to_string(data)}"}]}
  end

  def on(:cast, {:flip, digit}, data) when is_integer(digit) do
    new_data = data + round(digit / 2)
    IO.puts "OFF: #{to_string(new_data)}"
    {:next_state, :off, data + digit}
  end
  def on(:cast, :flip, data) do
    IO.puts "OFF: #{to_string(data)}"
    {:next_state, :off, data}
  end
  def on(:state_timeout, _event_content, _data) do
    IO.puts "timed out"
    :keep_state_and_data
  end
  def on({:call, from}, :get_count, data) do
    {:keep_state_and_data, [{:reply, from, "ON: #{to_string(data)}"}]}
  end
end
