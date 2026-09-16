# Tree Collision

A Factorio mod that makes the collision boxes for trees much smaller, so you can walk
straight through dense forests.

Originally by **skomick** — [mods.factorio.com/mod/tree_collision](https://mods.factorio.com/mod/tree_collision).
This repository holds the version updated for **Factorio 2.1**.

## What it does

In `data-final-fixes`, every `tree` prototype (and, optionally, every Space Age `plant`
prototype) has its `collision_box` replaced with a small square — 0.1 × 0.1 tiles by
default, down from roughly 0.8 × 0.8 in vanilla. Running in final fixes means trees added
by other mods are covered too.

Selection boxes are left alone, so trees are still mined, shot and selected exactly as
before — only the physical obstruction shrinks.

## Caveats

- Biters can travel through forests just as easily as you can.
- The shotgun is much less effective at clearing trees. Use grenades or a car.
- Lowering the planted-tree size also lets you hand-plant trees closer together.

## Settings

All settings are startup settings.

| Setting | Default | Effect |
| --- | --- | --- |
| Tree collision box size | `0.1` | Width and height, in tiles, of the new collision box for naturally generated trees. `0` removes tree collision entirely. |
| Also shrink planted trees | `on` | Applies the same treatment to Space Age `plant` prototypes — the plantable Nauvis tree and the Gleba fruit trees. |
| Planted tree collision box size | `0.1` | Same as above, for `plant` prototypes. |
| Preserve forest density | `on` | Keeps the original box for map generation only, so generated forests stay as dense as vanilla. |

Trees whose collision box is already smaller than the configured size are left untouched.

## Notes on the 2.1 update

- `factorio_version` is now `2.1`; mods built for `2.0` are not loaded by Factorio 2.1.
- Space Age added the `plant` prototype (a child of `tree`) in `data.raw.plant`, which is a
  separate table from `data.raw.tree`. Without handling it, Gleba's forests and planted
  Nauvis trees kept their full collision boxes.
- `map_generator_bounding_box` and `sticker_box` both default to `collision_box`. Shrinking
  `collision_box` alone therefore packed generated forests tighter than vanilla and shrank
  the area where fire and poison stickers show on a tree. Both are now pinned to the
  original box (map generation only when *Preserve forest density* is on).

## Compatibility

Because the changes land in `data-final-fixes`, this mod runs after collision-box mods such
as Squeak Through. If another mod already shrinks tree collision boxes below the configured
size, this mod leaves those trees as they are.

## License

MIT — see [LICENSE](LICENSE).
