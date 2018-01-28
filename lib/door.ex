defmodule Door do
  @moduledoc """
  Example module for a gen state machine representing a door.

  To call:
  {:ok, pid} = Door.start_link
  GenStateMachine.cast(pid, :open)
  GenStateMachine.cast(pid, :close)
  GenStateMachine.cast(pid, :lock)
  GenStateMachine.cast(pid, :unlock)
  """

  use GenStateMachine, callback_mode: :state_functions

  def init(_) do
    {:ok, :closed, 0}
  end

  def start_link do
    GenStateMachine.start_link(__MODULE__, [])
  end

  def open(:cast, :close, data) do
    IO.puts "Door closed."
    {:next_state, :closed, data}
  end
  def open(:cast, :open, _data) do
    IO.puts "Door is already open."
    :keep_state_and_data
  end
  def open(:cast, :lock, _data) do
    IO.puts "Door must be closed before it can be locked."
    :keep_state_and_data
  end
  def open(:cast, :unlock, _data) do
    IO.puts "Door is already unlocked and open"
    :keep_state_and_data
  end
  def open(:cast, _state, _data) do
    IO.puts "Huh?"
    :keep_state_and_data
  end

  def closed(:cast, :open, data) do
    IO.puts "Door opened and has been opened #{to_string(data + 1)} times."
    {:next_state, :open, data + 1}
  end
  def closed(:cast, :lock, data) do
    IO.puts "Door locked."
    {:next_state, :locked, data}
  end
  def closed(:cast, :close, _data) do
    IO.puts "Door is already closed."
    :keep_state_and_data
  end
  def closed(:cast, :unlock, _data) do
    IO.puts "Door is closed, but already unlocked."
    :keep_state_and_data
  end
  def closed(:cast, _state, _data) do
    IO.puts "Huh?"
    :keep_state_and_data
  end

  def locked(:cast, :unlock, data) do
    IO.puts "Door is unlocked."
    {:next_state, :closed, data}
  end
  def locked(:cast, :open, _data) do
    IO.puts "Door is locked and cannot be opened."
    :keep_state_and_data
  end
  def locked(:cast, :close, _data) do
    IO.puts "Door is already locked and closed."
    :keep_state_and_data
  end
  def locked(:cast, :lock, _data) do
    IO.puts "Door is already locked."
    :keep_state_and_data
  end
  def locked(:cast, _state, _data) do
    IO.puts "Huh?"
    :keep_state_and_data
  end
end
