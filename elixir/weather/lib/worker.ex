defmodule Weather.Worker do


  def loop do
    receive do
      {sender_pid, location} ->
        send(sender_pid, {:ok,temperature_of(location)} )
    _ ->
      IO.puts "wrong message"
    end
    loop()
  end

  def temperature_of(location) do
    res = url_for(location) |> HTTPoison.get |> parse_response
    case res do
      {:ok, temp} ->
        "#{location} : #{temp}"
      :error ->
        "#{location} not found"
    end
  end

  defp url_for(location) do
    location= URI.encode(location)
    "http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=#{get_API_key()}"
  end

  defp parse_response( {:ok, %HTTPoison.Response{ body: body, status_code: 200}} ) do
    body
    |> JSON.decode!
    |> compute_temp
  end
  defp parse_response(_), do: :error

  defp compute_temp(json) do
    try do
      temp = (json["main"]["temp"] -273.15) |> Float.round(1)
      {:ok, temp}
    rescue
      _ ->  :error
    end
  end


  defp get_API_key do
    "b02423fdd4252ad828182f0bb1c4c49a"
  end

end
