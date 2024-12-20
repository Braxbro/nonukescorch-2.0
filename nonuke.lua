-- I don't know why the previous guy copy pasted the ENTIRE action prototype for the projectile.
-- This does a targeted removal of the effect instead.
local removed_index = -1
for index, effect in pairs(data.raw.projectile["atomic-rocket"].action.action_delivery.target_effects) do
    if effect.type == "set-tile" and effect.tile_name == "nuclear-ground" and removed_index == -1 then
        removed_index = index
        data.raw.projectile["atomic-rocket"].action.action_delivery.target_effects[index] = nil
    end
    if index > removed_index then
        data.raw.projectile["atomic-rocket"].action.action_delivery.target_effects[index - 1] = effect
        data.raw.projectile["atomic-rocket"].action.action_delivery.target_effects[index] = nil
    end
end