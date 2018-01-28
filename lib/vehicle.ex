defmodule Vehicle do
  @moduledoc """
  A type of vehicle on the Freeway
  """

  defstruct decoded_key: "adb1240236b102231",
            decoded_value: %{
              "object_type" => "car",
              "current_value" => %{
                "color" => "silver",
                "make" => "Mercedes-Benz",
                "model" => "E-Class",
                "year" => "2006",
                "mileage" => "104538",
                "inserted_at" => 1516746431574019000,
                "vin" => "adb1240236b102231"
              }
            }
end
