local Recipe = require("stdlib/data/recipe")

--[[Recipes]]--
local recipe = {
    type = "recipe",
    name = "py-asphalt",
    category = "crafting-with-fluid",
    enabled = false,
    ingredients =
    {
        {type="fluid", name="water", amount=10},
        {type="item", name="coal", amount=3},
        {type="item", name="stone", amount=5},
    },
    result = "py-asphalt",
    requester_paste_multiplier = 4,
}

-------------------------------------------------------------------------------
--[[Items]]--
local item = {
    type="item",
    name="py-asphalt",
    icon="__pyindustry__/graphics/icons/py-asphalt-icon.png",
    flags={"goes-to-main-inventory"},
    subgroup = "py-tiles",
    order = "a-asphalt",
    stack_size = 500, default_request_amount = 150,
    place_as_tile = {result = "py-asphalt",condition_size = 2,condition = { "water-tile" }}
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity = {
    type = "tile",
    name = "py-asphalt",
    needs_correction = false,
    minable = {hardness = 0.2, mining_time = 0.5, result = "py-asphalt"},
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = {"ground-tile"},
    walking_speed_modifier = 1.4,
    layer = 61,
    variants =
    {
        main =
        {
            {
                picture = "__pyindustry__/graphics/tiles/py-asphalt/py-asphalt1.png",
                count = 16,
                size = 1
            },
            {
                picture = "__pyindustry__/graphics/tiles/py-asphalt/py-asphalt2.png",
                count = 4,
                size = 2,
                probability = 0.39,
            },
            {
                picture = "__pyindustry__/graphics/tiles/py-asphalt/py-asphalt4.png",
                count = 4,
                size = 4,
                probability = 1,
            },
        },
        inner_corner =
        {
            picture = "__pyindustry__/graphics/tiles/py-asphalt/concrete-inner-corner.png",
            count = 8
        },
        outer_corner =
        {
            picture = "__pyindustry__/graphics/tiles/py-asphalt/concrete-outer-corner.png",
            count = 8
        },
        side =
        {
            picture = "__pyindustry__/graphics/tiles/py-asphalt/concrete-side.png",
            count = 8
        },
        u_transition =
        {
            picture = "__pyindustry__/graphics/tiles/py-asphalt/concrete-u.png",
            count = 8
        },
        o_transition =
        {
            picture = "__pyindustry__/graphics/tiles/py-asphalt/concrete-o.png",
            count = 1
        }
    },
    walking_sound =
    {
        {
            filename = "__base__/sound/walking/concrete-01.ogg",
            volume = 1.2
        },
        {
            filename = "__base__/sound/walking/concrete-02.ogg",
            volume = 1.2
        },
        {
            filename = "__base__/sound/walking/concrete-03.ogg",
            volume = 1.2
        },
        {
            filename = "__base__/sound/walking/concrete-04.ogg",
            volume = 1.2
        }
    },
    map_color = defines.color.darkgrey,
    ageing = 0,
    vehicle_friction_modifier = _G.stone_path_vehicle_speed_modifier
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
data:extend{recipe, item, entity}

Recipe("ball-mill"):add_ingredient({"py-asphalt", 50}) --ADD Asphalt to ball-mill
Recipe("py-heat-exchanger"):replace_ingredient("stone-brick", "py-asphalt")
Recipe("py-asphalt"):add_unlock("py-asphalt"):replace_ingredient("water", "tar"):replace_ingredient("coal", "ash"):replace_ingredient("stone", "gravel")