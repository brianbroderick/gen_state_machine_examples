defmodule Freeway do
  @moduledoc """
  Example module for a
  gen state machine representing a freeway.
  On this freeway, there's a special lane for cars and another one for trucks.

  To call:
  {:ok, pid} = Freeway.start_link
  GenStateMachine.cast(pid, {:enter, %Vehicle{}})
  """

  use GenStateMachine, callback_mode: :state_functions

  defstruct car: [], truck: []

  def init(_) do
    {:ok, :road, %Freeway{}}
  end

  def start_link do
    GenStateMachine.start_link(__MODULE__, [])
  end

  def road(:cast, {:enter, vehicle}, data) do
    data = case vehicle_type(vehicle) do
          "car" -> %{data | car: [vehicle | data.car]}
          "truck" -> %{data | truck: [vehicle | data.truck]}
          _ -> IO.puts "Unknown vehicle type"; data
    end
    IO.inspect data

    {:keep_state, data}
  end

  defp vehicle_type(vehicle) do
    vehicle.decoded_value["object_type"]
  end

  def car do
    %Vehicle{}
  end

  def truck do
    %Vehicle{ decoded_key: "1fmzu67e92uc29655",
              decoded_value: %{
                "object_type" => "truck",
                "current_value" => %{
                  "color" => "white",
                  "make" => "Ford",
                  "model" => "F150",
                  "year" => "2018",
                  "mileage" => "6543",
                  "inserted_at" => 1516746431685129000,
                  "vin" => "1fmzu67e92uc29655"
                }
              }
            }
  end
end



