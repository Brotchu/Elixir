defmodule RPG do
  def total_points(skill_map) do
    %{strength: strength_value, dexterity: dex_value,intelligence: intl_value} = skill_map
    strength_value*2 + dex_value*3 +intl_value*3
  end

end
