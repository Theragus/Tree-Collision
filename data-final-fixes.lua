-- Shrink the collision boxes of trees so that forests can be walked through.
-- This runs in data-final-fixes so that trees added by other mods are covered too.

local tree_box_size = settings.startup["tree-collision-tree-box-size"].value
local plant_box_size = settings.startup["tree-collision-plant-box-size"].value
local affect_plants = settings.startup["tree-collision-affect-plants"].value
local preserve_density = settings.startup["tree-collision-preserve-density"].value

-- A MapPosition can be written as {x, y} or {x = x, y = y}.
local function unpack_position(position)
  if type(position) ~= "table" then return nil end
  local x = position.x or position[1]
  local y = position.y or position[2]
  if type(x) ~= "number" or type(y) ~= "number" then return nil end
  return x, y
end

-- Largest distance from the entity origin to an edge of the bounding box.
-- Returns nil for a box this mod does not know how to read.
local function half_extent(box)
  if type(box) ~= "table" then return nil end
  local x1, y1 = unpack_position(box.left_top or box[1])
  local x2, y2 = unpack_position(box.right_bottom or box[2])
  if not x1 or not x2 then return nil end
  return math.max(math.abs(x1), math.abs(x2), math.abs(y1), math.abs(y2))
end

local function shrink(entity, box_size)
  local original = entity.collision_box
  local original_half = half_extent(original)
  local half = box_size / 2

  -- Never grow a collision box, and skip entities that already have none.
  if not original_half or original_half <= half then return end

  -- map_generator_bounding_box and sticker_box both default to collision_box,
  -- so pin them to the original box to keep map generation and stickers vanilla.
  if preserve_density and not entity.map_generator_bounding_box then
    entity.map_generator_bounding_box = original
  end
  if not entity.sticker_box then
    entity.sticker_box = original
  end

  entity.collision_box = {{-half, -half}, {half, half}}
end

for _, tree in pairs(data.raw["tree"] or {}) do
  shrink(tree, tree_box_size)
end

-- "plant" is a child of "tree" (Space Age): the plantable Nauvis tree and the
-- Gleba fruit trees live here, and they are stored separately from data.raw.tree.
if affect_plants then
  for _, plant in pairs(data.raw["plant"] or {}) do
    shrink(plant, plant_box_size)
  end
end
