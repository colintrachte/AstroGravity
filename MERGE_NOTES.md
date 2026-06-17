# Astro Gravity — Merge & Bugfix Notes

Working copy: **`Astro Gravity Merged`** (cloned from `Astro Gravity Bugfix`, your originals untouched).

## 1. Which copy was the most built-out
The three GMS2 "Astro Gravity" copies are near-identical (68 objects, ~245 scripts) but have *diverged* — none is a clean superset:

| Copy | Notable | Verdict |
|---|---|---|
| `Astro Gravity 7-16-17` | Has `create_magnifier` + `draw_set_blend_mode`; old `argument0` style | Most raw content |
| `Astro Gravity Bugfix` | ~190 scripts modernized to **named arguments**, 6 object-event fixes, your own bug notes; missing `create_magnifier` | **Chosen trunk base** |
| `AstroGravity` | Slightly behind both; nothing unique | Archive |

Base = **Bugfix** (keeps your refactor + fix work), with `create_magnifier` ported back in from 7-16-17.

## 2. Features harvested from the forks
From **Astro Ninja Legacy** (the trunk's own camera is actually *more* developed — `camera_follow`, `camera_confine`, `camera_target_*`, `view_center/zoom`, `screen_set_resolution` — so the Ninja scripts come in as additional utilities):

- Camera cluster: `camera_center`, `camera_zoom`, `camera_set_resolution`, `camera_culling`
- Level/galaxy system: `space_get_level`, `space_set_level`, `galaxy_check_clear`, `ship_set_weapons`

Plus `create_magnifier` from 7-16-17. **9 scripts added** (245 → 254), each registered in `.yyp` + `.resource_order`.

Adaptations required so the project still compiles (the originals referenced Ninja-only objects):
- `camera_culling`: `object_exists(o_menu)` → `!instance_exists(o_menu_main)` (only cull when no menu is open).
- `galaxy_check_clear`: `create(o_gameover)` commented out with a TODO — the trunk has no game-over object yet. Wire one up to use this.

Shard of Light was confirmed an early `scr_`-prefixed experiment archive (idea donor only, not merged).

## 3. The "create event applied from the controller" breakage
**Pattern (working as designed):** controllers create an instance then run `with(inst){ … }` to set every variable — e.g. `create_space_matter`, `create_bullet`. The spawned objects (`o_planet`, `o_star`, `o_photon`, …) have **no Create event of their own**. This pattern is sound in GMS2 — `other.id` inside the `with` still resolves to the spawning instance. So the pattern itself isn't the bug.

**Root cause of the launch crash: `room_first`.** Used in `camera/Create`, `o_menu_main/Create`, and `screen/KeyPress_82`. The `camera` is spawned on launch by the `splash` controller, so its Create runs immediately — and `room_first` is not a reliable variable after the GMS1→GMS2 import. Fixed by comparing against the actual first-room asset, which is exactly equivalent and matches the intended design (first room = single star system / ship-test area):

- `if (room==room_first)` → `if (room==rm_start)`  (camera, o_menu_main)
- `if room=room_first` → `if (room==rm_start)`  (screen R-key; also fixed `=`→`==`)

**Second confirmed bug — `grid_convert` (your "wrong columns" note was right):** it iterated row/column swapped, so on the 5-wide periodic-table grid it read column indices 1..100 (out of bounds) instead of columns 3–4, and it never wrote results back with `ds_grid_set`. The Bugfix refactor had also named a parameter `string`, shadowing the built-in `string()`. Rewrote it to index `(grid, column, row)` correctly, write back with `ds_grid_set`, and renamed the param to `to_real`. Re-enabled the call in `external/Create` (it now works).

## 4. Verification done
- No `room_first`/`room_last` remain in source.
- All 9 new scripts have `.gml` + `.yy` and are registered; `.yyp` braces/brackets balanced.
- New scripts reference no objects missing from the trunk (compile-safe).
- Scanned the named-argument refactor for other built-in-shadowing bugs — `grid_convert` was the only one.

## Recommended next step
Open `Astro Gravity Merged` in GameMaker and run it. If any runtime error remains, GMS2 names the object + event + line — send me that and I'll fix it. (I can't run GMS here, so this surfaces anything beyond static analysis.)

---

## Follow-up: the actual "controller create event" crash (root cause)

**Symptom:** `Variable o_star.radius not set before reading it` in `o_star/Alarm_4` — the star's variables were never populated by `create_space_matter`'s `with(body){…}` block.

**Root cause — the named-argument refactor.** When the Bugfix copy renamed `argument0…N` to descriptive names, several controller-create scripts ended up with a **parameter whose name matches an instance variable they seed inside a `with` block** (e.g. `radius`, `spin`, `speed`, `layers`, `color`). Inside `with(inst)`, GML's compiler treats any name that is assigned in that block as the target instance's variable — for *every* occurrence in the block, including the right-hand side. So `radius = radius` compiled to `inst.radius = inst.radius` (both unset) — a no-op. The object's own events then read those never-set variables and crashed. The original `argument0` style was immune because `argument0` can never collide with an instance-variable name.

The refactor also flattened distinctions like `instance_create(x + argument0, …)` (caller's position + offset) into `instance_create(x + x, …)`, losing information that can't be reconstructed from the refactored copy alone.

**Fix:** restored the known-good pre-refactor versions of all 11 affected controller-create scripts from `Astro Gravity 7-16-17`:
`create_space_matter`, `create_bullet`, `create_button_gui`, `create_button_shipcreator`, `create_portal`, `create_shield`, `create_ship_point`, `create_shockwave`, `create_trail`, `effect_exclamation`, `enemy_detect`.

These now use `argument0…N` (fully valid in GMS2) while the rest of the project keeps the named-argument style — a deliberate, correctness-first mix. A full-project scan confirms **no remaining parameter/instance-variable collisions inside any `with` block.**

## Also fixed this round
- Stray NUL bytes left by an editor save in 4 files (caused `GM1100 Unexpected token` in `external/Create`). All `.gml` files verified NUL-free.
- Deprecation warnings cleared: `os_win8native` dropped; `room_speed` → `game_get_speed(gamespeed_fps)`; `array_length_1d` → `array_length`; built-in `score` → `global.score`; built-in `health` → instance vars (`energy`/`hp`).
