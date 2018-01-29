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

# def truck do
#   %Vehicle{ decoded_key: "1fmzu67e92uc29655",
#             decoded_value: %{
#               "object_type" => "truck",
#               "current_value" => %{
#                 "color" => "white",
#                 "make" => "Ford",
#                 "model" => "F150",
#                 "year" => "2018",
#                 "mileage" => "6543",
#                 "inserted_at" => 1516746431685129000,
#                 "vin" => "1fmzu67e92uc29655"
#               }
#             }
#           }
# end
