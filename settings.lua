data:extend({
  {
    type = "double-setting",
    name = "tree-collision-tree-box-size",
    setting_type = "startup",
    default_value = 0.1,
    minimum_value = 0,
    maximum_value = 2,
    order = "a"
  },
  {
    type = "bool-setting",
    name = "tree-collision-affect-plants",
    setting_type = "startup",
    default_value = true,
    order = "b"
  },
  {
    type = "double-setting",
    name = "tree-collision-plant-box-size",
    setting_type = "startup",
    default_value = 0.1,
    minimum_value = 0,
    maximum_value = 2,
    order = "c"
  },
  {
    type = "bool-setting",
    name = "tree-collision-preserve-density",
    setting_type = "startup",
    default_value = true,
    order = "d"
  }
})
