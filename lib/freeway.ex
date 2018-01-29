defmodule Freeway do
  @moduledoc """
  Example module for a gen state machine representing a freeway.

  This freeway has a smart meter that allows cars to enter the freeway
  on a timer or if too many cars are waiting in that lane.

  To call:
  {:ok, pid} = Freeway.start_link
  GenStateMachine.cast(pid, {:new, Freeway.car})
  """

  @doc """
  Passing a list with :state_functions and :state_enter means it will also fire an
  :enter event.
  """
  # use GenStateMachine, callback_mode: [:state_functions, :state_enter]
  use GenStateMachine, callback_mode: :state_functions

  def init(_) do
    {:ok, :red, []}
  end

  def start_link do
    GenStateMachine.start_link(__MODULE__, [])
  end

  def red(:cast, {:new, vehicle}, data) do
    data = [vehicle | data]

    cars = length(data)
    IO.puts "Number of cars waiting in line: #{to_string(cars)}"

    cond do
      cars > 5 ->
        IO.puts "Meter turned green due buildup in traffic."
        data = enter_freeway(data)
        {:next_state, :red, data}
      true ->
        {:keep_state, data, [{:state_timeout, 3_000, :turn_green}]}
    end
  end
  def red(:enter, _previous_state, _data) do
    :keep_state_and_data
  end
  def red(:state_timeout, :turn_green, data) do
    IO.puts "Meter turned green due to timeout."
    data = enter_freeway(data)

    {:next_state, :red, data}
  end

  def enter_freeway(data) do
    ### In a real example, you'd likely send the data list somewhere to be processed
    {count, data} = {length(data), []}
    IO.puts "#{to_string(count)} cars are entering the freeway."
    data
  end

  def car do
    %Vehicle{}
  end
end
