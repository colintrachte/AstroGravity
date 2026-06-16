# AstroGravity — Consolidated Design Document

> A living-world simulation set in a procedurally generated universe. The player is an animal, not a pilot, cultivating a thriving corner of the galaxy against the entropy of the void.

---

## Table of Contents

1. [Vision](#1-vision)
2. [Player Agency and Emergent Rhythms](#2-player-agency-and-emergent-rhythms)
3. [Resources](#3-resources)
4. [Locomotion and Archetypes](#4-locomotion-and-archetypes)
5. [Ecosystem](#5-ecosystem)
6. [Personality Engine](#6-personality-engine)
7. [Stars](#7-stars)
8. [Void Creatures and Dark Matter](#8-void-creatures-and-dark-matter)
9. [Death, Rebirth, and the Void](#9-death-rebirth-and-the-void)
10. [Inter-System Transit and the Corridor](#10-inter-system-transit-and-the-corridor)
11. [Social Ecosystem — Migration and Old Friends](#11-social-ecosystem--migration-and-old-friends)
12. [Terrain](#12-terrain)
13. [Events Engine](#13-events-engine)
14. [Procedural Storytelling — The Chronicle](#14-procedural-storytelling--the-chronicle)
15. [Audio and Delta Tunes](#15-audio-and-delta-tunes)
16. [Technical Architecture](#16-technical-architecture)
17. [Diegetic UX — The World Is the Interface](#17-diegetic-ux--the-world-is-the-interface)
18. [Roadmap](#18-roadmap)

---

## How to Read This Document

> **For AI agents and skimmers:** This document is long. Use this map to jump to what you need rather than reading linearly. Each section is one-line summarized below. Canonical rules other sections depend on are under "Locked Facts" — treat those as authoritative if anything elsewhere seems to conflict. Still-open decisions are under "Open Questions." Section headers are stable anchors; cross-references throughout link to them.

### Section Map (one line each)

1. **Vision** — what the game is: a living-world cultivation sim; pillars; the "art over product" stance and how pillars cash out into buildable systems.
2. **Player Agency and Emergent Rhythms** — freedom is the point; no imposed loop; the world "plays the player back"; how capability grows without a skill tree.
3. **Resources** — the spirit/biomass/metal triad as a classification language; triangle-inequality cap; **Energy** as a separate free-regenerating tank; composition vs. cargo; authoritative death rules; material drifting.
4. **Locomotion and Archetypes** — Bird / Fish / Land Animal balance; Fish includes Worm + Snake sub-types; bugs as a cross-archetype modifier; planet building.
5. **Ecosystem** — color/visual language; entity classification; keystone species; ecological succession; the attraction dynamic; indirect combat; collapse.
6. **Personality Engine** — needs/states/traits/perks gated by spirit; "Meaning" as a behavioral filter not a stat; player personality emerges from play.
7. **Stars** — stars as infrastructure; light as protection; star feeding; Stellar Indigestion failure mode; the full lifecycle through supernova → nebula → new star.
8. **Void Creatures and Dark Matter** — dark matter from the spirit fraction at death; void creatures as entropy; utility-AI "intelligence"; void archetype counterparts.
9. **Death, Rebirth, and the Void** — rebirth from the ecosystem; **membership** (with concrete mechanics); 100% loss on void death.
10. **Inter-System Transit and the Corridor** — transit conditions; the corridor mini-game; arrival/wake-harvest; relationship to the zoom-out departure gesture.
11. **Social Ecosystem — Migration and Old Friends** — NPCs migrate systemically; feed-vs-consume loyalty; Family-Hash lineages; memory as the emotional core.
12. **Terrain** — destructible world; "for every destroyed thing, a rebuild path"; passive NPC repair; building rewarded over destroying.
13. **Events Engine** — secondary to emergence; weather to the ecosystem's climate; storyteller pacing layer; event categories.
14. **Procedural Storytelling — The Chronicle** — optional, first-class narrative layer that *recognizes and voices* stories the simulation already tells; no quests, no chores; allowed to be funny; ignorable without penalty.
15. **Audio and Delta Tunes** — state-driven music as diegetic UI; key-signature health; transit crescendo; scope discipline (parameters, not custom middleware).
16. **Technical Architecture** — Unity DOTS; galaxy-wide-but-tiered simulation; zoom-as-spatial-interface; CPU-authoritative light; core systems to port.
17. **Diegetic UX — The World Is the Interface** — no meters/tutorial; saturation made physical; success signals and milestone moments as the replacement for score.
18. **Roadmap** — current GameMaker state and phased build order 0–10, with scope-discipline warnings.

### Locked Facts (canonical; other sections defer to these)

- **Three foundational resources** — spirit, biomass, metal. **Energy is NOT a fourth foundational resource**; it is a separate, free-regenerating action tank. Spending the triad is potent, expensive, and not auto-refunded; spending energy is routine and refills on its own. (§3)
- **Triangle inequality** — no resource may exceed the sum of the other two; enforced by ecological world-response, not UI. (§3)
- **Death splits by fraction** — dark matter comes from the **spirit** fraction of composition (the hazard); recoverable solid debris from the **metal** fraction (the windfall); cargo scatters as loose resources. Spirit drives dark matter, not metal. (§3 authoritative; §5/§8/§9 defer)
- **Three archetypes** — Bird, Fish, Land Animal. **Worm and Snake are Fish sub-types**, not separate archetypes (shared sinusoidal locomotion). Bugs modify every archetype. (§4)
- **Light is CPU-authoritative** — light/shadow truth is computed on the CPU (Burst raycasts) and mirrored to the GPU for display; never read back from a GPU pass for gameplay. (§16)
- **Galaxy is simulated whole, but tiered** — a lightweight model stays alive galaxy-wide so the world changes in the player's absence; detailed compute concentrates where the player is. True N-body is major-bodies-only. (§16)
- **Travel** — leaving a system is a continuous zoom-out to the galaxy map; a safe crossing still requires a transit condition; the corridor is an active survival mini-game; void death = 100% loss + random respawn. (§9, §10)
- **No imposed objective or loop** — freedom is the design goal; the world responds richly enough to suggest the next move without dictating it. (§2)
- **Diegetic UX** — no health meters, no tutorial, no score; state is expressed through world behavior, color, movement cadence, and music. (§17)
- **Storytelling never assigns chores** — the procedural storytelling layer recognizes and voices emergent stories; it has no quests, objectives, trackers, or completion rewards, and is fully ignorable without penalty. Any future "narrative" feature must respect this. (§14)

### Open Questions (flagged, not yet decided)

- **Spirit overload** — spirit governs a lot (intelligence, dark matter, evolution, migration pressure). Watch for optimization-collapse in Phase 5–6; fix by redistributing spirit's *jobs* onto biomass/metal, not by adding a foundational axis. (§3)
- **How far galaxy-wide simulation scales** — how many systems stay in the lightweight model vs. cheapest statistical drift is a profiling/tuning question. (§16)
- **Fish long-term habitat** — gas-giant/nebula/fluid specifics beyond the current space-fish model are a later pass. (§4)
- **Multi-agent / faction reputation** — deliberately excluded for now; if ever explored, must express ecologically, not as menus. (§9)

---

## 1. Vision

### What This Game Is

AstroGravity is a living-world simulation set in a procedurally generated universe. The player is an animal — not a pilot — navigating an ecosystem. The goal is not to win. It is to cultivate a thriving corner of the universe: claiming, guarding, and growing resources, creatures, and structures, and managing the ecological relationships that sustain or destroy them.

The world is alive with procedurally generated plants, animals, and phenomena that form ecosystems around each star system. The player's ship is patterned after a real animal — a bird, a worm, a fish — and behaves accordingly. Different animal types inhabit different environments and require fundamentally different ways of moving through the world.

### What This Game Is Not

- It is not a shooter. Combat exists but is indirect: you grow or build things that fight for you.
- It is not an inventory manager. Resources are condensed to three types, and items live in the game world rather than a bag. You cannot hoard.
- It is not a product designed for mass appeal. It is a work of art, complete on its own terms.

### Core Design Pillars

**Biomimicry over abstraction.** Everything in the game — movement, combat, resource flow, creature behavior — is modeled on how living systems actually work. The game rewards players who think ecologically.

**Cultivation over combat.** The primary verbs are claim, grow, and tend. Fighting is a consequence of neglecting those verbs, not the main event.

**Procedural life over scripted content.** The world generates itself. No two playthroughs have the same star systems, ecosystems, or creature distributions.

**Adaptive simulation over fixed platform targets.** The game runs as rich as the hardware allows, gracefully reducing simulation density rather than hard-targeting a single tier. A thriving world on high-end hardware; a quieter but coherent one on modest hardware.

**Art over product.** The measure of success is whether the game resembles a thriving sandbox teeming with life and struggle — not whether it ships with a tutorial and a Steam page.

> **From pillars to build targets.** A pillar is a north star, not a task — a programmer cannot implement "art over product" directly. Each pillar therefore cashes out into concrete, buildable systems, and every feature should trace back to one: *biomimicry* → ecological succession, keystone species, real resource cycles; *cultivation over combat* → indirect/autonomous defense, the attraction dynamic; *diegetic UX* → no meters, no tutorial, state expressed through world behavior, sound, and silhouette; *procedural life* → galaxy worldgen, procedural creatures and music; *art over product* → the absence of onboarding scaffolding and score, expressed as ecosystem success signals and milestone moments instead (see [Diegetic UX](#17-diegetic-ux--the-world-is-the-interface)). If a proposed feature doesn't trace to a pillar, question it.

### The Feeling

A player who is doing well should feel like a careful gardener in a dangerous wilderness — aware of what they've built, aware of what could dismantle it, making deliberate choices about what to protect and what to sacrifice. A player who is doing poorly should feel the ecosystem withdrawing from them, resources thinning, threats multiplying, their foothold in the universe slowly contracting.

Destroying a planet is always an option. It is never a good one.

### On Long-Horizon Purpose (Optional Focal Point)

The sandbox is goalless by design, and that is deliberate. For players who want a distant horizon to move toward, the world offers an *optional* focal point rather than a mandated objective: the void is a permanent pressure, and a player may choose to cultivate a connected network of stable, high-spirit, well-lit systems that hold the void back across a region of the galaxy. This is a self-authored ambition the systems support — not a win screen, not a quest, and never a precondition for play. The story remains the ecosystem's.

---

## 2. Player Agency and Emergent Rhythms

> **Quick reference:** The player is given wide freedom; the world responds. There is no imposed objective or mandated loop. The "loops" below are *rhythms the systems make available*, not a structure the player must follow. The design goal is a game that **plays the player back** — that reacts to whatever they choose to do with consequences rich enough to suggest their own next move.
>
> This section describes the *player* (what they can do, how they grow); the rest of the document describes the *simulation* that responds to them.

### Freedom First — The Game Plays the Player Back

AstroGravity does not hand the player a goal, a quest chain, or a verb cycle they must repeat. It hands them a body in a living world and lets them decide what matters. One player cultivates a single system into a paradise and never leaves. Another roams, seeding worlds and moving on. Another tears systems apart to see what happens, and lives with a galaxy that increasingly treats them as a threat. None of these is the "correct" way to play.

What makes this work — what keeps freedom from becoming aimlessness — is that **the world plays back.** Every action lands in a system of consequences dense enough that the world's *reaction* becomes the next prompt. Feed a system and it thickens with life that then attracts predators you must reckon with. Neglect one and watch it slowly forget you. Kill a keystone and feel the cascade. The player is never told what to do next; the world's response to what they just did is always suggestive enough that they don't need to be. This is the difference between a game with an imposed loop and a game that is *responsive* — the latter is the goal.

### Rhythms the World Makes Available (Not Imposed)

Because the systems interlock, certain natural rhythms tend to *emerge* when a player engages with cultivation. A player may fall into this cadence, ignore it, or invent their own — it is descriptive, not prescriptive:

```
   observe  ~  diagnose  ~  act  ~  stabilize  ~  reach further
   (the world offers this rhythm; the player is free to refuse it)
```

- **Observe** — read a system through its diegetic signals (color, movement cadence, the music's state, where creatures gather, where light fails). See [Diegetic UX](#17-diegetic-ux--the-world-is-the-interface).
- **Diagnose** — notice an imbalance: a missing pollinator, metal-poor soil, a parasite bloom, a dark-matter pocket, a keystone under threat.
- **Act** — move, feed, plant, introduce a species, redirect a predator, feed the star, cultivate a defender. Action is almost always *ecological*, rarely direct force.
- **Stabilize** — watch the system absorb the action and learn whether the read was right.
- **Reach further** — a stable system frees attention and opens reach: new planets, species to carry, a transit window to somewhere new.

This rhythm is one the world *affords*, the way a garden affords tending. A player who would rather wander, hoard, demolish, or simply watch is playing the game correctly. Combat, when it happens, is usually the consequence of an imbalance left to grow — not a separate mode the player is pushed into.

### What the Player Can Do — Three Time Horizons

These describe how the experience tends to *open up*, not a track the player is placed on.

**First few minutes — locomotion and legibility.** The player inhabits their archetype's body and learns to move: the rhythm of wingbeats, the oscillation of a tail, the grip of a surface. They read the immediate environment — what's alive, dangerous, edible, where the light is. The opening is *kinesthetic and perceptual*: master the body, learn to read the world. No menus, no objectives — the world's legibility is the only tutorial.

**First hour — the first real interaction with the living world.** Most players will, on their own, find something they want to change — a barren patch, a struggling species, a herbivore population with nothing to eat — and act on it, then watch the system respond. The arc tends to run *from passenger in a system to participant in it*, and its first emotional payoff is usually an [ecosystem success signal](#17-diegetic-ux--the-world-is-the-interface): the world visibly thickening with life because of something the player did. The first [milestone moment](#ecological-milestones--progression-without-numbers) often lands here — but a player who spends the hour exploring or experimenting instead has lost nothing.

**First ten-plus hours — reach and emergence.** Capability deepens not through a skill tree but through *accumulated ecological and personal state*: membership in several systems, traits evolved from how they've actually played, a roster of cultivated and bonded creatures, the ability to make or ride transit windows, the first crossing, the first planet built, the first reunion with a migrated lineage. The galaxy stops being isolated systems and becomes a *network with a personal history*. Growth is the widening of reach and the thickening of relationships — not a rising number.

### How Capability Deepens (Growth Without a Tree)

The player grows more capable through diegetic vectors, none of which is an XP bar:

- **Body composition.** Consuming loot raises the player's own spirit/biomass/metal, letting them survive harsher environments and access new forms. Bounded by the [triangle inequality](#the-triangle-inequality-resource-cap) — no infinite specialization.
- **Energy.** A separate, free-regenerating tank that fuels ordinary actions and abilities (see [Resources → Energy](#energy--the-free-regenerating-tank)). It is the routine fuel; the triad is the potent, expensive reserve.
- **Evolved traits and perks.** Behavior accrues into [personality traits and perks](#6-personality-engine). How you play *is* your build.
- **Ecological capital.** Membership, cultivated populations, bonded companions, established migration routes, defensible terrain — all are power, and all can be lost.
- **Reach.** Learning to open, induce, and survive [transit](#10-inter-system-transit-and-the-corridor) expands the playable galaxy.

The crucial property: **every one of these is reversible.** A bad death, an ecological collapse, a lost keystone, or a reckless crossing can set the player back. Growth that can erode is what keeps the cultivation fantasy honest — you tend something that can wither, not fill a bar that only rises.

### The Responsiveness Test for Any New Feature

A feature earns its place not by fitting a prescribed loop but by *deepening the world's response to player choice*: does it give the player a new way to affect the world, or give the world a new, legible way to react to them? Systems that enrich the simulation but never surface to the player — never become something they can perceive, affect, or be affected by — belong in the background tier, not in active development.

---

## 3. Resources

### The Three Resources

AstroGravity uses three resources — spirit, biomass, and metal — not as items to collect and spend, but as a classification language for everything in the game world. Every entity, every object, every creature is defined by its ratios of these three properties.

| Resource | Represents |
|----------|------------|
| Spirit   | Sentience, intellect, agency |
| Biomass  | Organic material, life, growth |
| Metal    | Inorganic structure, hardness, rigidity |

### Classification Matrix

The ratios of these three resources define what something *is*:

| High | Low | Result |
|------|-----|--------|
| Biomass | Spirit | Plant |
| Biomass + Spirit | — | Predator / animal |
| Metal + Spirit | — | Robot / intelligent machine |
| Metal | Spirit | Rock / simple tool |

This is not a crafting table. It is a reading system. Players learn to identify entities in the world by observing their resource signatures, and make decisions accordingly.

> **Open design risk — spirit is load-bearing for too much.** Spirit currently governs intelligence, agency, personality complexity, dark-matter production, evolution toward robots, social/migration pressure, and more. When a single resource silently controls everything that matters, players may discover it is *the* resource to optimize, and the triad collapses into a one-axis game. This is flagged to watch during Phase 5–6 playtesting, not solved here. Note that **Energy** (below) is *not* the fix for this and is *not* a fourth foundational resource — it is a separate, free-regenerating action tank, not part of the classification triad. If spirit-overload proves real in testing, the remedy is to move some of spirit's *jobs* onto biomass or metal where they fit ecologically, not to add a new foundational axis.

### Anti-Inventory Design

Items do not live in a bag. They live in the game world. You cannot stockpile resources beyond what you actively hold or have embedded in structures and creatures you've built. This is intentional:

- It prevents hoarding and forces prioritization.
- It keeps the save state lean.
- It keeps compute focused on the living world rather than off-screen inventories.
- It makes loss meaningful. Losing a creature or structure means losing the resources embedded in it.

### The Triangle Inequality (Resource Cap)

No single resource can exceed the sum of the other two:

- Spirit ≤ Biomass + Metal
- Biomass ≤ Spirit + Metal
- Metal ≤ Spirit + Biomass

This is the triangle inequality applied to entity development. The three values must always be capable of forming a valid triangle. It means no entity — player, creature, or construct — can be infinitely specialized in one direction. To grow further in any resource, you must also grow in the others.

When a resource hits its cap, the world signals it ecologically rather than through UI: plants stop yielding, deposits go inert, spirit-generating creatures become indifferent. The constraint is legible through the behavior of the ecosystem, not a stat screen. (See [Diegetic UX](#17-diegetic-ux--the-world-is-the-interface) for the visual/physical expression of resource saturation.)

The practical effect is that all entities are readable as combinations of all three resources, and extreme specialization requires extreme overall development. A maximally intelligent entity is also necessarily large and materially substantial. A creature of pure biomass cannot exist.

### Energy — The Free-Regenerating Tank

Spirit, biomass, and metal are the three *foundational* resources — the classification language every entity is made of. **Energy is not one of them.** Energy is a separate tank of gas: a regenerating pool that fuels ordinary actions and abilities and then **refills for free over time** when spent. It does not participate in the classification matrix, the triangle inequality, or composition/cargo. It is action fuel, not identity.

The design purpose of energy is to give the player a constant, low-stakes resource for routine activity while keeping the triad precious:

- **Energy powers the routine.** Normal locomotion effort, ordinary abilities, and everyday interactions draw from the energy tank. Because it regenerates for free, the player is never permanently taxed for simply playing — moving, foraging, and acting moment-to-moment stay frictionless.
- **The triad powers the potent.** Spending points *from the triad itself* — burning spirit for a bird's gravity manipulation, expending biomass or metal to feed a star or charge a portal — is **far more potent but genuinely expensive.** Those points do not come back for free; they are drawn from what the entity *is* or *carries*, and must be regrown, gathered, or recovered.

This split gives the game two clearly different cost tiers. A player flicks energy constantly without thinking about it, the way a real animal expends ordinary effort. But when they reach for the triad — slingshotting between stars, inducing a flare, building a planet — they are spending something that matters, and they feel it. The regenerating tank keeps minute-to-minute play fluid; the expensive triad keeps the big, world-shaping actions weighty.

> **Prototype note.** The GameMaker build already has an energy system; it is the natural seed of this tank. The port should preserve free regeneration for routine actions and reserve triad expenditure for high-potency, non-refunding abilities.

### Composition vs. Cargo — Two Separate Ratios

Every entity has two distinct resource ratios that must not be confused:

**Composition** is what the entity is *made of* — the ratio of spirit, biomass, and metal baked into its physical structure. Composition determines appearance, capabilities, playstyle, and what happens when the entity dies. It is established at creation or birth and changes slowly if at all over a lifetime.

**Cargo** is what the entity *carries* while alive — resources gathered, absorbed, or accumulated during its life. Cargo is dynamic. It changes constantly. A creature grazing in a biomass-rich field accumulates biomass cargo. A creature mining an asteroid accumulates metal cargo. The player accumulates cargo through everything they do.

These are independent. A metal-composition robot can carry mostly biomass cargo. A biomass-composition animal can carry a load of metal it mined. Composition says what you are; cargo says what you're holding.

### What Happens at Death — Authoritative Rules

> This is the single source of truth for death mechanics. The Ecosystem, Void, and Death/Rebirth sections describe the *consequences* of these rules but do not redefine them; where they touch on death they cross-reference here.

Death splits the entity's resources along its two ratios — composition and cargo:

1. **Dark matter** is produced from the **composition's spirit fraction.** The animating intelligence that organized the entity destabilizes when it dies. A simple plant or rock leaves almost none; a complex, high-spirit creature or construct leaves significant quantities. Dark matter is a void-creature signal (see [Void Creatures and Dark Matter](#8-void-creatures-and-dark-matter) for its physics and behavior).
2. **Recoverable solid debris** is produced from the **composition's metal fraction.** Metal governs how much of the body survives death as solid matter that persists, drifts, and can be reclaimed (see [Material Drifting](#material-drifting-and-accretion)). A high-metal robot leaves a substantial wreck; an organic creature leaves little.
3. **Cargo** is released directly into the surroundings — scattered as loose resources available to scavengers, decomposers, and nearby plants.

The remainder of all three is lost — dissipated, inaccessible.

> **Canonical note — spirit vs. metal at death.** Spirit drives *dark matter* (the hazard); metal drives *recoverable debris* (the windfall of structure). These are deliberately separated so the two resources do distinct ecological work. The most dangerous deaths are the most intelligent ones — the expensive ones — not merely the most armored ones.

The net effect is that every death is a small ecological event. Cargo release and metal debris attract scavengers and decomposers, generating a flurry of positive activity around the corpse. Dark matter generation attracts void creatures if it accumulates. A carcass is simultaneously a resource windfall and a hazard signal — just as in the real world.

### Material Drifting and Accretion

Resources released at death — and debris from destroyed bodies — do not sit still forever. Loose matter drifts, clusters, and accretes: scattered metal debris from a destroyed robot pulls together into small artificial debris clusters; matter caught in a planet's gravity well eventually descends into its atmosphere and alters the surface resource ratios where it lands.

> **Performance note — N-body is for major bodies only.** True N-body gravity is reserved for stars, planets, moons, and large asteroids. Debris, loose cargo, corpses, resource packets, and dark matter do **not** each participate in full N-body — there could be thousands of them, and full pairwise simulation would collapse the frame budget. Instead, small loose matter responds to **influence fields** (sampled from the major bodies' aggregate gravity) and **chunk aggregation** (nearby loose matter merges into representative clusters that drift as one). The result reads as physical accretion without the cost. See [Technical Architecture](#16-technical-architecture).

This closes a loop. A high-metal entity destroyed in orbit slowly seeds the planet below with metal. A debris field left from a battle becomes, given enough time and favorable gravity, the raw material for a bird's planet-building or an asteroid's natural reformation. Nothing is permanently sequestered; everything circulates, and the circulation is physical, not bookkeeping.

### Resource Flow

Resources flow through the ecosystem. Biomass comes from plants and organic matter. Metal comes from asteroids, moons, and debris. Spirit is generated by living creatures with sufficient complexity — and consumed by building things that require intelligence to operate.

The composition-cargo distinction means resources are always in motion: gathered into cargo by living creatures, embedded into composition over time, and released back into the environment at death. Nothing is permanently sequestered. Everything circulates.

Destroying a planet or star collapses the resource flows it was supporting. The loss is not a score penalty. It is ecological: the creatures that depended on it begin to die, the structures stop regenerating, and the player's foothold in that system slowly fails.

---

## 4. Locomotion and Archetypes

### Overview

The player's archetype is their animal type. It determines physics, locomotion style, habitat, transit options, carrying capacity, offensive capability, and role in the broader ecosystem. Archetypes are not cosmetic — they are fundamentally different ways of existing in the world.

All archetypes share two baseline abilities: **seed planting** and **planet hopping**. Seeds are how ecosystems spread between worlds within a system. Planet hopping is the basic intra-system travel all archetypes can achieve by building sufficient momentum. All archetypes can also evolve traits over time that make travel easier or expand their capabilities.

A **bug variant** exists for every archetype. Bugs are a subcategory, not a separate archetype — they share the parent archetype's physics and transit options but are smaller, more numerous, better at seed dispersal and cross-pollination, and often capable of swarm behavior.

### The Balance — Rock, Paper, Scissors

The three archetypes are designed to offset each other's weaknesses:

- **Bird** — fastest and most maneuverable. Excellent explorer and pioneer. Fragile, low capacity, limited offense. The void's speed makes them the safest starting choice.
- **Fish** — slowest but highest capacity. Cargo haulers and resource movers, and masters of fluid and semi-fluid environments. Tough and hard to kill. Transit-dependent but not transit-limited in the same way as land animals.
- **Land Animal** — most powerful within a system. Strongest offense and defense. Effectively immobile between systems without enormous resource investment.

No archetype is strictly better. Each creates a different kind of play.

### Bird

**Habitat:** Open space, upper atmospheres.

**Locomotion:** Two wing keys, one per wing. Flapping both generates forward thrust. Asymmetric flapping steers. The rhythm and timing of wing input determines speed and direction. Conventional thrust controls are available but carry speed and maneuverability penalties.

**Signature Ability — Gravity Manipulation:** Birds can burn spirit points to generate a localized gravity field around themselves. Two uses:

*Slingshot travel:* By generating gravity and then releasing it at the right moment, birds can accelerate far beyond their normal locomotion maximum and slingshot between star systems. This is the primary bird method of inter-system travel. The void is dangerous but birds are fast enough that void creatures struggle to catch them — making bird the recommended starting archetype for exploration.

*Mass aggregation:* The same gravity field can pull nearby asteroids, debris, and other matter toward the bird and hold them together. If enough mass is gathered and held long enough, it coalesces into a new planetary body. The composition of the gathered material determines the new planet's attributes (see [Planet Building](#planet-building)).

**Transit:** Slingshot via gravity manipulation. Natural transit windows (stellar alignments, comet paths). Birds can also ride void-adapted creature migrations. Birds and bug-birds are the primary seed carriers for cross-pollination between systems.

**Trade-offs:**
- Low carrying capacity. Cannot haul significant resources.
- Small energy reserve. Gravity manipulation is expensive; sustained use depletes quickly.
- Fragile. High damage from collisions and attacks. In the [transit corridor](#10-inter-system-transit-and-the-corridor), a single hard kinetic hit can be catastrophic.
- Limited or no direct offensive capability. Combat means finding ways around this limitation.

**Bug variant — Bumblebee:** Small, highly maneuverable, excellent seed carrier. Gravity ability is weak but energy-efficient. Often travels in swarms. The most effective cross-pollinator in the game.

### Fish

Fish are the masters of fluid and semi-fluid environments — whether that fluid is open space, a nebula, a dense gas-giant atmosphere, a liquid ocean, or literal planetary soil. All fish-type creatures share the same core locomotion: **sinusoidal rhythm movement** driven by alternating left/right inputs that propagate a wave along the body. Rhythm controls speed; timing controls direction. What differs between sub-types is the *friction medium* they're optimized for and the ecological role that follows from it.

**Role (shared):** Where birds are scouts and pioneers, fish are the freight network and the environment-shapers. They move large quantities of resources, clean up debris fields, accumulate mass efficiently, and — in their surface and subsurface variants — reshape worlds directly.

**Transit (shared):** Fish cannot slingshot under their own power. They rely on:
- **Solar flares** — a flare always points toward a neighboring star system. Fish ride a flare's ejected matter between systems. Flares are rare but can be induced (see [Stars — Star Feeding](#star-feeding)).
- **Wormholes** — natural or player-built shortcuts. Fish are the primary users.
- **Stargates / portals** — artificial transit structures.

**Trade-offs (shared):**
- Slow. Significantly slower than birds, especially when loaded.
- High capacity. Can carry what birds cannot.
- Durable. Hard to kill. Better suited to hazardous environments — including the [transit corridor](#10-inter-system-transit-and-the-corridor), where their durability lets them shrug off wall-scrapes and minor impacts a bird could not survive.
- Better passive resource collection than birds.

#### Fish Sub-Types — The Fluid Dynamics Matrix

| Sub-type | Medium / Friction | Ecological Role |
|---|---|---|
| **Space Fish** (classic) | Open space, nebulae, gas-giant atmospheres. Low friction, high velocity. | Cargo hauling and heavy garbage collection. High payload capacity. The freight network. |
| **Worm** (subsurface) | Planetary dirt and stone, treated as ultra-high-friction fluid. | Subsurface extraction and decomposer routing. Drills through planetary crusts using sinusoidal rhythm, releasing deep metal and biomass deposits to the surface. Burrowing is its locomotion. |
| **Snake** (surface / atmospheric) | Planetary surfaces, dense flora, liquid oceans. Mid-friction. | Apex ambush constriction. Lacks the heavy armor of land animals but uses hyper-flexible physics to coil around prey or constrict parasites. Bridges surface and shallow-fluid environments. |

This taxonomy resolves a long-standing inconsistency: burrowing worms and serpentine movers are not a fourth archetype and not a land-animal sub-branch — they are fish, because they share the fish's fundamental locomotion model. It also expands Fish from "space freight" into the archetype that owns *every fluid and semi-fluid medium in the game.*

**Bug variant — Crustacean:** Armored, slow, extremely high capacity. Essentially a mobile storage and processing unit. Poor traveler but excellent within a system.

### Land Animal

**Habitat:** Planetary surfaces and subsurfaces. The most powerful archetype within its home system — strongest offense, strongest defense, best at terrain interaction and surface cultivation.

**Locomotion:** Varies by specific creature type (quadruped, crawler). All land animals interact with surfaces directly — they require solid ground or planetary bodies to move efficiently. In open space they are slow and vulnerable.

**Transit — The Biological Ark:** Land animals cannot use solar flares or slingshot under their own power. Inter-system travel requires a **portal**. Each star system contains one portal, charged with a large quantity of resources — enough that the resources essentially have to be grown rather than gathered.

Crucially, using a portal does not teleport the land animal safely. It launches an ecosystem-grown, **metal-dominant biological ark capsule** through the same void transit corridor every other archetype must survive. The capsule has minimal steering but massive structural shielding — it must simply hold together until the far end. If void creatures intercept and breach the capsule mid-corridor, the land animal "dies in the void" and triggers the random-galaxy respawn, exactly as for any other archetype. This keeps the physical stakes of the void uniform across all three archetypes — no one teleports past the danger.

Intra-system travel (planet hopping) is available to all land animals through accumulated momentum.

**Trade-offs:**
- Extremely powerful in their home system. Best cultivators, defenders, terrain manipulators.
- Inter-system travel is expensive, slow to prepare, and still physically dangerous.
- Vulnerable in open space.
- Best suited to deep investment in a single system rather than exploration.

**Bug variant — Beetle:** Small, armored, excellent at burrowing and surface cultivation. Weak individually but devastating in swarms. The primary intra-system seed carrier for surface ecosystems.

### Bugs

Bugs are a subcategory of every archetype, not a separate type. Every creature can have a bug variant — smaller, more numerous, specialized for dispersal and cross-pollination.

Bugs share their parent archetype's transit options but tend toward smaller size and reduced individual power, swarm behavior (many bugs acting as a coordinated unit), superior seed carrying and cross-pollination, faster reproduction, and greater individual vulnerability offset by numbers.

The bug subcategory is what makes ecosystem spread feel organic rather than mechanical. A bird plants seeds intentionally. A bumblebee plants them as a side effect of being a bumblebee.

> **Implementation note.** Bug swarms and decomposers overlap heavily in behavior — both are large populations of small entities doing distributed processing work (seed dispersal in one case, cargo cleanup in the other). They remain *distinct design concepts* (bugs have archetype parents and disperse seeds; decomposers process death cargo and have near-zero spirit), but they should be built on a **shared swarm/micro-fauna ECS subsystem** so the engine maintains one set of flocking-and-processing behaviors rather than two. See [Technical Architecture](#16-technical-architecture).

### Seed Planting and Cross-Pollination

All archetypes can plant seeds. Seeds are the primary mechanism for spreading plant species between planetary bodies within a system. Cross-pollination between systems requires a carrier capable of inter-system travel — birds and bug-birds are the most common natural vectors; fish occasionally carry seeds when riding flares; land animals rarely cross systems and are poor cross-pollinators.

Seed planting is not a UI action. It happens as a side effect of movement, feeding, and terrain interaction. An animal that passes through a plant-rich area picks up seeds. Those seeds deposit when the animal lands, feeds, or rests elsewhere. The player encourages this passively by cultivating diverse plant populations and maintaining healthy, ranging animal populations.

Introduced seeds do not always take hold. Success depends on soil composition (terrain type and resource ratios), existing ecosystem competition, and the receiving world's conditions.

### Planet Building

When a bird uses gravity manipulation to aggregate sufficient mass, the collected material coalesces into a new planetary body. The resulting planet's attributes are determined by the composition of the gathered material:

| Gathered material | Planet attributes |
|---|---|
| Metal-rich (asteroids, debris) | High metal, dense, low initial biomass. Good mining base. Slow to develop ecosystem. |
| Biomass-rich (organic debris, dead creatures) | High biomass, fertile. Fast ecosystem development. Low structural stability. |
| Mixed | Balanced attributes. Most hospitable to diverse ecosystems. |
| Spirit-rich (remains of high-spirit creatures) | Unusual. May generate spirit-positive conditions that attract complex creatures. |

A new planet begins barren. It develops an ecosystem only if seeds arrive — carried by the bird that made it, planted deliberately, or brought by creatures attracted to the new body's gravity. The resulting world is entirely procedural, shaped by what the player gathered and what the ecosystem does with it afterward.

---

## 5. Ecosystem

### Overview

Each star system hosts a procedurally generated ecosystem: plants, animals, parasites, predators, and decomposers interacting through resource flows. The player is part of this ecosystem — not above it. Every structure built, every creature cultivated, every resource extracted has downstream effects on the living world.

The ecosystem is the game. Everything else — locomotion, combat, resources — is in service of understanding and navigating it.

### Color as Signal

Color is the primary visual language of danger and identity, following natural warning coloration (aposematism):

- **Bright, saturated colors** — warning. The entity is dangerous (not necessarily hostile).
- **Muted, earthy colors** — passive. Plants, debris, benign creatures.
- **Color encodes resource type.** Spirit-rich entities tend toward cool hues (blues, purples). Biomass-rich entities tend toward greens and yellows. Metal-rich entities tend toward grays and whites.

A player who learns to read color can identify an entity's nature, resource signature, and likely behavior before interacting with it.

### The Biomass-Metal Visual Spectrum

The ratio of biomass to metal in a creature's composition is the primary visual axis of the game — a continuous spectrum, not a binary:

- **Pure biomass** — fully organic. Soft forms, natural textures, fluid movement.
- **Biomass-dominant** — mostly organic with metallic elements (exoskeletons, bone, natural armor). Looks alive.
- **Balanced** — cyborg aesthetics. Organic and mechanical in roughly equal measure.
- **Metal-dominant** — mostly mechanical with organic remnants. Looks built but not quite finished.
- **Pure metal** — fully robotic. Hard geometry, mechanical motion, no organic softness.

Spirit cuts across this entire axis. A high-biomass, high-spirit creature is an intelligent organic animal. A high-metal, high-spirit creature is a robot or AI. A low-spirit entity at either end is a plant or a rock.

Players read this spectrum naturally. The visual language does the work — no tooltip required. (See [Diegetic UX](#17-diegetic-ux--the-world-is-the-interface) for how movement cadence reinforces this at a distance.)

### Subcategories — Bugs and Robots

Two subcategory modifiers exist across all creature archetypes:

**Bugs** — smaller, more numerous, optimized for dispersal. Every archetype has a bug variant (bumblebee, crustacean, beetle). Swarm behavior. Primary seed carriers.

**Robots** — high metal in composition, producing mechanical appearance and behavior regardless of archetype. A robot-bird looks and moves like a mechanical bird; a robot-fish is a mechanical hauler; a robot-land-animal is an armored crawler. Robots are more durable, generate more *solid recoverable debris* on death, and do not have biomass-based sustenance needs — they require metal and energy instead. They can be found, built, or evolved toward by any creature that accumulates sufficient metal over time.

Both combine: a robot-bug is a tiny mechanical insect, potentially a swarm of micro-drones.

### Entity Classification

All entities are defined by spirit/biomass/metal composition ratios. In ecological terms:

- **Plants** — high biomass, low spirit. Stationary or slow. Primary producers. Anchor of every ecosystem.
- **Herbivores** — moderate biomass, low-moderate spirit. Graze on plants. Gentle unless cornered.
- **Predators** — high biomass, high spirit. Fast, aggressive, territory-aware. Useful if managed.
- **Parasites** — variable ratios. Attach to hosts and drain resources. Unchecked, they collapse ecosystems. Valuable when managed — they clean dark matter (see below).
- **Decomposers** — high biomass, very low spirit. Process dead matter back into usable resources. The primary cleanup mechanism for organic cargo released at death.
- **Robots / constructs** — high metal, any spirit. Built or found. Range from simple tools to autonomous threats.

### Keystone Species

Not all species carry equal ecological weight. Every mature ecosystem has a small number of **keystone species** — species whose presence holds the whole web together and whose loss triggers disproportionate, cascading collapse. This mirrors real ecology (the sea otter, the wolf, the fig tree) and turns the ecosystem from a flat list of creatures into a structure with load-bearing members.

A system procedurally designates keystones based on how many resource flows depend on them. Typical roles:

- **Keystone pollinator** — a bug-variant or bird whose cross-pollination sustains plant diversity across the system. Lose it and plant variety slowly monocultures, then thins.
- **Keystone predator** — a predator that suppresses a mid-tier population. Lose it and that population irrupts, strips its food source, then crashes — taking the rest of the chain with it.
- **Keystone decomposer** — a decomposer lineage that keeps death-cargo and metal debris cycling. Lose it and corpses accumulate, dark matter goes uncleaned, and the void grows interested.

Keystones are **legible without a label.** Their loss produces dramatic, visible, audible consequences — a wave of secondary die-offs, a color shift across the system, the music thinning into dissonance — so the player *learns* which species mattered by feeling the system lurch when one disappears. Protecting a keystone, or re-introducing one via [migration](#11-social-ecosystem--migration-and-old-friends) or [re-seeding](#seed-planting-and-cross-pollination), is among the most consequential acts in the game. Keystones are also the most valuable thing a [void creature](#8-void-creatures-and-dark-matter) can be lured into killing — the Void Crawler's habit of targeting the most spirit-rich plants first is, in effect, keystone-hunting.

### Ecological Succession

A barren or devastated world does not snap back to a mature ecosystem, and it does not stay dead. It **recovers in stages**, each stage building the conditions for the next. This gives every recovery — after a supernova, a destructive binge, a collapse, or the seeding of a fresh planet — a natural, readable arc rather than an instant flip.

| Stage | What appears | What it enables |
|---|---|---|
| 1 — Pioneer | Hardy pioneer plants and microbial biomass take hold in bare terrain and fissures. | Begins generating biomass and stabilizing loose material. |
| 2 — Colonizer | Bugs and small decomposers arrive, drawn by the first biomass. | Cross-pollination starts; death-cargo begins cycling. |
| 3 — Grazer | Herbivores establish on the now-diverse plant base. | A prey population exists; spirit begins accumulating in the system. |
| 4 — Predator | Predators and parasites arrive to exploit the grazers. | Population control; the web gains its regulating members. |
| 5 — Mature | Keystones establish; resource flows interlock; the system becomes self-sustaining. | Passive repair runs fast; the system can survive shocks and even export migrants. |

Succession is driven entirely by the existing systems — seed arrival, the [attraction dynamic](#the-attraction-dynamic), migration, and [passive repair](#passive-npc-repair) — not by a scripted timeline. The player can *accelerate* a stage (deliberately introducing pioneer plants to a fresh planet, carrying in herbivores once the plant base is ready) or *stall* one (over-mining, letting a keystone die). Pushing too fast — introducing predators before there is a stable grazer population — causes the introduced species to starve and the stage to fail. The ecosystem must be built in the order life builds itself.

Succession also reframes the [self-sustaining system milestone](#ecological-milestones--progression-without-numbers): reaching Stage 5 in a system the player kindled from bare rock is one of the game's quiet triumphs.

### Seeds and Cross-Pollination

Seeds spread plant species. Within a system, seeds move by attaching to animals and bugs passing through plant-rich areas and depositing when those creatures land, feed, or rest. The player does not manage this directly — it follows from maintaining healthy, ranging animal populations.

Cross-pollination between systems requires an inter-system carrier. Birds and bug-birds are primary vectors; fish occasionally carry seeds on flares; land animals rarely cross and are poor cross-pollinators.

Seeds do not always take hold. Success depends on the receiving world's terrain composition, existing competition, and resource ratios. A metal-rich world is hostile to biomass-heavy plants. A world dominated by a competing species resists new introductions unless the existing population is weakened first.

Introduced species can transform a system over time — used deliberately (a fast-spreading plant to stabilize a degraded world) or causing unintended cascades if poorly matched.

### Death as Ecological Event

Every death generates activity — some beneficial, some dangerous. This emerges from creature behavior, not scripting.

When a creature dies, its **cargo** scatters into the environment — a resource windfall. Decomposers converge immediately. Scavengers follow. Opportunistic plants extend roots toward the deposit. For a brief period the death site is a hub of positive activity.

Simultaneously, the creature's **composition** partially converts to dark matter, scaling with its **spirit** fraction. A high-spirit creature or construct generates substantially more dark matter per death than a simple organic herbivore. Dark matter is a void creature signal.

The result is that every death is double-edged. A predator killing a small low-spirit herbivore is a minor moment — scattered biomass, negligible dark matter, scavengers move in, normal. A void creature killing a high-spirit creature or construct near your settlement is a serious hazard — a significant dark matter spike, possible cascade if more deaths follow.

**Managing death** is an active part of ecosystem management: keeping high-spirit entities away from vulnerable areas, maintaining a healthy decomposer population to process released cargo quickly, and preventing death clusters that could generate enough dark matter to attract void creatures.

### The Attraction Dynamic

The more the player builds up a system, the more the ecosystem responds — both ways:

- Productive systems attract beneficial creatures: pollinators, symbiotes, scavengers.
- Productive systems also attract predators, parasites, and raiders exploiting accumulated resources.

This is not a scripted wave system. It is emergent: predators follow prey, parasites follow hosts, opportunists follow density. The player's growth creates its own threats. The practical effect is a tower-defense-like dynamic that arises naturally. A thriving system requires active management — not just accumulation.

### Indirect Combat

The player does not shoot. Direct weapons, if they remain at all, carry heavy costs and limited effectiveness. The intended model:

- Grow or build creatures and structures that defend territory autonomously.
- Use predators to manage other predators.
- Use parasites offensively against threats, accepting blowback risk.
- Redirect threats ecologically — starving them of prey, collapsing their habitat.

Combat is a failure mode of cultivation, not a parallel activity. A player spending most of their time fighting has already lost ground ecologically.

### Threat Cycles

Threats are not constant. They emerge under conditions: certain predators are more active in darkness or near stellar phenomena; parasites bloom when a host population peaks; raiders appear when accumulated resources cross a threshold worth raiding. The player learns these rhythms and prepares — or doesn't, and deals with the consequences.

### Ecological Collapse

The worst outcome is not death. It is ecological collapse: the slow unraveling of a system built up over time. Loss of a key plant species cascades into herbivore starvation, predator dispersal, parasite bloom on weakened hosts, and eventually a dead system with stripped resources and no recovery path without significant investment.

Destroying a planet or star is the fastest way to trigger this. It is irreversible within any reasonable timeframe.

---

## 6. Personality Engine

### Overview

Every entity with a nonzero spirit score has a personality — a set of needs, states, and behavioral traits determining how it acts. The richer the spirit, the more complex the personality. This applies to the player, creatures, AI ships, and any structure with enough spirit to be semi-autonomous. It does not apply to rocks, simple tools, or plants below a spirit threshold.

### Needs

Every entity with spirit has needs — internal states that must be periodically met. Unmet needs degrade performance and, if ignored long enough, lead to behavioral collapse. Needs are gated by spirit score.

**Base needs (any spirit level):**
- Sustenance — access to appropriate resources (biomass for organic entities, metal for constructs).
- Safety — proximity to shelter, territory, or allies.
- Movement — entities that cannot move in their natural way become distressed.

**Mid-tier needs (above a spirit threshold):**
- Social — contact with compatible entities.
- Territory — a defined space the entity considers its own.
- Purpose — an ongoing task or role within the ecosystem.

**High-tier needs (high spirit only):**
- Novelty — exposure to new stimuli, environments, or relationships.
- Autonomy — the ability to make decisions without external control.

### Meaning — A Behavioral Filter, Not a Need

Earlier drafts listed "Meaning" as a draining high-tier need (a creature deteriorating if forced into rote behavior). Implemented literally as a depleting stat, this is both hard to tune and conceptually muddy.

**Meaning is reframed as an alignment filter on perception, not a bar that drains.** A high-spirit creature's traits and spirit profile dictate how it *interprets* its situation and the events around it. A high-spirit, curious creature placed in a static, low-stimulus system does not "starve of meaning" — it reads the boredom of that system as a cue, entering a **Purposeless / Wandering** state that makes it highly susceptible to leaving via the next available natural transit window.

This does three things at once: it removes an awkward stat, it gives high-spirit creatures legible motivation, and it feeds directly into the [migration system](#11-social-ecosystem--migration-and-old-friends) — meaning-driven wandering is one of the conditions under which NPCs decide to jump systems on their own.

### States

At any moment an entity is in one or more behavioral states driven by current needs, environment, and recent history. States determine which behaviors are available.

- **Content** — all needs met. Full repertoire available.
- **Hungry** — sustenance unmet. Prioritizes foraging.
- **Threatened** — safety unmet. Fight, flight, or hide depending on traits.
- **Territorial** — territory active. Aggressively responds to encroachment.
- **Bonded** — social need met by a specific other entity. Protective of it. Distressed if separated.
- **Purposeless / Wandering** — purpose unmet, or a high-spirit creature's meaning-filter has flagged its environment as static. Wanders. Unpredictable. May attach to new entities, or leave the system entirely.
- **Inspired** — novelty recently met. Temporarily expanded behavioral possibilities.

States stack and interact. A threatened, hungry, purposeless entity behaves very differently from a content, bonded, territorial one.

### Traits and Perks

Traits are stable tendencies biasing how an entity responds to states and needs. The number an entity can hold is gated by spirit. Low-spirit entities have one or two; high-spirit entities may have many, interacting.

**Example traits:** Aggressive, Curious, Symbiotic, Resilient, Territorial, Parasitic, Phototropic (attracted to bright / high-energy sources).

**Example perks** (unlocked by trait combinations at high spirit):
- **Pack Leader** (symbiotic + territorial) — nearby bonded entities gain defensive bonuses.
- **Ambush Predator** (aggressive + curious) — can suppress behavioral signals until an optimal moment, then act with full force.
- **Mutualist** (symbiotic + parasitic) — stable relationships where both parties benefit from what would otherwise be a parasitic drain.
- **Void Walker** (resilient + curious) — reduced penalty for void travel. Not immunity — reduced penalty.

### The Player's Personality

The player entity uses the same system. Traits are not chosen at creation — they emerge from behavior. A player who consistently acts aggressively develops aggressive traits; one who cultivates relationships develops symbiotic traits. The player's personality is a record of how they've played.

Dying and being reborn resets traits partially — the new body inherits the dominant traits of the ecosystem it's born from, blended with a diminished version of the player's prior personality.

### Application to Creatures and AI

The personality engine is what makes the ecosystem feel alive rather than scripted. Two creatures of the same species but different personalities behave differently in the same situation. A territorial herbivore defends its patch; a curious predator investigates novel objects before attacking; a symbiotic parasite drains its host slowly to preserve the relationship.

The [events engine](#13-events-engine) generates conditions that stress personalities — crises that reveal traits, opportunities that unlock perks, encounters whose personalities create conflict or collaboration without scripted dialogue.

---

## 7. Stars

### Stars Are Infrastructure

Stars are not resources to harvest, weapons to destroy, or passive backdrop. They are the infrastructure of each star system — the primary source of light, energy, transit opportunities, and ecological stability. Managing the star is one of the player's most important long-term responsibilities.

Stars cannot be destroyed by the player. They have a predetermined lifecycle. What the player can do is interact with that lifecycle — feeding the star, inducing type changes, preparing for transitions, and managing the consequences.

### Light Is Protection

Light from the star keeps void creatures at bay. Void creatures are adapted to darkness — they lurk at the edges of systems and in the void between them, but cannot comfortably operate in strong light. A well-lit system is a protected system.

**Feeding the star increases its light output temporarily**, pushing void creatures further from the system's center and buying time during crises. This is the primary defensive use of star feeding, separate from its lifecycle effect.

Light and shadow are functional mechanics, not just visuals. Creature pathing — for void creatures and for ecosystem creatures that fear them — responds to light levels in real time. A creature hiding in a moon's shadow is genuinely in shadow; a void creature crossing into a star's light cone slows or retreats.

### Star Feeding

Stars can be fed biomass or metal. Feeding has two effects:

**Immediate effect:** Temporary increase in light output and energy emission. The star flares, illuminating more of the system and suppressing void activity. This also triggers any matching events the star can currently generate — feeding a quiet star may kick loose a freebie material ejection or open a transit window.

**Lifecycle effect:** Sustained feeding can advance or shift the star's type, inducing color (spectral type) changes that alter energy and resource conditions across the system. Color-coding applies: players learn what each star color means for the ecosystem it supports.

Biomass and metal feeding may produce different results — the general principle is that what you feed the star shapes what it gives back.

### Stellar Indigestion — The Over-Feeding Failure Mode

Feeding must not become a spammed "win button." Pushing too much resource-dense material — especially metal — into a star too quickly induces a **Stellar Indigestion / Hyper-Flare** state: unstable, volatile flaring that the player does not fully control. Consequences can include stripping the atmospheres of inner planets, scorching local bird populations and surface ecosystems, or — worst case — punching an uncontrolled transit corridor open in a random direction, potentially bridging straight into a high-density void region.

This gives star feeding a real risk ceiling. Feeding is powerful and sometimes necessary, but reckless feeding is its own crisis.

### The Safety Net

Stars periodically emit freebie materials — raw resources ejected without player input — and generate transit opportunities (natural flares, gravitational alignments, comet paths). These are part of the star's natural behavior, ensuring a player is never completely stuck in a depleted system. The player who pays attention to the star's timing plans around these windows; the player who ignores the star simply benefits less.

### The Star Lifecycle

The player cannot prevent the lifecycle, but can prepare for each transition and influence its timing at the margins.

**Active Phase (Normal Star).** The default. Produces light, energy, occasional freebies. Transit windows occur naturally. Feeding is productive. The phase during which the player builds up their system.

**Red Giant Phase (Warning).** The star expands. Light output increases dramatically — void creatures are pushed back further than usual (the silver lining) — but expansion threatens inner planets. Orbital bodies may need moving or protecting. This is the warning: the supernova is coming. Feeding during this phase can delay but not prevent the transition.

**Supernova.** The star explodes. The inner system is swept by the shockwave; unprepared planets and structures in close orbit are heavily damaged or destroyed. The shockwave also purges dark matter at scale — one of the few events that cleanses it. The supernova leaves behind:
- An **asteroid belt** from the remains of the star and destroyed bodies; its composition reflects what the star was fed and what it destroyed.
- **Special environmental conditions** — unusual deposits, anomalous gravity, rare materials only generated by stellar death; usable for special items or as seed material for new planets.
- The star's remnant core, the seed of the nebula.

**Nebula Phase (Temporary Shield).** The exploded material expands into a nebula enveloping the system. This nebula is opaque to void creatures — the system is completely protected for the duration. But the protection is temporary; the nebula dissipates over time. As it thins, light drops and void creatures begin probing the edges. **The player must feed the nebula to collapse it into a new star before the shield fails**, supplying sustained biomass and metal to trigger gravitational collapse. Success ignites a new star; failure (or being overwhelmed by other crises) means the nebula dissipates, the system goes dark, and void creatures move in. The composition of what is fed influences the new star's initial type and color.

**New Star.** If collapse succeeds, a new star ignites, light returns, and void creatures retreat. The asteroid belt and special conditions from the supernova remain, available to use.

### Doomsday Conditions

If the nebula fails and the system goes dark, void creatures move in. Their activity generates dark matter, which suppresses growth and resource generation. The system begins to die. Recovery from a fully dark system is possible but extremely difficult — requiring either re-igniting a star (a surviving nebula remnant, or another system's transit intervention) or cleaning up enough dark matter for natural growth to resume before the ecosystem collapses entirely.

---

## 8. Void Creatures and Dark Matter

### The Void Is Alive

The space between star systems is not empty. It is home to void creatures — entities adapted to the total absence of ecosystem, light, and conventional resource flow. They are always present, always hungry, always lurking at the edges of light.

Void creatures are the structural counterpart to everything the ecosystem represents: where the ecosystem builds, sustains, and generates, void creatures dismantle, drain, and consume. They are the entropy the player perpetually works against.

### Dark Matter

Dark matter is generated at death from the **spirit** fraction of a dying entity's composition. When a high-spirit entity dies, the animating intelligence that organized it destabilizes into dark matter. A simple plant or rock leaves almost none; a complex, high-personality creature or construct leaves significant quantities. The most dangerous deaths are the ones that cost the most to build.

**Dark matter physics:** Very mildly antigravity with some friction. It does not sit still at the point of death — it drifts slowly away, out toward the system's edges and eventually into the void. This is the self-clearing mechanism: if void creatures never arrive, the dark matter drifts away and dissipates harmlessly.

**Dark matter and light:** Dark matter blocks light and absorbs it across a radius gradient — opaque at the center, attenuating toward the edges. It casts a genuine shadow that void creatures use as cover. A large enough accumulation creates a zone of darkness in an otherwise well-lit system.

**Parasite cleanup:** Parasites that consume dark matter convert it back into randomized usable resources — some spirit, metal, biomass in unpredictable ratios. This is a key reason parasites are valuable when managed rather than eliminated: a healthy parasite population quietly cleans dark matter before it accumulates, removing the signal that would draw void creatures inward.

### Void Creature Appearance

Void creatures feel categorically different from everything else. Their design draws from **deep-sea creatures** and **bioweapons / combat robotics** — both built for a purpose, not evolved for a niche.

- Grotesque, elongated, asymmetric. Fanged. Armored in ways that look designed rather than grown.
- Bioluminescent — they produce their own cold, wrong-colored light. Not warm like starlight.
- **Cloaked by default.** Difficult to see until they choose to be seen.
- **Lure.** Many carry a lure — a light or signal mimicking something attractive to ecosystem creatures, drawing prey out of starlight into shadow where the void creature kills them. Creatures converted this way have a chance to become new void creatures, depending on how much spirit was invested in them before death.

Color coding applies in inversion: where ecosystem creatures use bright warning colors, void creatures use darkness punctuated by wrong-colored light. The bioluminescence signals that something is deeply wrong.

### Void Creature Intelligence

Void creatures are the most intelligent entities in the game. They do not walk into turrets. They do not attack where you are strong.

- **Assessment first.** Drawn by dark matter, they observe before acting — probing defenses, watching response times, identifying the weakest point.
- **Targeted attack.** Against one large gun, they approach from the opposite side, wait until it's occupied, or swarm it before it can cycle. They exploit gaps in coverage, not just weak spots in armor.
- **Luring.** Against low-spirit (dumb, deceivable) creatures, they use lures to draw them into shadow, kill, and potentially convert them. A low-spirit defensive force is more dangerous than none — it gives void creatures a mechanism to grow their numbers inside your system.
- **Coordination.** They communicate. A lone scout relays information rather than attacking; the attack comes later, from the direction the scout identified as weak, with numbers appropriate to what it observed.

What makes them scary is not their stats — it is that they are smarter than the player's defenses and they know it. Build a single powerful turret and call it done, and you lose a creature at the edge of its range to a lure. Then another. Then the turret is alone, and the swarm hits it from behind.

> **Implementation note — perceived intelligence, not actual strategic reasoning.** "Smarter than the player's defenses" is a *design goal*, not a mandate to build a planning AI. Players read an agent as intelligent when it does a handful of legible things at sensible moments: occasionally **flanks**, occasionally **retreats**, occasionally **probes**, and **chooses targets sensibly** (weakest, most isolated, most spirit-rich). A **utility-AI** system — each void creature scoring available actions against the observed state of the player's defenses and light map, then picking the highest-value action with a little randomness — produces all of this without genuine strategic foresight. The "reconnaissance then calibrated attack" behavior is just a scout writing observed weak-point data to a shared blackboard that later arrivals score against. Do not over-engineer this into real strategic planning; the *perception* of cunning is what matters and is far cheaper to build and tune.

### Killing Void Creatures

Void creatures die automatically if trapped in direct starlight with no shadow to retreat to. This is their absolute vulnerability — they will not knowingly walk into full light. In a well-lit system with no dark matter clouds, they cannot operate at all; they stay at the boundary and wait. When dark matter is present, they hop between the shadows it creates, moving progressively inward toward the source. Remove the dark matter, and their path disappears.

When killed:
- They convert back to conventional materials — biomass, metal, spirit in proportions reflecting their composition.
- They have a chance to drop **special items or abilities unique to void creatures** — cloaking upgrades, lure mechanisms, darkness-based abilities. The only way to acquire void creature abilities is to kill void creatures.

### Void Creature Varieties

Every normal archetype has a void counterpart — an antithesis built around inverting that archetype's strengths.

| Normal archetype | Void counterpart | Void specialty |
|---|---|---|
| Bird (fast, builds, gravity) | **Void Raptor** | Pursuit predator. Faster than birds in darkness. Dismantles mass aggregations — actively counters planet building. |
| Fish (durable, hauls, cargo) | **Void Leviathan** | Massive, near-indestructible. Carries dark matter with it, seeding shadow wherever it goes. Devours resource stores whole. The apex feeder on [transit streams](#10-inter-system-transit-and-the-corridor). |
| Land animal (territorial, cultivates) | **Void Crawler** | Surface predator. Spreads dark matter on contact with terrain. Destroys plants systematically, starting with the most spirit-rich. |
| Bug swarm | **Void Swarm** | Micro-scale. Individually insignificant, devastating in volume. Consumes seeds, disrupts cross-pollination, extinguishes small light sources. Hardest to detect before it's too late. |

### System Boundary Behavior

Void creatures generally avoid system boundaries — even attenuated edge-light makes them uncomfortable. They wait in the true void beyond. They cross when:
- Dark matter inside the system is dense enough to create a shadowed path inward.
- They are aggroed — a creature wandered far enough out to be attacked, and the void creature is now pursuing it back in.
- The system has gone dark (nebula phase without intervention, star death, or extended dark matter saturation).

The boundary is not a wall — it is a gradient. A player who lets dark matter accumulate near the boundary is shortening the distance void creatures must travel through discomfort to reach the interior.

### Anti-Farming

Void creatures are one of the ecosystem's primary anti-farming mechanisms. A player who accumulates too much of anything — too many high-spirit creatures, too much concentrated density, too powerful a position — generates the conditions that attract more sophisticated void attention, calibrated to what the reconnaissance pass observed. More accumulation draws smarter, larger incursions. There is no plateau at which the player is safe forever.

---

## 9. Death, Rebirth, and the Void

### Death Is Not the End

When the player dies, they are reborn from the ecosystem they died in. The living world generates a new body — shaped by the dominant biomass, spirit, and metal ratios of that system — and the player continues. Death is a setback with ecological consequences, not a game-over screen. What is lost is determined by **membership standing** in the system where death occurred.

### The Void

The space between star systems — the void — is the most dangerous place in the game. There is no ecosystem there: no plants, creatures, resource flows, or living world to be reborn from.

**Dying in the void means losing 100% of accumulated standing, resources, and embedded assets, and respawning at a random point somewhere in the galaxy.** The player emerges as a near-blank entity, wherever the galaxy puts them, in whatever ecosystem exists there. This makes the void the wilderness between safe places. Its monsters are not scripted encounters — they are entities that thrive precisely because nothing else lives there.

### Membership

Every star system tracks the player's **membership** — a measure of relationship, contribution, and presence in that system's ecology.

**Earned by:** cultivating plants and creatures; defending the system from parasites and raiders; building structures that serve the ecosystem; spending time in the system.

**Lost by:** destroying ecosystem resources (terrain, creatures, plants); neglecting a system for extended periods; death (which rebalances membership by a percentage depending on severity and location).

**Membership determines:**
- **What the ecosystem gives you on rebirth.** High membership = better body, nearby resources, allies that remember you. Low = minimal body, hostile or indifferent ecosystem.
- **How entities respond to you.** High-membership systems treat you as native; low as a stranger; zero as a threat.
- **What you can access.** Certain structures, creatures, and routes are only available to entities the ecosystem recognizes.

Membership is not a number the player sees directly. It is legible through the behavior of the world — how creatures respond, how plants grow toward or away from you, whether structures accept your presence.

#### Membership — Concrete Mechanics

Because membership carries a lot of weight (rebirth, reputation, access, and the social layer all lean on it), it needs a defined shape rather than a vibe:

- **What it actually is.** Per system, membership is a single bounded standing value the simulation tracks internally on a roughly **−1 (treated as a threat) → 0 (stranger) → +1 (native)** scale. The player never sees the number; they see its behavioral expression. Internally it is one float per system the player has visited, which keeps the galaxy-wide cost trivial.
- **Scope: system-first, with species spillover.** Membership is **system-specific** — it is your standing in *that* ecology. But it is partially informed by **species reputation**, which is galaxy-wide and keyed to the same [Family-Hash lineages](#technical-approach--family-hash-lineages-not-per-entity-tracking) used by migration. Walking into a brand-new system, your starting membership is near-stranger, but nudged up or down by how you have historically treated the lineages that happen to live there. This is what lets "a species you fed elsewhere trusts you on sight" and "a species you slaughtered fears you on sight" both be true without per-system bookkeeping.
- **Rate of change — asymmetric by design.** Membership **rises slowly** through sustained cultivation, defense, and presence (the work of the [emergent rhythms](#2-player-agency-and-emergent-rhythms)), and **falls fast** through destruction. Tending a system for an hour earns less than torching it loses in a minute. This asymmetry is deliberate: it makes trust expensive to build and cheap to break, exactly as in real relationships, and it makes wanton destruction self-punishing.
- **Recovery.** Membership is **always recoverable** — consistent with [terrain's rebuild principle](#for-every-destroyed-thing-a-path-to-rebuild-it) — but recovery from negative standing is slow and must be *demonstrated* through ecological contribution, not bought. A system that treats you as a threat will not accept your structures or grant access until your behavior over time has earned its way back to neutral. There is no instant reset and no purchase path; the only currency is sustained, observed contribution.
- **Decay.** Membership decays gently toward neutral under prolonged **neglect** — a system you abandon slowly forgets you — but never decays into hostility on its own. Only destructive acts push standing negative. Walking away costs you your privileged status; it does not make the system your enemy.
- **No competing factions (for now).** Membership is a relationship between the player and a *system's ecology itself*, not a reputation traded among rival political factions. There is deliberately no faction-competition layer — it would pull the game toward the political-strategy genre and away from the cultivation fantasy. Other migratory lineages and other players can share or contest a system ecologically (by competing for resources or niches), but there is no diplomacy meter. If a multi-agent reputation system is ever explored, it belongs well after the core experience is proven, and it must express itself ecologically rather than as menus.

These rules keep membership doing real mechanical work while preserving the rule that it is always *felt*, never *displayed*.

### Death in a Low-Membership System

Dying where you have minimal membership is nearly as bad as dying in the void. The ecosystem does not know you. The rebirth body is weak; the resources scarce. You re-emerge as a stranger, having to rebuild from near-zero. This creates a natural risk gradient: the further the player pushes into unfamiliar territory, the higher the cost of dying there.

### Design Intent

The death/rebirth system makes the galaxy feel like a network of places with different relationships to the player, rather than a uniform space to be conquered. Some systems are home, some familiar, some foreign. The void is the boundary between all of them — present, permanent, and genuinely dangerous. Death is not failure. It is the ecosystem reclaiming you and starting you over, shaped by whatever it has to work with.

---

## 10. Inter-System Transit and the Corridor

### Transit Is Active, Not a Loading Screen

Travel between star systems is not freely available. The void is too dangerous and featureless to traverse casually. Safe inter-system travel requires a **transit condition** — a natural or artificial phenomenon that creates a traversable corridor. And crossing that corridor is a real, active, dangerous traversal: a high-velocity survival run, not a fade-to-black.

**How this connects to the zoom-out gesture.** Leaving a system is performed by [zooming out to the galaxy map](#16-technical-architecture) and selecting a destination — the outward zoom compresses interstellar space so the player can see where they're going before committing. But the zoom only *aims* the journey; it does not bypass the danger. Committing to a destination hands the player into the transit corridor, and a safe crossing still requires an available transit condition. Without one, the player is attempting the raw void — possible, and almost always fatal. The zoom shows you the door; the transit condition is whether the door is safe to walk through.

### Transit Conditions

**Natural:**
- Gravitational alignments between systems creating a temporary path.
- **Solar flares** — always pointed toward a neighboring system; can carry fish, bugs, seeds, and other matter. Rare but reliable in direction.
- Swarms of void-adapted creatures migrating between systems on cycles — the player can ride them.
- Comet paths crossing the void and intersecting both systems.

**Induced flares — star feeding:** A flare can be triggered artificially by feeding the star biomass or metal, producing an ejection toward the nearest neighbor. Expensive, requires proximity, and carries timing risk — but lets fish and other transit-dependent archetypes make their own windows. (See also [Stellar Indigestion](#stellar-indigestion--the-over-feeding-failure-mode) for the danger of overdoing it.)

**Artificial:**
- Player-built or ecosystem-grown portals (the portal objects already exist in the prototype).
- Enough membership in a destination system that it generates a beacon.
- Other players or factions who have already established a route.

Missing a natural window means waiting for the next, or finding an artificial alternative. Attempting the void without a transit condition is possible — and almost always fatal.

### The Transit Corridor Mini-Game — Navigating the Throat

When any archetype enters transit — a fish riding an induced flare, a bird slingshotting, a land animal launching its biological ark — the player enters a **procedural transit corridor**: a high-velocity physics stream through unstable void-space.

```
       [ CORRIDOR ENTRY ]
               |
               +--> WALLS      Gravitational folds of unstable void energy.
               |               Scraping strips cargo and degrades composition.
               |
               +--> SMASHERS   Debris, asteroid fragments, and planetary
               |               shards tumbling in the transit wake.
               |
               +--> THE MAW    Apex void creatures feeding on the stream.
               |               Their jaws close over sections of the corridor.
               |
       [ DESTINATION SYSTEM ARRIVAL ]
```

**Mechanical rules:**

- **Steering and momentum.** The player does not have full free-flight. A constant forward force carries them; their standard locomotion inputs (wing flapping, tail oscillation, momentum shifting) map to limited steering across the tunnel's cross-section to avoid hazards.
- **The Walls (gravitational folds).** The tunnel edges are unstabilized void energy. Scraping them acts like a particle-accelerator feedback loop — instantly stripping carried cargo and degrading composition material.
- **Smashers (kinetic hazards).** Debris and stray asteroids are caught in the corridor alongside the player. Durable archetypes (fish, worms, crustaceans, land-animal arks) can take a hit; a bird faces catastrophic failure if smashed.
- **The Maw (apex void threat).** The largest void creatures — Void Leviathans — feed on transit streams. In a "Maw Event," a massive mouth closes over a section of corridor. The player must read the silhouette cue, time their locomotion rhythm, and dive through the closing gap before the jaws snap shut.

**Archetype traversal styles** (the rock-paper-scissors balance, expressed in transit):
- **Birds** play it as twitch-reflex bullet-hell — and can spend gravity manipulation to momentarily warp space, pulling a hazard out of their path or micro-slingshotting through a closing gap.
- **Fish / Snakes / Worms** rely on sustained, heavy rhythmic steering. They can't dodge instantly but can shrug off a wall-clip or a minor impact.
- **Land Animals** ride encased in their grown biological ark — minimal steering, massive structural shielding that must simply hold until the end of the line.

**Failure resolution.** If structural composition hits zero inside the corridor (gulped or smashed), the mini-game loop terminates, all cargo spills into the void, and the [Dying in the Void](#the-void) random-galaxy respawn fires.

### The Arrival — Breaking Into the Light

Breaching the destination system's light zone is the payoff for surviving the corridor — a deliberate dopamine beat that snaps the player from tension back into the awe of a fresh system.

**Visuals:**
- **Particle decompression wave.** Exiting the corridor spline onto the 2D navigation plane triggers a massive forward-projecting particle burst.
- **The Lorentz snap.** Reusing the prototype's existing Lorentz-contraction visual in reverse: the player's mesh starts hyper-elongated along the travel axis and snaps back to normal dimensions over a fraction of a second as it sheds relativistic speed.
- **Light-cone ignition.** The transition flashes the screen with the destination star's spectral color — electric cerulean for a blue giant, deep crimson for a red giant.

**The Wake Harvest (freebie goodies).** Traveling through the void drags matter along in the player's gravitational wake. The bounty spawns as loose cargo directly in the world on arrival — consistent with anti-inventory design — and scales with distance traveled:
- **Short hops (neighboring stars):** a tight cluster of simple metal debris or basic biomass spores near the entry point.
- **Long hops (across the galaxy):** a rich, localized debris field — rare dense metal fragments, crystallized spirit shards, even frozen exotic seeds pulled from the deep wilderness.

Because the harvest drops into the live environment, it immediately kickstarts local behavior: decomposers, herbivores, and predators orient toward the entry vector to scavenge what the player dragged in. The arrival is itself an ecological event.

**Audio.** Delta Tunes handles the transition without a cut: the corridor runs in its void/threat state (low-frequency resonance, sparse, dissonant); the exact frame of breach fires a synchronous, mathematically pure harmonic over-swell tuned to the player's dominant resource profile (warm brass-like tones for high-biomass birds; heavy industrial synth stabs for high-metal worms); then the swell decays and cross-fades into the destination system's own procedural theme, sampled from its live state. (See [Audio](#15-audio-and-delta-tunes).)

---

## 11. Social Ecosystem — Migration and Old Friends

### The Player Is a Migratory Peer

NPC creatures can and do jump between systems on their own, whenever their specific systemic conditions are met. The galaxy is not a set of sealed terrariums that only change when the player arrives — it maintains a persistent life cycle. This means the player is not a unique traveler moving through static worlds; they are one migratory peer among many, and they can cross paths again with creatures and lineages they knew before.

### When NPCs Migrate (Systemic, Never Random)

NPC migration is always driven by need and circumstance, never by a dice roll:

- **Bird / bug migrations.** A swarm of high-spirit bug-variants (e.g. bumblebees) hits a population peak, exhausts its home planet's biomass, and — stressed on sustenance or novelty — catches a natural solar flare to cross the void en masse.
- **Fish / snake / worm journeys.** A massive planetary worm, having chewed through a moon's subsurface metal, breaches the crust during a rare gravitational alignment to drift into a neighboring system's nebula in search of a fresh world to seed.
- **Meaning-driven wandering.** A high-spirit creature whose [meaning-filter](#meaning--a-behavioral-filter-not-a-need) has flagged its system as static enters the Purposeless / Wandering state and leaves through the next available window.
- **Flight from catastrophe.** An encroaching red giant phase, a dark-matter saturation event, or ecological collapse drives whole populations to flee through whatever transit corridor is available.

### The Loyalty Loop — Feeding vs. Consuming

The player's choice of what to do with loot ties directly into the [anti-inventory design](#anti-inventory-design) and creates the social layer's central tension:

- **Consuming loot** raises the player's own spirit/biomass/metal composition — surviving harsher environments and upgrading their physical form.
- **Feeding loot** to a creature raises that creature's **Bonded** state. A high-bond creature will follow the player across systems, act as a defensive Pack Leader, or even assist in the next transit.

Every unit fed is a unit not spent on the player's own cap. The game forces a constant question: **build yourself into a stronger entity, or build a traveling family to help you survive the void?**

### Reputation and Reunion

When the player breaches into a new system and spills their wake harvest, local response is shaped by any migrated NPCs present:

- **The Bonded Greeting.** A creature the player previously fed or bonded with, now present in this system, overrides its default territorial/hungry state and converges on the entry vector to scavenge the goodies — treating the player as a Provider.
- **Reputation carry-over.** Encountering a *species* the player frequently fed elsewhere yields higher baseline trust (reduced Threatened response) even on a first meeting in the new system. Conversely, a player who behaved as a raider toward that kind meets immediate defensive or flight behavior — a reputation that precedes them.

### Two Emergent Playstyles

- **The Guardian Shepherd.** A beloved group of symbiotic creatures in the player's home system is forced to flee (say, an encroaching red giant). The player's objective shifts: dive into the corridor mini-game *alongside them*, actively protecting their fragile frames from being smashed or gulped during the crossing.
- **The Cosmic Tracker.** The player arrives in a barren, unfamiliar system feeling alone — then finds a familiar plant archetype or a specific sub-species of robot-bug that could only descend from an ecosystem they left three systems ago. They've crossed the lineage of old friends, and can spend resources to help it stabilize its new, foreign home.

### Technical Approach — Family-Hash Lineages, Not Per-Entity Tracking

Tracking every individual creature's exact identity across the whole galaxy would explode the memory budget. Instead, the social layer is built on **genetic lineage hashing**, anchored in [Phase 9 (Galaxy Population)](#18-roadmap):

- Species that successfully migrate carry an evolutionary **Family Hash** component. Individuals are not tracked galaxy-wide; lineages are.
- A small number of genuinely important individuals (a specifically Bonded companion mid-journey) can carry a heavier `PersistentEntityID` snapshot — traits, personality, bond status — but this is the exception, used sparingly, not the default.
- The player's profile maintains a lightweight relationship matrix keyed to Family Hashes.
- On arrival, the `ArrivalTransitionSystem` checks for matching hashes in the immediate radius and, on a hit, fires the triumphant Delta Tunes over-swell and dials nearby creature behavior into "Old Friend" mode.

> **Scope discipline.** This entire social layer is a *post-core enrichment*. It depends on transit, personality, and galaxy population all being functional first. It must not be started before those systems carry real content — an "Old Friends" system with no living substrate to migrate is meaningless. See the roadmap.

### Memory as the Emotional Core

The migration system is the seed of something larger and, ultimately, the most distinctive thing the game can offer: **the galaxy remembers.** The strongest moments in AstroGravity will not come from combat or accumulation — they will come from continuity across enormous spans of play. *"I haven't seen this lineage in twenty hours, and somehow it found its way here."* That feeling reinforces the ecology theme more powerfully than any additional resource, enemy, or mechanic could.

Built on the same lightweight Family-Hash substrate (no per-entity galaxy tracking required), memory can extend along several axes, each cheap to store as lineage-level state but emotionally large in play:

- **Lineages remember ecosystems.** A migrating lineage carries a trace of the conditions it thrived in, biasing where it settles and how it behaves — a lineage from a metal-rich home seeks similar worlds, and reads as recognizably *itself* generations later.
- **Descendants inherit behavior.** Traits and learned tendencies pass down the lineage (partially, blended with local conditions, exactly as the player's own [rebirth inheritance](#the-players-personality) works). A lineage the player cultivated to be symbiotic stays recognizably gentle in its descendants three systems away.
- **Migration routes become established.** Lineages that repeatedly cross the same corridors lay down persistent **migration routes** — soft paths in the galaxy that other creatures, seeds, and even the player can follow. The galaxy slowly grows a circulatory system, authored by where life has actually traveled.
- **Old colonies become recognizable.** A system seeded long ago by a known lineage carries its signature — a familiar plant form, a characteristic color palette, a way the local creatures move — so that stumbling into it years later, the player *recognizes* it before they consciously know why.
- **Familiar songs return.** Because [Delta Tunes](#15-audio-and-delta-tunes) ties timbre to creature lineage and composition, the reappearance of an old lineage brings back **its musical signature** — a motif the player last heard twenty hours and five systems ago, surfacing again in a foreign sky. This is the single most powerful reunion cue available, and it costs almost nothing: the music is already state-driven.

This is the highest-leverage direction for future enrichment — it deepens the existing vision rather than bolting new genres onto it. It is also, appropriately, the *latest* work: memory only becomes legible after the player has accumulated history, which means it earns its place only once everything it remembers is already alive.

---

## 12. Terrain

### Mutability

The terrain — planets, moons, asteroids, stars — is destructible. This is a feature, not an exploit. Digging, carving, and reshaping the physical world is part of what makes AstroGravity a sandbox. Worms burrow through planets. Collisions chip away at asteroids. Sustained fire can, over time, erode even a large body.

Mutability enables burrowing as locomotion, mining subsurface resources, carving shelter or strategic terrain, and the slow geological feel of a universe that changes over time.

### For Every Destroyed Thing, a Path to Rebuild It

A foundational principle. Nothing is permanently destroyed without a mechanism to restore it. The mechanisms vary in difficulty, time, and cost — some trivial, some monumental — but they exist. A player who understands the rebuild paths thinks about destruction differently: as a choice with a known recovery cost, not as irreversible damage.

| Destroyed thing | Rebuild mechanism |
|---|---|
| Plant species | Re-seed from another world or system. Seeds carried by animals and bugs. |
| Creature population | Introduce survivors from another system or grow new ones from biomass + spirit. |
| Asteroid | Bird gravity aggregation replaces it from nearby debris — debris which [material drifting](#material-drifting-and-accretion) tends to supply over time. |
| Moon | Longer aggregation project. Significant bird time or coordinated effort. |
| Planet | Major undertaking. Bird gravity aggregation over extended time, or ecosystem-driven accretion if enough debris is present and gravity is favorable. Composition depends on gathered material. |
| Star | Effectively irreversible on any meaningful timescale. Theoretical rebuild mechanisms may exist but are not expected to be practically achievable in normal play. |
| Portal | Rechargeable. A depleted or destroyed portal can be rebuilt by a land animal investing grown resources into the site. |

### Destruction Has Consequences

Casual destruction is deliberately hard. Destroying a planet or star requires sustained, significant effort — not something that happens by accident or in passing combat. The cost is meant to be felt before the act is complete. Consequences are ecological, not punitive: the ecosystem loses its foundation, plants die, animals disperse or starve, resource flows collapse, gravitational relationships shift, and the player's foothold weakens. The game does not punish destruction with a score or cutscene. It punishes it with ecology.

### Passive NPC Repair

Damaged terrain is not permanently degraded. The ecosystem repairs it passively, just by functioning: plants grow into fissures and stabilize loose material; worms fill tunnels and redistribute mass; creatures deposit waste and remains that accumulate into new soil and rock. Over sufficient time, a damaged planet recovers mass and ecosystem density without explicit player action.

The rate depends on ecosystem health. A thriving system with diverse plants, active worms, and healthy creature counts repairs quickly; a stripped system barely repairs at all. Neglecting a system slows its recovery. The best thing a player can do for a damaged system is leave it alone and let the ecosystem work — the second best is to actively cultivate the species that drive repair: burrowers, decomposers, and dense plant cover. Player destruction only wins if it outpaces natural recovery, which requires sustained effort. Incidental damage from combat or minor mining always heals.

### Sandboxing

The mutable terrain is the creative space. The design solution to destructive impulses is not to remove destruction but to make building more interesting than destroying. A player who carves a tunnel network through a moon and cultivates fungal ecosystems inside it should be doing something more rewarding, defensible, and resource-efficient than one who just blasts the moon apart. The sandbox rewards creativity with survival advantage.

### Implementation Notes

The current GameMaker terrain destruction engine is functional and visually compelling — the feature that most immediately engages new players — but currently draws attention away from deeper systems rather than supporting them. In the port it must be rebuilt for performance: chunk-based destruction with LOD, GPU-side erosion where possible, and a clear cap on terrain modification events per frame before they're queued. The goal is terrain that feels geological — slow to change at scale, responsive to precise tools, consequential when damaged.

---

## 13. Events Engine

### Role in the Game

AstroGravity's primary driver of activity is emergent behavior — the ecosystem rules, creature personalities, resource flows, and relationships that generate situations without scripting. The events engine is *secondary*. It is not the game. It is narrative punctuation: structured occurrences that create pressure, opportunity, or change when the emergent layer needs a catalyst.

The relationship is like weather and climate. The ecosystem is climate — the underlying state. Events are weather — specific conditions that arise from that state, stress it, and leave it changed.

### What Events Do

Events do not override emergent behavior. They create conditions the emergent systems respond to. An event might shift a physical property (a flare raising system energy, a comet impact redistributing metal), introduce an entity group the ecosystem must absorb, open or close a transit corridor, stress a need across a population (a blight degrading biomass, triggering hunger states everywhere), or create a time-limited opportunity (a rare alignment permitting travel, a ridable void-creature migration). Events are things that happen *to* the world. What happens next is up to the ecosystem and the player.

### Event Categories

- **Stellar** — driven by star physics. Flares, expansion phases, gravitational shifts. Predictable in pattern, unpredictable in timing. Often create transit windows or hazards.
- **Ecological** — driven by population dynamics. Parasite blooms, migration waves, predator irruptions, plant die-offs. Emerge from ecosystem state; the engine recognizes threshold conditions and formalizes them rather than letting them drift unnoticed.
- **Void** — originating from between systems. Incursions, drifting derelicts, unusual gravitational phenomena. Rare, high-stakes, often connected to transit.
- **Manufactured** — caused by player or AI actions crossing a threshold. Over-extraction triggers a collapse event; building too much too fast triggers raider attention; reckless star-feeding triggers [Stellar Indigestion](#stellar-indigestion--the-over-feeding-failure-mode). Consequences formalized into events so the world responds coherently rather than chaotically.
- **Discovery** — something new enters the player's awareness. A signal from an unmapped system, a creature with an unusual trait configuration, a structure of unclear origin. Prompts, not quests — a thing to investigate, not a task to complete.

### The Storyteller

The engine has a lightweight pacing layer — a storyteller (similar in spirit to RimWorld's, though less narrative-heavy) that monitors the player's overall situation and biases event selection. It does not create difficulty; it creates rhythm. It recognizes when things have been quiet too long and introduces a catalyst; it recognizes when the player is overwhelmed and holds back until the situation stabilizes. It ensures the game never feels completely static and never completely chaotic — always something developing, something resolving, something on the horizon. The storyteller has no personality of its own. The story is the ecosystem's.

> **Storyteller vs. Chronicle — two different jobs.** This pacing storyteller decides *when* the world stirs; it is a rhythm regulator, faceless and mechanical. The separate [Procedural Storytelling layer](#14-procedural-storytelling--the-chronicle) does the opposite-facing job: it *narrates* what the world has already done, with voice and humor, after the fact. The storyteller shapes tempo; the chronicle gives meaning. Neither assigns the player anything.

### Events and Personality

Events create conditions that stress personality states. An event starving a system of biomass pushes every creature into a hunger state, which then interacts with each creature's traits: the aggressive ones fight, the symbiotic share, the curious leave to find resources elsewhere, the resilient endure. This is where the personality and events engines produce emergent narrative — not in scripted outcomes, but in the varied responses of differently-configured entities to the same conditions.

### Events and Transit

Many natural transit windows are formalized as events. When a stellar alignment creates a corridor, the engine flags it with a duration, a transit quality (how safe the corridor is), and associated phenomena (creatures using the same corridor, unusual void conditions along the path). The player can respond or ignore it — ignoring means waiting for the next window; responding means deciding whether the destination is worth the trip and the [corridor's risk](#10-inter-system-transit-and-the-corridor).

### Implementation Notes

The events engine is a relatively lightweight timer-and-threshold monitor: it samples ecosystem state, checks conditions against a library of event templates, and fires events when conditions are met. Its power comes from the richness of what it fires *into*, not from the events themselves. Templates define trigger conditions, introduced entities or changes, duration, and resolution conditions — they do not define outcomes. The ecosystem determines outcomes.

Priority is after the ecosystem and personality systems are functional. An events engine firing into an empty world produces nothing interesting.

---

## 14. Procedural Storytelling — The Chronicle

> **Quick reference:** A first-class but **entirely optional** narrative layer that *notices and gives voice to the stories the simulation is already telling* — it never generates chores. No quest log, no objectives, no fetch tasks, no completion rewards. Its job is recognition, voice, and humor, not assignment. A player can ignore it completely and lose nothing; a player who engages with it gets a galaxy that feels authored without being bossy. It draws meaning from systems that already exist (migration, lineages, personality, death, the void) rather than inventing new busywork.

### The Anti-Quest Principle

The failure mode this layer exists to avoid is the **task disguised as play** — "pick ten carrots," "kill six raiders," "deliver this to that system." These convert a relaxing world into a checklist of unpaid labor, and they directly violate the game's [no-imposed-objective philosophy](#2-player-agency-and-emergent-rhythms). People don't naturally do missions unless forced; they come to a world like this to *play and unwind*, not to clock in.

So the storytelling layer follows hard rules:

- **It never assigns.** It has no mechanism to give the player a task, track an objective, or reward completion. There is no quest log because there are no quests.
- **It recognizes, it doesn't generate.** It watches the simulation for situations that *already have narrative shape* and names them. The drama was going to happen anyway; the layer just notices.
- **It invites at most.** When it does point outward, it offers an *opening* ("something strange is happening three systems away"), never an instruction. Following up is the player's idea, pursued their way, with no failure state for ignoring it.
- **It is ignorable without penalty.** A player who never opens it, never reads it, never chases a single thread experiences a complete game. Nothing is gated behind it.
- **It is allowed to be funny.** This is a feature, not a tonal accident — see below.

### What It Actually Is — The Chronicle

The layer's primary form is a **chronicle**: a living, in-world account of what has happened to the player's galaxy, written *after the fact* from things that genuinely occurred. It is closer to a naturalist's field journal or a folk history than a mission board. The chronicle:

- **Records milestones as they happen** — the [milestone moments](#ecological-milestones--progression-without-numbers) (first planet built, first supernova survived, first lineage reunion) are written into it as small entries, in flavorful language, so they accumulate into a personal saga the player can look back on but never has to act on.
- **Names emergent dramas** — when the simulation produces something with story shape (a keystone predator that has dominated a system for a long time, a bonded companion that followed the player across three crossings, a lineage that went extinct and then unexpectedly reappeared from a seed cached on a moon), the chronicle gives it a name and a sentence or two. The player suddenly has *characters* and *arcs* they didn't author but recognize.
- **Reflects the player back** — because the player's own [personality emerges from behavior](#the-players-personality), the chronicle can describe the player the way the galaxy "sees" them: the Gardener who never leaves home, the Storm who arrives and systems fall quiet, the Shepherd whose old friends keep turning up. This is identity feedback, not a score.

The chronicle is **opt-in surfacing**: it lives a zoom or a glance away, never as a popup mid-play. The player consults it when they want to reminisce or orient, the way you'd flip through a photo album — not because the game is nagging them.

### Where the Stories Come From (No New Content Required)

The crucial efficiency: this layer invents almost no new simulation. It is a **reading layer** over systems that already generate drama. Its source material:

| Existing system | Stories it already produces |
|---|---|
| [Migration & lineages](#11-social-ecosystem--migration-and-old-friends) | Reunions, lost-and-found lineages, family dynasties that span the galaxy, the slow spread of a species the player once saved. |
| [Personality engine](#6-personality-engine) | Rivalries, bonds, betrayals, a famously aggressive predator, a symbiotic pair that's inseparable, a curious creature that keeps wandering into danger. |
| [Death & the void](#8-void-creatures-and-dark-matter) | Last stands, a keystone hunted down, a system that went dark and came back, a companion lost in a crossing. |
| [Stars](#7-stars) | A civilization-of-creatures that survived a supernova; a system reborn three times under the player's care. |
| [Player behavior](#the-players-personality) | The player's own legend — how the galaxy characterizes them based on what they've actually done. |

The storytelling layer subscribes to the same threshold signals the [events engine](#13-events-engine) already computes, plus the [Family-Hash lineage](#technical-approach--family-hash-lineages-not-per-entity-tracking) records, and pattern-matches them into narrative templates. It is a *pattern recognizer with a good vocabulary*, not a content factory.

### Humor and Tone — Permission to Be Funny

A relaxing sandbox should be allowed to make the player smile. Because the chronicle narrates real emergent absurdity, comedy arises naturally and should be embraced rather than sanded off:

- **The simulation is genuinely funny sometimes.** A bumblebee swarm that keeps migrating *into* the same predator's territory and getting eaten, generation after generation, is a comedy of errors the chronicle can deadpan. A companion with the Curious trait that has now wandered into the void *four times* and survived by luck is a running gag the galaxy is writing itself.
- **Voice, not jokes.** The humor comes from dry, affectionate narration of real events — a field-naturalist with a sense of irony — not from injected one-liners or memes that would date the game or break its diegetic spell. The tone is *wry observation of a living world*, closer to a nature documentary narrator who has clearly developed opinions about a particular otter.
- **The player is a character too.** The chronicle can gently roast the player. A player who has destroyed five planets "in the name of progress" can be described with arch understatement. This is affectionate, never punitive — it's the world having a personality, not the game scolding.
- **Tone scales with the world.** When the system is thriving, the chronicle is warm and playful. When things are grim — a system dying, a beloved lineage extinct — it shifts to something quieter and more elegiac. The humor is situational, the way it is in life, and the same [Delta Tunes](#15-audio-and-delta-tunes) state that colors the music can color the prose.

### Optional Threads — Invitations, Never Tasks

The one outward-facing feature, used sparingly, is the **thread**: a soft narrative hook the chronicle can dangle when the simulation produces something genuinely intriguing. A thread is an *invitation to be curious*, structurally distinct from a quest:

- A thread has **no objective text, no tracker, no reward, and no failure.** It is a sentence of intrigue: "A lineage you thought extinct is leaving traces on a world you've never visited." What the player does with that — go look, ignore it, file it away — is entirely theirs.
- Threads are **discovery prompts**, the same shape as the events engine's [discovery category](#event-categories) — "a thing to investigate, not a task to complete." The storytelling layer just gives discovery a narrative voice.
- Threads **resolve themselves whether or not the player engages.** The lineage spreads or dies on that distant world regardless. If the player goes, they witness an ending they helped or watched; if they don't, the chronicle may later note how it turned out anyway. There is no dangling incomplete-quest guilt because nothing was ever assigned.
- A player who finds threads distracting can have the layer surface fewer or none. It dials down to pure retrospective chronicle, or off entirely.

### Why This Is First-Class, Not Decoration

Making storytelling a first-class system — rather than flavor text bolted on — is what turns a beautiful simulation into a *memorable* one. Players remember stories, not mechanics. But the design bet is specifically that **the best stories here are the ones the player lived, recognized in hindsight, and told themselves** — not the ones a designer wrote and forced them to execute. The chronicle's entire job is to make those lived stories legible and shareable, to give the player the language to say *"let me tell you what happened in my galaxy,"* and to occasionally make them laugh at what their own world got up to while they were busy elsewhere.

It earns "first-class" by being deeply wired into every other system as a reader, by being one of the primary ways the player perceives the meaning of their play, and by being a genuine differentiator. It earns *trust* by never, ever handing the player a chore.

### Implementation Notes

- **Build last, among the latest.** Like the events engine, this layer is meaningless without rich systems to read. It depends on personality, migration, lineages, and the milestone framework all being live. It belongs alongside or after [Phase 9](#18-roadmap).
- **A recognizer plus a templated voice.** Technically it is: (1) a set of **pattern matchers** subscribed to existing threshold/lineage/personality signals; (2) a **narrative template library** with tone variants (warm, wry, elegiac) selected by world state; (3) a **chronicle store** of generated entries keyed to the systems and lineages they describe; (4) an **opt-in surfacing UI** that is glanceable and never interrupts. No new simulation, no quest infrastructure, no objective tracking — deliberately.
- **Authored templates, emergent content.** The *voice* is hand-authored for quality (a strong, consistent narratorial tone is what sells it); the *events it describes* are entirely emergent. This mirrors the [Delta Tunes](#15-audio-and-delta-tunes) split: author the palette, let the world play it.
- **Keep it diegetic.** Per [Diegetic UX](#17-diegetic-ux--the-world-is-the-interface), the chronicle should feel like an artifact of the world — a record the galaxy keeps — not a game menu. Presentation matters as much as content.

---

## 15. Audio and Delta Tunes

### Sound Is Not Secondary

Audio quality and polish is one of the primary differences between a good game and a great one. For a game built on living systems, ecological rhythm, and emergent behavior, audio that responds to and reflects the state of the world is foundational, not decorative. Delta Tunes is the system that makes this possible.

### Delta Tunes

Delta Tunes is a quasi-procedural music system integrating a synthesis and mixing engine directly with the game's timing and state systems. Rather than playing pre-composed tracks or randomly selecting from a library, it generates music in real time from sound bytes and mathematical functions, mixed and arranged in response to what is happening in the game. The goal is music that sounds like it was composed for this exact moment — because it was.

**The model** works like a DAW (FL Studio, Logic Pro) running inside the game:
- A bank of source material: short sound bytes, synthesized tones, mathematical waveforms.
- A mixer with multiple channels, each driven by game state variables.
- A timing system synchronized to the game clock and to ecological events.
- Rules governing how channels blend, layer, and transition based on world state.

**What drives it** — game state feeds directly into the music:
- Star brightness and energy output map to harmonic richness and warmth.
- Ecosystem density and health map to melodic complexity and layering.
- Void creature proximity maps to distortion, dissonance, and sparseness.
- Star lifecycle phase maps to mood: active is full and grounded, red giant builds tension, supernova is climactic, nebula is sparse and exposed, new-star ignition is resolution.
- Player speed and locomotion type map to rhythm and tempo.
- Death events introduce dark, brief harmonic intrusions.
- **Transit state** drives the corridor's dissonant low-frequency tension and the triumphant arrival over-swell (see below).

**What it produces** — music that shifts continuously without jarring transitions. A healthy system sounds lush and layered; a system under pressure sounds tense; the void is near-silent with unsettling low-frequency presence; a supernova is a genuine musical event. The player learns to hear the state of the world without looking at it.

### Key Signatures as System Health

Delta Tunes is the strongest asset for minimizing standard UI. One powerful application: use musical key and mode to signal system health. A balanced spirit-biomass-metal system plays in a pristine, resonant major key. As a system drifts toward ecological collapse or dark-matter over-accumulation, the synthesis engine smoothly modulates carrier frequencies into microtonal, flat, or dissonant minor modes. The player never needs a health meter — they feel the sickness of the world through their headphones.

### The Transit Crescendo

```
[ CORRIDOR ] ----------> [ SYSTEM BREACH ] ----------> [ IN-SYSTEM THEME ]
Dissonant, sparse,       Triumphant major chord        Dynamic, layered
low-freq resonance       synchronous over-swell        local ecology theme
```

- **Tunnel build-up.** Inside the corridor, Delta Tunes runs its void/threat state — low-frequency resonance, irregular rhythmic artifacts, minimal melody — keeping the player on edge.
- **Arrival over-swell.** The exact frame the player crosses the light threshold, a hard synchronous synthesis event fires: a bright, mathematically pure harmonic over-swell tuned to the player's dominant resource profile (warm, brassy tones for high-biomass birds; heavy industrial synth stabs for high-metal worms).
- **Ecological cross-fade.** As the chord decays, the engine samples the new system's state variables and dissolves seamlessly into that system's unique theme — driven by star phase, ecosystem density, and nearby entities.

### Existing Work

Delta Tunes was in development when the project last paused. The `music_demo` object in the GameMaker prototype contains early scaffolding and should be the reference implementation for the Unity rebuild. The core architecture — tying musical parameters to game state variables and mixing in real time — should be preserved and expanded. What GameMaker's audio engine limited can now be replaced with a proper real-time synthesis layer.

### Sound Design — Void Creatures

Void creatures have a distinct sonic identity; their presence should register acoustically before it is visible. When Delta Tunes detects void proximity or dark-matter concentration: melodic content reduces (layers drop away), low-frequency resonance enters the mix (not musical, unsettling), and irregular rhythmic artifacts appear, as if something is interfering with the music's structure. The creatures themselves produce mechanical-biological sound — resonant low-end, asymmetric rhythm, no harmonic warmth. They should sound built, not born, making the player instinctively uncomfortable before they understand what they're hearing.

### Sound Design — Ecosystem Creatures

Different creature types have sound signatures contributing to a system's overall audio environment. A system teeming with bird-types sounds different from one dominated by worms or land animals. Bugs contribute high-frequency texture; large predators contribute low-frequency presence; plants contribute slow environmental resonance. A player fluent in the sound language can hear the health and composition of a system from audio alone.

### Technical Priorities

1. Delta Tunes runs in real time without frame-budget impact. Audio processing on a separate thread; game state feeds the mixer via lightweight parameter updates, not per-frame direct calls.
2. Light/sound interaction: dark areas have a distinct audio character. The transition from lit system to shadow to void is audible as well as visible.
3. **FMOD or Wwise integration is recommended** over Unity's native mixer for the level of dynamic mixing and real-time synthesis required. Both support parameter-driven mixing, adaptive music, and low-latency state transitions at professional quality.
4. Source material quality matters more than quantity. Fewer high-quality sound bytes that compose well beat a large library of mediocre samples. The mathematical synthesis side — generating tones from functions — is where the system produces sounds nothing else can.

> **Scope discipline — Delta Tunes is a game feature, not an audio-middleware project.** The risk with Delta Tunes is building a custom DAW and synthesis engine and never finishing the game around it. The guardrail: **AstroGravity generates musical *parameters*; FMOD or Wwise generates the *audio*.** Ship the full state-driven experience first using middleware's existing adaptive-music, layering, and parameter-automation tools — that alone delivers nearly everything described here (layering by ecosystem health, dissonance near the void, the transit crescendo, key-signature health). The bespoke mathematical-synthesis layer — tones generated from functions — is a genuine differentiator but an **optional later enhancement**, pursued only once the parameter-driven version is working and only as far as it earns its cost. Do not block the game on custom synthesis technology.

---

## 16. Technical Architecture

### Engine Decision

The GameMaker prototype has served its purpose: it proved the design, built the systems, and demonstrated the vision. Its ceiling is too low for what AstroGravity needs to become. The path-based drawing and animation system is computationally expensive; the collision engine is weak; the simulation density required for living ecosystems — thousands of entities with behaviors, N-body gravity across a galaxy, procedural terrain — will hit the wall before the game is half-populated.

**The recommended target engine is Unity with DOTS (Data-Oriented Technology Stack).**

Alternative considered: **Godot 4.** Lighter runtime, paradigm closer to GameMaker, GDScript similar to GML. Rejected for this project due to insufficient tooling for high-density simulation at the scale AstroGravity requires.

### Why Unity DOTS

AstroGravity is fundamentally a simulation game. The dominant runtime cost is not rendering — it is updating thousands of entities each frame: gravity, creature behavior, resource flow, ecological relationships, terrain state. Unity DOTS is built for exactly this:

- **Burst Compiler** compiles C# jobs to SIMD instructions, giving near-native performance on simulation-heavy loops.
- **Job System** distributes work across all CPU cores automatically. N-body gravity, creature AI, and ecosystem ticks run in parallel.
- **ECS (Entity Component System)** stores entity data in contiguous memory, eliminating the cache misses that tank object-oriented architectures. Thousands of space-matter objects become a tight data array, not a scattered heap of MonoBehaviour instances.

This architecture is what enables adaptive simulation: rather than targeting a fixed platform, the simulation runs against a frame budget. When the budget is tight, entity counts drop, simulation radius shrinks, ecosystem density reduces. The world gets quieter, not broken.

### Adaptive Simulation Strategy

**Starting point — the galaxy is already simulated as a whole.** The prototype currently simulates the entire galaxy at once (spiral generation, N-body, classification across all systems). This is a genuine strength worth partially preserving: it is what makes the galaxy feel like a single continuous place rather than a set of disconnected levels, and it is the substrate the [migration](#11-social-ecosystem--migration-and-old-friends) and [memory](#memory-as-the-emotional-core) systems ultimately ride on. The goal of the port is **not** to throw galaxy-wide awareness away — it is to keep a coherent, lightweight model of the whole galaxy alive while **concentrating the expensive, detailed compute where the player actually is.**

The result is tiered by distance from the player and by frame budget, with the key principle that *detail* scales down with distance even though *awareness* never fully disappears:

- **Tier 1 — Full simulation.** The player's immediate surroundings. Full AI, physics, ecological tick, per-entity behavior. Always active. This is where the frame budget is deliberately spent.
- **Tier 2 — Summarized simulation.** The broader current star system. Behavior approximated: populations tick at reduced frequency, physics simplified, per-entity detail dropped for representative groups. Active when budget allows.
- **Tier 3 — Lightweight galaxy model.** All other systems. Not full per-entity simulation, but **not nothing either** — each carries a cheap aggregate model (population levels, ecosystem health, dark-matter pressure, star phase, lineage presence) that drifts on a slow timer according to ecological rules. This is what lets a worm chew through a moon three systems away, or a lineage migrate while the player isn't watching, without the cost of simulating every creature there. A Tier 3 system loads up into full Tier 1/2 detail as the player approaches.

The distinction from a naive "distant = frozen" design is deliberate: the galaxy keeps *living* everywhere at low fidelity, so the world the player returns to has changed in their absence — but the compute that makes individual creatures think, move, and render in detail is concentrated where it can actually be seen and felt.

Transitions between tiers must be invisible. An entity coming from Tier 2 into Tier 1 should not pop — it should appear to have been doing exactly what its summarized model said it was doing. (The [Family-Hash migration system](#technical-approach--family-hash-lineages-not-per-entity-tracking) is what lets Tier 3 carry inter-system relationships forward cheaply, without per-entity tracking.)

**How far "limited galaxy-wide" can go is a tuning question.** Exactly how many systems stay in the lightweight model versus collapse to the cheapest statistical drift is something to profile and tune, not fix in advance — the [performance targets](#performance-budget-targets) below are starting points. The principle is fixed; the cutoffs are adjustable.

**Gravity scope — true N-body is for major bodies only.** Full pairwise N-body runs only over stars, planets, moons, and large asteroids — at most dozens of bodies per active system, which Burst handles comfortably. Everything smaller and more numerous (debris, loose cargo, corpses, resource packets, dark-matter clouds) does **not** participate in pairwise N-body; it samples an **influence field** derived from the major bodies and uses **chunk aggregation** to merge nearby loose matter into representative drifting clusters. This is what makes [material drifting and accretion](#material-drifting-and-accretion) affordable: thousands of fragments read as physically settling without thousands of bodies in the gravity solve. Galaxy-wide, distant systems run their major-body gravity at low frequency or as cached orbits rather than a live full solve — keeping awareness without paying full N-body everywhere at once.

### Rendering — Semi-3D

AstroGravity renders in 3D. Navigation, collision, and gameplay logic remain on a 2D plane. The 3D is entirely in the visual layer — what the player sees, not how they move. This is not a compromise: it combines the clarity and control of 2D navigation with the visual richness only 3D rendering, lighting, and materials provide.

**What changes in 3D:**
- Ships, creatures, and structures are 3D meshes, not sprites. The ship builder generates a procedural 3D mesh from the point grid. Creatures are procedurally generated 3D forms whose geometry reflects their biomass-metal composition.
- Planets are 3D spheres with procedural surface detail, atmosphere shaders, and terrain deforming in genuine 3D.
- Stars are volumetric 3D objects with corona, flare, and lifecycle-phase visual states.
- Light from the star is real 3D light propagation — planets and moons cast accurate shadows across the navigation plane. This makes the light/void mechanic work.
- Depth is real. The navigation plane is Z=0; background stars and nebulae at Z=-far; void creatures can emerge from depth. Parallax is physical, not faked.

**What does not change:**
- Navigation is on the XY plane. The player moves in two dimensions.
- Collision runs on 2D projections of 3D colliders — the simulation doesn't care about Z.
- The camera is top-down or near-top-down with optional tilt. It does not orbit freely.
- The galaxy map is flat.

**Camera model — zoom is the primary spatial interface.** A fixed or near-fixed angle looking down Z, with continuous zoom and optional shallow tilt. It should feel like looking at a world, not piloting through one. Crucially, **zoom is not just a camera control — it is how the player moves through the scales of the game**, and it is already implemented as a fully zoomable galaxy map in the prototype:

- **Zoomed in:** full 3D detail — surface texture, creature geometry, ship structure, the life of a single locale.
- **Zoomed out within a system:** the system abstracts toward radar/blip level, showing bodies, populations, and threats at a glance.
- **Zoomed all the way out:** the view becomes the galaxy map, and **zooming out is itself the act of leaving the current star system.** As the player pulls back, the space between stars visually compresses, so they can *see where they are heading before they commit to going there.* Departure is not a separate menu or jump button — it is a continuous outward zoom that hands off into [inter-system transit](#10-inter-system-transit-and-the-corridor) once the player commits to a destination.

This makes spatial scale and travel a single continuous gesture rather than discrete modes. Preserve this in the port: the zoom is one of the game's most distinctive existing strengths, and the visual compression of interstellar space is what makes committing to a crossing legible rather than blind.

**The Star Sonata trap to avoid:** Star Sonata converted from 2D to 3D and its art quality collapsed because its visual identity lived in hand-crafted 2D sprites with no 3D equivalent at their asset budget. AstroGravity's identity is *systemic* — procedural generation, color language, material properties — all *stronger* in 3D. There are no hand-crafted sprites to lose. The biomass-metal spectrum becomes richer with real PBR materials; the light system becomes accurate with real shadows. The conversion is an upgrade in every direction if materials and procedural generation are done well.

**Materials and the biomass-metal spectrum in 3D** map directly to Universal Render Pipeline material properties:
- **High biomass** — subsurface scattering, soft normals, translucent edges, irregular organic detail. Light passes through thin membranes.
- **Balanced** — mixed materials, hard and soft geometry coexisting; visible mechanical joints with organic connective tissue.
- **High metal** — physically-based metallic shaders. Specular highlights, hard edges, reflective surfaces.

The material system *is* the visual language — it generates itself from composition data, requiring no additional design work to express the resource classification.

### Light and Shadow (Gameplay-Critical) — CPU-Authoritative

Light is not a visual effect in AstroGravity — it is a gameplay mechanic. Void creatures cannot operate in strong light; creatures hide in shadows; the transition from lit system to dark void is a danger boundary. The light and shadow system must therefore be accurate enough to drive pathfinding and behavior decisions, not just rendering.

> **Architecture correction — do not read light back from the GPU.** An earlier draft proposed running light propagation on the GPU and having CPU pathfinding query a light map *read back* from GPU memory each frame. This is the right instinct executed the wrong way. GPU-to-CPU texture readbacks (`AsyncGPUReadback` in Unity) carry 1–3 frames of latency. At 60fps with fast-moving void creatures, the AI would path against shadow data that is several frames stale — causing creatures to clip into starlight and visibly jitter as their AI fights outdated information. **The CPU must own the truth of the simulation; the GPU merely displays it.**

The corrected model, which leans on the fact that all gameplay logic is strictly 2D:

- **CPU-authoritative occlusion.** Compute a low-resolution 2D light-occlusion grid entirely on the CPU using **Burst-compiled raycasts** from the star position, occluded by planets, moons, terrain, and dark-matter clouds. This grid is the single source of truth.
- **Pathfinding reads the CPU grid directly.** Void creatures use light level as a navigability cost — high light is impassable or high-cost, low light preferred. They query the same CPU grid, never a separate approximation and never a GPU readback.
- **The GPU mirrors the CPU.** The same CPU light data is pushed to the visual shader as uniforms so what the player sees matches what the simulation uses. The high-resolution per-pixel *look* of light and shadow is a GPU render concern; the *truth* used for AI is the CPU grid.
- **Dynamic levels.** Light responds in real time to star feeding, lifecycle phase, and dark-matter concentration — all of which feed the CPU occlusion pass.

This is the highest-priority light work in the project. Everything else (nebula rendering, cloaking, lightning) is secondary to getting light/shadow right.

### Core Systems to Port

These GameMaker systems contain the game's essential logic and should be ported directly, preserving behavior while improving architecture:

- **math_astrogravity** — N-body gravity. Port to a Burst-compiled job. Replace sprite_width/height-based mass with an explicit mass component.
- **space_matter_classify** — Entity classification by radius. Port directly; thresholds become ScriptableObject configuration.
- **ship_set_physics / ship_step_*** — Ship physics and weapon systems. Port to ECS components.
- **ship_grid / draw_ship_grid** — Ship builder point system. Port to 3D procedural mesh generation; the point grid defines control points and a surface is generated from them (Catmull-Rom or similar spline surface). Per-point biomass-metal ratio drives the shader applied to each mesh region.
- **scr_holygrid** — The interpolation/animation framework ("holy equations"). Port to a Unity animation job or custom tweening using the Job System.
- **camera_target_*** — Multi-target camera with weighted tracking. Port to Cinemachine with custom weight logic, or implement directly.
- **space_collision** — Simplified collision avoiding GameMaker's weak engine. In Unity, use Physics2D with layers and custom collision response rather than default Rigidbody behavior.
- **random_halton / path_*** — Procedural generation utilities. Port directly.

### The Micro-Fauna Subsystem

Bug swarms and decomposers, though distinct design concepts, share underlying behavior: large populations of small entities performing distributed processing (seed dispersal; cargo cleanup). Build both on a single **micro-fauna ECS subsystem** — one set of Burst-compiled flocking/swarm and processing jobs parameterized by role — rather than two parallel implementations. This keeps swarm behavior performant at the high entity counts both demand, and means seed cross-pollination and death-cargo cleanup are handled by one well-optimized system.

### Inter-System Transit Implementation

The transit corridor (see [§9](#10-inter-system-transit-and-the-corridor)) is implemented as a temporary instanced sequence, not a teleport:

- **Transit engine.** When a transit condition is met (flare, portal charge, alignment), instead of teleporting entity data to the target system array, instantiate a temporary, procedurally curved spline corridor in ECS.
- **The physics loop.** Apply a constant forward force to the player entity while mapping standard locomotion inputs to lateral acceleration vectors. Burst-compiled jobs spawn procedural "Smasher" obstacles and "Maw" boundary colliders ahead of the player's track.
- **Failure resolution.** If structural composition reaches zero in the corridor, terminate the loop, trigger a total cargo spill into the void, and execute the "Dying in the Void" random-galaxy respawn.
- **ArrivalTransitionSystem.** On a `WormholeExitEvent`, three parallel jobs fire: (1) halt forward transit velocity and hand the entry vector to the camera for a shake/zoom reset; (2) compute `distance × multiplier` and run a Burst spawning job scattering the wake-harvest resource entities onto the XY plane; (3) push an instant state update to FMOD/Wwise (`Transit_State = Complete`) to trigger the Delta Tunes resolution and spin up the new system's audio channels. The same system checks Family-Hash matches in radius to enable "Old Friend" arrival behavior.

### Collision Architecture

GameMaker's collision engine is a known weak point. In Unity, despite 3D rendering, collision runs on the 2D navigation plane:

- Use **Physics2D** with layer-based collision matrices. Space matter, creatures, projectiles, and the player each have explicit rules. 3D mesh visuals are decoupled from 2D colliders — the collider is a circle or polygon projected onto the navigation plane, not the 3D mesh bounds.
- For N-body proximity (gravity, detection ranges), use **Physics2D.OverlapCircleNonAlloc** on a separate job thread rather than per-entity collision events.
- Terrain collision uses a custom 2D polygon collider rebuilt on terrain-change events. The 3D terrain mesh and 2D collision shape are maintained separately — the 3D mesh is visual, the 2D shape is what the simulation uses.
- The one exception: light occlusion for the void mechanic. Per the [CPU-authoritative light model](#light-and-shadow-gameplay-critical--cpu-authoritative), occlusion is computed by CPU Burst raycasts on the 2D plane and mirrored to the GPU for display — not read back from a GPU pass.

### Shaders

Shaders were avoided originally due to mobile instability circa 2015. They are now a first-class tool. Priority order:

1. **Light and shadow** — gameplay-critical (see above). The GPU renders the high-resolution look; the CPU owns the gameplay truth.
2. **Star and nebula rendering** — currently CPU-drawn and expensive. Each lifecycle phase (normal, red giant, supernova, nebula) needs distinct visual treatment.
3. **Dark matter** — visible, distinct, hazardous and alien.
4. **The cloaking effect** (draw_effect_cloak).
5. **Lightning variants** — currently multiple object types, unifiable under one shader.
6. **Terrain erosion and destruction visualization.**
7. **Atmospheric effects on planets.**
8. **Resource-saturation stress effects** (structural fractures at metal cap, gravitational-lensing shimmer at spirit cap) — see [Diegetic UX](#17-diegetic-ux--the-world-is-the-interface).
9. **Transit corridor and warp-in** (decompression wave, Lorentz snap, light-cone ignition).

### Performance Budget Targets

Starting targets, not hard requirements; adjust based on profiling:

- Tier 1 entity count: up to 500 entities at 60fps on mid-range hardware.
- Tier 2 entity count: up to 5,000 entities summarized at 10 ticks/second.
- Tier 3 systems: a lightweight galaxy-wide model carried for the full galaxy at low fidelity, with detailed aggregate behavior for roughly the nearest ~100 systems and cheapest statistical drift beyond. Exact cutoffs are a tuning target.
- Frame budget for simulation: 8ms (leaving 8ms for rendering at 60fps).
- Terrain modification events: max 10 per frame, remainder queued.

---

## 17. Diegetic UX — The World Is the Interface

The design philosophy is explicit: the game is a work of art, and art doesn't need a tutorial. The way to honor that while keeping the game readable is to make the environment itself the UI — every piece of information the player needs is expressed through the world's behavior, visuals, and sound rather than through overlays and meters. The three channels reinforce each other:

```
                    Stellar Core
                   (light, lifecycle)
                   /                \
                  /                  \
        Audio Palette ------------- Visual Spec (PBR)
        (Delta Tunes)               (biomass-metal spectrum)
```

### Diegetic Resource Metrics — Saturation Made Physical

The [triangle inequality](#the-triangle-inequality-resource-cap) already signals resource caps ecologically (plants stop yielding, deposits go inert). Reinforce this with visual and physical over-saturation on the entity itself, so the player feels a cap rather than reading one:

- **At the metal cap:** the creature's procedural mesh develops literal structural stress fractures, throwing off sharp, blinding metallic specular glints under starlight.
- **At the spirit cap:** a subtle refracting "gravitational lensing" or heat-shimmer effect in the entity's immediate radius.
- **At the biomass cap:** over-lush, swollen, sagging organic growth — fecundity past the point of health.

No warning box ever appears. The body shows the strain.

### The Dynamic Soundscape

Delta Tunes carries system-health information that would otherwise need meters (see [Audio](#15-audio-and-delta-tunes)). A balanced system resolves in a clean major key; a system drifting toward collapse or dark-matter saturation modulates into microtonal, flat, dissonant minor modes. The player feels the sickness of a world through sound before any visible crisis. Void proximity is audible before it is visible; the supernova is a musical event; the transit arrival is a crescendo.

### Kinesthetic Silhouette Language

Because the camera abstracts to radar/blip level when zoomed out, meshes must carry unmistakable silhouettes and *movement cadence* at mid-zoom — the player should diagnose ecological composition from across the system by motion alone:

- **Pure-biomass creatures** use swaying, trailing, physics-driven inverse-kinematics tendrils that catch solar currents — fluid, organic, soft.
- **Metal-dominant constructs** use rigid, segmented, step-snapping mechanical animation — hard, precise, built.
- **Balanced entities** blend the two — organic sway in some parts, mechanical snap in others.

A player should instantly read the composition of a stampeding pack from 500 meters purely by the cadence of its movement — keeping the experience artistic, immersive, and UI-free.

### Membership Without a Number

[Membership](#membership) is never shown as a value. It is legible entirely through behavior: how creatures orient toward or away from the player, whether plants grow toward them, whether structures accept their presence, what the ecosystem provides on rebirth. The relationship is felt, not displayed.

### Ecosystem Success Signals — The Replacement for Score

Removing score and meters leaves a gap: the player still needs to *feel* "my ecosystem is thriving." That feeling is delivered through accumulating, multi-channel signals rather than a number going up. A healthy, maturing system reads as richer across every sense at once:

- **Visual.** Larger and more frequent migration flocks; richer and more saturated colors; visible biodiversity (many silhouettes and movement cadences coexisting); denser nesting, grazing, and gathering activity; plants reaching and flowering.
- **Audio.** Delta Tunes adds layers and harmonic richness as ecosystem density and health rise; the key stays resolved and major; the soundscape grows fuller without the player touching anything. (See [Audio](#15-audio-and-delta-tunes).)
- **Behavioral.** The strongest signal of all: creatures interacting meaningfully *without the player's involvement* — predators and prey balancing, symbiotes pairing, decomposers swarming a carcass, a keystone quietly doing its job. A system the player can stop steering and simply watch is the clearest possible statement that it is thriving.

The inverse is equally legible: a struggling system desaturates, thins, falls quiet, and goes behaviorally inert. The player reads health and sickness the way a gardener reads a bed of plants — at a glance, by its overall vitality.

### Ecological Milestones — Progression Without Numbers

Removing traditional scoring does not remove the human need for progression. AstroGravity supplies it as **memorable moments**, not points or popups — achievements with no achievement banner. These are firsts that the world marks through its own behavior (a swell in the music, a visible bloom of activity, a creature's reaction) rather than through UI:

- The first species the player successfully introduces and watches take hold.
- The first migration the player witnesses — life leaving or arriving on its own.
- The first planet the player builds from gathered mass.
- The first ecosystem that survives a supernova and re-ignites.
- The first system that reaches mature [succession](#ecological-succession) and sustains itself without intervention.
- The first reunion with an [old friend / lineage](#11-social-ecosystem--migration-and-old-friends) in a foreign system.

Each is a story the player tells themselves, anchored in something the world *did*, not a checkbox the game ticked. The design intent is that a player describing their playthrough recounts these moments — not a level or a score.

---

## 18. Roadmap

### Current State

AstroGravity has a working skeleton in GameMaker Studio:

- Procedural spiral galaxy generation with Halton-sequence star placement and dispersion
- N-body gravity simulation (math_astrogravity)
- Space-matter classification by radius (nebula, star, planet, moon, asteroid, comet)
- Ship builder using a point/grid system with spirit, biomass, and metal materials
- Ship physics: energy system, Lorentz contraction visual, kinetic energy tracking
- Photon-based weapon energy calculated from color wavelength (E=hc/λ)
- Enemy AI with field-of-view detection, predictive targeting, bullet dodging, asteroid avoidance
- Cloaking, shields with regeneration, portals
- Multi-target camera with zoom and radar at low zoom levels
- Multiple lightning effect types
- Touch input scaffolding
- Wing animation responding to keystrokes (partial)
- Worm burrowing mechanics (separate prototype, not merged)
- Delta Tunes early scaffolding (`music_demo` object)

**Absent:** ecosystem population, living creatures, ecological relationships, the fish archetype and its fluid habitats, win/lose conditions, progression, the attraction/threat dynamic, indirect combat, resource flow between entities, the transit corridor, the social/migration layer.

The terrain destruction engine is functional and visually compelling but currently draws attention away from deeper systems rather than supporting them.

### Build Order

**Phase 0 — Engine Decision and Environment Setup.** Commit definitively to Unity with DOTS. Set up the ECS project, establish frame-budget monitoring, and validate that the core loop (gravity + entity update + camera) runs at target performance before porting anything else. Do not port content until the architecture is validated.

**Phase 1 — Port the Skeleton.** Port core systems from GML to Unity ECS, in priority order: (1) N-body gravity → Burst job; (2) space-matter generation and classification; (3) camera system; (4) ship physics; (5) ship builder → mesh generation; (6) basic collision. At the end of Phase 1 the game should feel like the current build but running in Unity with headroom to spare.

**Phase 2 — Locomotion.** Get all three archetypes feeling genuinely different before adding ecosystem content. This is the game's identity — it must be right.
1. **Bird:** finalize independent wing physics and steering. Validate that organic locomotion is clearly superior to conventional thrust.
2. **Fish:** design the habitat first. Build the shared sinusoidal rhythm locomotion, then bring up the three fish sub-types against their friction media — **Space Fish** (open space / nebula, recommended first since the nebula visual already exists), **Worm** (subsurface, merging the existing burrowing prototype as a high-friction fluid case), and **Snake** (surface / atmospheric, mid-friction). All three share one locomotion core; only the medium and role differ.
3. **Land Animal:** surface and subsurface locomotion, planetary interaction, surface cultivation hooks.

Archetype selection at game start. Each locks the player into its habitats and travel routes. *(Note: Worm and Snake are fish sub-types, not separate archetypes — this resolves the old roadmap inconsistency that listed Worm as its own milestone.)*

**Phase 3 — First Ecosystem.** Build one star system's worth of living content. Start minimal, test ecological dynamics, then expand: (1) one plant species; (2) one herbivore; (3) one predator; (4) one parasite; (5) resource flow between all four, including the shared micro-fauna subsystem for decomposers; (6) designate at least one **keystone species** and verify its loss produces a visible, audible cascade; (7) implement **ecological succession** so a bare patch recovers in readable stages rather than snapping to maturity; (8) stand up the first **ecosystem success signals** (visual density, audio layering, unprompted creature interaction) so the system's health is felt without numbers. Validate the attraction dynamic: does building up the system naturally attract beneficial *and* hostile entities without scripted spawning? Validate the [emergent rhythms](#2-player-agency-and-emergent-rhythms): can a player observe an imbalance, act, and feel the system stabilize — entirely through diegetic signals?

**Phase 4 — Terrain.** Rebuild the terrain system with chunk-based destruction, LOD, and GPU-side erosion. Integrate burrowing (already a worm/fish locomotion) as a terrain interaction. Validate that destruction requires significant effort and leaves consequences, burrowing accesses subsurface resources, terrain modification is visually geological, and material drifting/accretion returns loose matter to bodies over time.

**Phase 5 — Personality Engine.** Implement personality for all nonzero-spirit entities: (1) base needs as the behavioral foundation; (2) states emerging from need satisfaction, including Purposeless/Wandering; (3) traits generated at creation, biased by ecosystem conditions; (4) triangle-inequality caps enforced by world response (and diegetic saturation visuals); (5) mid- and high-tier needs gated by spirit threshold, with **Meaning implemented as a behavioral/perception filter, not a draining stat**; (6) player personality: trait accumulation from behavior, partial inheritance on rebirth.

**Phase 6 — Death, Rebirth, Membership, and Transit.** 
1. Membership per system, implemented to the [concrete mechanics](#membership--concrete-mechanics): one bounded float per visited system on a threat→stranger→native scale, rising slowly via cultivation/defense/presence and falling fast via destruction, always recoverable, gently decaying toward neutral under neglect, informed by galaxy-wide species reputation keyed to Family Hashes. No faction-competition layer.
2. Death-rebirth from the system's ecosystem; body and starting resources scale with membership.
3. Void as a distinct zone: no ecosystem, no rebirth anchor, 100% loss on death.
4. Void creatures: entities adapted to the absence of ecosystem, built as a **utility-AI** (score-and-pick against observed state) rather than a strategic planner — the perception of cunning, cheaply.
5. Natural transit windows: stellar alignments and phenomena creating corridors; portals as the artificial equivalent.
6. **The transit corridor mini-game** (6a transit engine: spline corridor instancing; 6b physics loop: forward force + lateral steering + Burst-spawned Smasher/Maw hazards; 6c failure resolution: cargo spill + void respawn) and the **ArrivalTransitionSystem** (warp-in VFX, Lorentz snap, distance-scaled wake harvest, Delta Tunes crescendo). The Land Animal's biological-ark transit is implemented here, sharing the same corridor.

**Phase 7 — Indirect Combat and Threat Cycles.** Remove or heavily penalize direct weapons. Build: (1) growable/buildable autonomous defenders; (2) threat-cycle conditions (darkness, stellar phenomena, population thresholds); (3) raider behavior triggered by accumulated resource density; (4) ecological offense — redirecting or weaponizing parasites and predators. *Do not remove direct shooting until indirect combat is functional and clearly superior.*

**Phase 8 — Events Engine.** Implement the storyteller and event library after ecosystem and personality systems have real content to react to: (1) event template library (stellar, ecological, void, manufactured, discovery — including Stellar Indigestion); (2) threshold monitors sampling ecosystem state; (3) storyteller pacing layer (quiet-too-long and overwhelmed detection); (4) transit events with duration, quality, and associated phenomena.

**Phase 9 — Galaxy Population, Social Ecosystem, and Memory.** Expand to fill the galaxy. Each system gets its own procedurally generated ecology, biased by physical properties (star size, planet count, proximity). Creature designs vary by system. Add inter-system routes for each archetype and connect membership, transit, and void systems galaxy-wide. Implement the **Family-Hash migration/lineage system** and "Old Friends" arrival behavior — NPC inter-system migration driven by systemic conditions (population peaks, resource exhaustion, meaning-driven wandering, flight from catastrophe), the feed-vs-consume loyalty loop, reputation carry-over, and the Guardian-Shepherd / Cosmic-Tracker emergent playstyles. Then build the **memory layer** on the same substrate: inherited lineage behavior, established migration routes, recognizable old colonies, and returning musical signatures — the reunion cues that make the galaxy feel like it remembers. Wire up **milestone moments** (first introduction, first migration witnessed, first planet built, first supernova survived, first self-sustaining system, first lineage reunion) as diegetic events, not popups. *This layer depends on transit (Phase 6), personality (Phase 5), and population all being live first — memory is only legible once the player has history to remember.*

**Phase 9b — Procedural Storytelling (The Chronicle).** Build the optional [storytelling layer](#14-procedural-storytelling--the-chronicle) on top of the now-live milestone, lineage, memory, and personality systems. Deliberately *not* a quest system: (1) **pattern matchers** subscribed to existing event/lineage/personality/milestone signals that recognize situations with narrative shape; (2) a hand-authored **narrative template library** with tone variants (warm, wry, elegiac) selected by world state, including permission to be genuinely funny; (3) a **chronicle store** keyed to the systems and lineages entries describe; (4) glanceable, non-interrupting **opt-in surfacing** that reads as a diegetic artifact of the world; (5) sparing **threads** — narrative invitations with no objective, tracker, reward, or failure, dialable down to zero. *No quest log, no objectives, no chores — ever. Fully ignorable without penalty. Build only after Phase 9's substrate is rich enough to read.*

**Phase 10 — Polish and Completion.** The game is a work of art, not a product. Polish means the simulation feels alive, the color and sound language read clearly, and the world feels like it exists whether or not the player is in it. This phase has no fixed endpoint — it ends when the sandbox is thriving.

### What to Avoid

- Building more on the GameMaker prototype. The ceiling is too low.
- Removing direct shooting before the indirect combat system is functional and clearly superior.
- Adding UI, menus, or onboarding before the core experience works. Art doesn't need a tutorial — express state diegetically instead.
- Scope creep into the fish archetype before its habitats are designed. No habitat, no fish.
- Implementing the events engine before the ecosystem and personality systems have real content to react to it.
- **Building the transit corridor or the social/migration layer before their dependencies are live.** A corridor with nowhere meaningful to arrive, or an "Old Friends" system with no migrating lineages, is effort spent on an empty stage.
- **Reading light back from the GPU for gameplay.** Keep the simulation's light truth on the CPU; let the GPU display it.
