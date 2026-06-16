# AstroGravity — Comparable Games, Borrowable Resources, and the Local-AI Storyteller

> A research companion to the design doc. Three parts: (1) games that genuinely overlap AstroGravity's design, with honest similarity notes; (2) open-source and free-to-use projects you can study, fork, or assimilate — with **license reality checks**, since "open source" does not always mean "use however you want"; (3) the local-AI storytelling idea, which is more viable than it sounds.
>
> **One blanket warning up front:** *studying* a game is always free; *copying its code or assets* depends entirely on its license. Most commercial indie games (Rain World, Solar 2, Spore, Eternal Cylinder, No Man's Sky) are **closed-source and fully copyrighted** — you can learn from how they feel and behave, but you cannot lift code or art. The genuinely *borrowable* projects are a much shorter list, called out in Part 2.

---

## Part 1 — Comparable Games (study these; don't copy them)

The two AI write-ups you pasted are mostly accurate on the *design* overlaps. The similarity percentages are subjective but directionally fine. The important correction is licensing: none of the Tier-1 design cousins below are open source, so they are inspiration only.

### Closest design cousins

**Rain World** — the closest spiritual relative, and worth playing before you build. You are an animal, not a hero; the ecosystem runs on its own AI and food chains independent of you; there is almost no UI (state is read through animal posture, color, and sound); it has a hidden global reputation system where species remember how you treated them and react on sight; and death/karma works much like your membership-and-rebirth loop. Maps onto your ecosystem philosophy, diegetic UX, reputation, and animal-embodiment pillars. **Closed-source commercial (Videocult/Adult Swim).** Study only.

**Creatures / Creatures 3 (1996–2001)** — the canonical deep artificial-life series and the single best reference for your **personality engine**. Entities have stacked internal needs (sustenance, boredom/novelty, loneliness) that tick continuously and flip behavior under stress; they breed, alter their environment, migrate between chambers, and pass evolved behavioral traits down generations — so finding "old friends" or their descendants later is a real mechanic, not a metaphor. The original games are commercial, **but the engine has an open-source reimplementation** — see Part 2 (openc2e), which is one of your most valuable study targets.

**SimEarth / classic ecosystem sims (Maxis, 1990)** and **Ecosystem (by Joe Brett)** — whole-game ecology management, species interactions, ecological collapse, emergent outcomes, no traditional combat loop. Good for studying how to make an ecosystem itself the toy. Commercial/closed.

### Strong partial matches

**Spore — Space Stage (2008)** — people *will* compare AstroGravity to Spore, so know it well. Its Space Stage targeted a chunk of your high-level loop: travel between systems carrying seeds and creature cargo from a thriving home world, drop a balanced triangle of producers/herbivores/predators onto barren worlds, and terraform them into self-sustaining ecologies. The widespread critique — shallow ecology, progression-driven, no real consequence — is precisely the gap AstroGravity fills. As one of your reviewers put it, AstroGravity is "the game many people hoped Spore would become." Commercial/closed.

**Solar 2 (2011, Murudai / Jay Watts)** — the closest match for your **planet-building and mass-aggregation feel**. You are a celestial body on a 2D plane using gravity to accrete asteroids and dust; accumulate enough mass and you evolve asteroid → planet → life-bearing planet (which spawns autonomous defenders, echoing your attraction dynamic) → star → supernova. It is also explicitly a "relaxing, zone-out" sandbox with optional comedic tasks you can ignore — directly relevant to your optional-storytelling goal. **Important correction to your second AI source: Solar 2 is *not* open source.** It's a commercial XNA game. Study the feel; you can't take the code. (Its own lineage traces back to *flOw* by Thatgamecompany, another biomimicry/minimal-UI reference worth a look.)

**The Eternal Cylinder (2021)** — strange alien ecology, creature adaptation, biological problem-solving, art-first design. More narrative-driven and less systemic than you, but a strong visual/tonal reference for "weird alien life that feels designed." Commercial/closed.

**No Man's Sky (2016)** — procedural galaxy, planet/discovery scale, seamless space-to-surface. But it's inventory-heavy, grind-driven, and its ecology is mostly decorative — i.e., a useful *contrast* that clarifies what you're deliberately *not* doing. Commercial/closed.

**Birthdays the Beginning (2017, Yasuhiro Wada)** — ecosystem cultivation, species emergence, environmental manipulation, and genuine **ecological succession** (one of your newer systems). Tiny scale, no player-creature, no galaxy, but the succession modeling is directly relevant. Commercial/closed.

### Design ancestors (pieces, not wholes)

- **Dwarf Fortress** — emergent stories, simulation-first design, world persistence, the player generating their own narratives. The patron saint of "the story is the simulation's." Commercial (free classic build), closed-source.
- **RimWorld** — the **AI storyteller** pattern your events engine already cites; emergent narrative under ecological/economic pressure. Commercial/closed.
- **Shelter (Might and Delight)** — being an animal, nurturing over fighting, emotional attachment to dependents. Commercial/closed.
- **flOw / Flower / Journey (Thatgamecompany)** — biomimicry, organic movement, minimal UI, art-first, environmental restoration as theme. The aesthetic-philosophy ancestors of your "art over product" pillar. Commercial/closed.

### What has no strong precedent (your actual moat)

Both reviewers independently flagged the same cluster as genuinely novel — worth repeating because it tells you where to concentrate originality:

1. Animal archetypes as the player's "ship class."
2. Dark matter generated from **spirit/intelligence**, not metal.
3. Migration and **lineage memory** across a galaxy.
4. Diegetic, ecosystem-based progression replacing scores.
5. Void creatures as ecological **entropy** rather than scripted enemies.
6. Planet creation through **animal behavior** rather than construction.

No single existing game combines these. That combination is the pitch.

---

## Part 2 — Borrowable Resources (study, fork, or assimilate)

This is the part that actually matters for "buy or safely copy freely." The honest filter: a project is safely reusable only if its **license** permits it. Below, each entry states the license and what it lets you do.

### Destination Sol — your strongest fork/assimilation candidate

**License: Apache 2.0 (code).** This is the permissive, commercial-friendly license. You may fork it, modify it, ship a commercial product built on it, and even relicense your changes — the only real obligations are preserving copyright/license notices and the NOTICE file. This is about as friendly as open source gets.

**What it is:** a complete, shipped, open-source 2D space arcade/RPG — randomly generated star systems, planets, asteroid belts, **seamless landing on planets**, multiple ship types, mining, enemies, trading. Originally by Milosh Petrov's team, now maintained by the **MovingBlocks** community (the Terasology folks).

**Why it's directly relevant:** it already implements the exact thing you cited from it — **approach a planet and the camera zooms you in and transitions to atmospheric flight, expanding the play space.** That seamless space-to-surface zoom transition, plus 2D-plane navigation, procedural system generation, and "fly out to leave the system," overlaps a real slice of AstroGravity's spatial model.

**The catch — engine mismatch.** Destination Sol is **Java + libGDX**, not Unity. So "assimilate it" splits into two honest options:

- **Assimilate as a *design and behavior reference* (recommended).** Read its source to see exactly how the zoom-to-land transition, system generation (Halton-like placement), 2D space physics, and seamless scale changes are implemented, then re-implement the equivalents in Unity DOTS. The Apache license means you can even copy algorithm structure and comments directly. This is high-value and low-risk.
- **Assimilate as an *actual codebase* (heavier).** You *could* fork it and build AstroGravity inside libGDX instead of Unity — it already has the skeleton you'd otherwise rebuild. But this contradicts your committed Unity-DOTS decision, gives up DOTS's simulation-density advantages (which your whole ecosystem scale depends on), and libGDX is less suited to thousands of simulated entities. **Verdict: borrow its ideas and specific solutions, not its engine.** Forking it wholesale would mean rebuilding your engine strategy around a 2D Java arcade game — the wrong trade for a simulation this heavy.
- **Note on assets:** the Apache license covers the *code*. Destination Sol's **soundtrack is CC-BY-NC** (NeonInsect) and its **sprites are CC-BY 4.0** (MillionthVector). The NC soundtrack is **not** usable in a commercial product; the CC-BY sprites are usable *with attribution* but you won't want 2D sprites for a 3D game anyway. Treat assets separately from code.
- **Repos:** engine at `github.com/MovingBlocks/DestinationSol`; content modules at `github.com/DestinationSol`. There's also a `TutorialGalaxyGeneration` module worth reading for procedural-galaxy specifics.

### openc2e — the artificial-life engine reference

**License: LGPL-2.1.** Open source, but **copyleft with a linking caveat.** LGPL lets you use and even link to the library while keeping your own code separate-licensed, but modifications *to openc2e itself* must stay LGPL, and static linking/embedding has obligations. For a Unity/C# project this is mostly a **study** resource rather than something to embed.

**What it is:** a C++/SDL open-source reimplementation of the **Creatures** game engine — including a CAOS script runtime, a basic physics engine, and crucially the **genome/creature biochemistry and needs simulation** that let hundreds of creatures run their personality/need/evolution loops off-screen without melting down.

**Why it's relevant:** this is the closest thing to a working reference implementation of *your personality engine's hardest problem* — many autonomous, need-driven, breeding, trait-inheriting entities simulated continuously. Read how openc2e structures needs, drives, and genome inheritance, and how it keeps that affordable. You're not going to link a C++ LGPL engine into Unity DOTS, but the *architecture* is gold. **Verdict: study target, not a dependency.** Repo: `github.com/openc2e/openc2e`.

### Engine and framework layer (the stuff you'll actually depend on)

- **Unity DOTS / Entities / Burst / Jobs** — your committed stack. Unity's own license terms apply (not open source, but free at your revenue scale). This is the foundation; everything below is a library on top.
- **Terasology ecosystem (MovingBlocks)** — Apache-2.0. Same community that maintains Destination Sol; their frameworks and module architecture are worth a look for how to structure moddable, data-driven content, even though Terasology itself is Java voxel tech.
- **For procedural galaxy + N-body specifically:** your prototype already has this (Halton placement, math_astrogravity). Destination Sol's generation code is the best *open* cross-reference. Beyond that, standard open libraries (Barnes-Hut / quadtree N-body implementations on GitHub, typically MIT/Apache) are plentiful and safely reusable — search for "Barnes-Hut Burst" and "quadtree gravity C#."

### Audio layer (for Delta Tunes)

- **FMOD Studio** and **Wwise** — both are commercial middleware with **free indie tiers** (revenue-gated). Not open source, but the standard professional path for the parameter-driven adaptive music your doc specifies, and far cheaper than building synthesis tech yourself. Recommended over Unity's native mixer per your own audio section.
- **Open-source DSP if you ever pursue the bespoke-synthesis layer:** libraries like **SoundPipe**, **Csound** (LGPL), or **Pure Data / libpd** (BSD-like) are how you'd generate tones from math functions without writing a synth engine from scratch. Treat as a *later, optional* enhancement exactly as the design doc warns — don't let Delta Tunes become an audio-middleware project.

### Asset sources (free/cheap, license-clean) — when you need placeholder or shipping art/audio

Since AstroGravity's identity is procedural and material-based, you need surprisingly little hand-made art — but for placeholders, UI, and SFX:

- **Kenney.nl** — CC0 (public domain), enormous game-asset library, space packs included. Zero attribution, commercial-safe. The single best free asset source for prototyping.
- **OpenGameArt.org** — mixed licenses (CC0, CC-BY, GPL); filter by license carefully.
- **Freesound.org** — mostly CC0/CC-BY sound bytes; ideal raw material for Delta Tunes' sample bank (mind per-clip attribution).
- **Quaternius**, **Poly Pizza** — CC0 3D models for placeholders.
- **NASA image/audio libraries** — public domain space imagery and sonifications, good for reference and some direct use.

> **CC0 vs CC-BY vs CC-BY-NC, quickly:** CC0 = do anything, no credit needed. CC-BY = do anything *with credit*. CC-BY-NC = **non-commercial only** — unusable if you ever sell or monetize the game. Always check the NC flag before committing to an asset.

---

## Part 3 — The Local-AI Storyteller

Your instinct here is sound and, as of 2025–2026, technically grounded: a **small, locally-run language model is a genuinely good fit for the Chronicle layer** (§14 of the design doc) — *if* it's fenced in with strong rules and fed structured material rather than asked to invent freely.

### Why it fits this specific job

The Chronicle's job is narrow and bounded: take *structured facts the simulation already produced* (a lineage went extinct then reappeared; a companion survived the void four times; the player destroyed five planets) and render them into short, flavorful, tonally-appropriate prose. That is **summarization-and-styling with retrieval**, not open-ended reasoning — exactly the task class small models handle well. Recent work confirms the feasibility:

- A peer-reviewed 2026 paper (Foundations of Digital Games) demonstrated **high-quality dynamic game content generation via *small* language models** as a proof of concept, explicitly finding real-time generation feasible under typical game-engine constraints, with content-safety guard-railing achievable at all quantization levels through data curation. Your use case (short narrative entries) is *easier* than the general case they tested.
- The quality gap between local and cloud models has closed sharply: quantized **7–8B models** (Llama 3.x, Mistral Small, **Qwen 3**) now run on a mid-range GPU or Apple Silicon laptop at usable speeds, and handle styling/summarization tasks well. Smaller still — **Phi-class 3.8B** and even 1–2B models — are viable for the lightest narration if you constrain the task tightly.

### Licensing for shipping a model inside a game

This is the part to get right, because not every "open" model is commercially redistributable:

- **Qwen 3 (Alibaba)** — **Apache 2.0.** Cleanest option for *embedding and shipping* a model with a commercial game. Dense 7B and smaller variants exist.
- **Mistral / Mixtral (Apache-2.0 variants)** — also clean for redistribution.
- **Llama 3.x (Meta)** — strong and popular, but ships under the **Llama Community License**, *not* OSI-open; it has use restrictions and an above-threshold-MAU clause. Fine for most indie scales, but read the terms before bundling.
- **Phi (Microsoft)** — MIT on several releases; good tiny-model option.

For a shippable game, **Qwen 3 (Apache-2.0)** or a Mistral Apache variant, quantized to GGUF and run via an embedded **llama.cpp** runtime, is the most license-clean, lowest-friction path.

### How to make it cheap, safe, and *good* — the rules that matter

The danger with any generative narration is incoherence, tonal drift, inappropriate content, or it "making things up" that contradict the simulation. The mitigations map almost perfectly onto principles already in your design:

1. **It narrates facts; it never invents events.** The model receives a structured record of what *actually happened* (entities, lineages, traits, outcomes) and is instructed to *describe only that*. This mirrors your "the storytelling layer recognizes, it doesn't generate" rule. No free-form plot generation — retrieval-grounded styling only.
2. **Author the voice with the prompt/system rules, let the world supply content** — the exact split your doc already uses for Delta Tunes ("author the palette, let the world play it"). A strong, fixed system prompt encodes the wry-naturalist tone, length limits, and the tonal variants (warm / wry / elegiac) selected by world state.
3. **Templated scaffolding + model polish.** Don't ask the model for everything. Generate the skeleton from hand-authored templates (guaranteeing coherence and factual accuracy), then use the model only to *vary the wording and add flavor*. This is cheaper, faster, safer, and keeps quality high even on a 2B model. It also means the game degrades gracefully — if the model is disabled or absent, the templates alone still produce readable entries.
4. **Guard-rail content at the data and prompt layer.** The FDG research showed inappropriate-output prevention is achievable through curation and instruction even at heavy quantization. A constrained vocabulary, a banned-content instruction, and a lightweight output filter handle the rest. Because the model only ever describes in-world ecological events, the surface area for harmful output is already small.
5. **Run it off the hot path.** Chronicle entries are written when something *concludes* (a lineage dies, a milestone lands), not every frame. Generation can happen asynchronously on a background thread, cached as text, and surfaced when the player glances at the chronicle. No frame-budget impact — same discipline as Delta Tunes' separate audio thread.
6. **Make it fully optional and local.** Local inference means no server cost, no per-token bills, no internet requirement, and no data leaving the player's machine — it's a one-time model download bundled or fetched on first run. A player on weak hardware can disable it and fall back to the templated chronicle with no loss of correctness. This honors your "ignorable without penalty" rule at the technical level.

### Net assessment

A 2–8B Apache-licensed model, quantized, embedded via llama.cpp, fed structured ecological events, fenced by a fixed tonal system prompt, scaffolded by hand-authored templates, run async and cached, fully optional — is a **realistic, inexpensive, ship-able** way to deliver the Chronicle's "storytelling with real consequence." It is one of the few places where current local-AI capability lines up almost exactly with a feature you'd want anyway. The key discipline is the same one the whole design already preaches: **let the simulation be the author; let the tool be only the voice.**

---

## Quick-Reference Table — What You Can Actually Use

| Resource | License | Safe to ship in a commercial game? | Best use for AstroGravity |
|---|---|---|---|
| Destination Sol (code) | Apache 2.0 | Yes (keep notices) | Reference *or* fork the zoom-to-land + system-gen; re-implement in Unity |
| Destination Sol (soundtrack) | CC-BY-NC | **No** (non-commercial) | Reference only |
| Destination Sol (sprites) | CC-BY 4.0 | Yes, with attribution | Placeholder only (you're 3D) |
| openc2e | LGPL-2.1 | Study yes; embedding has obligations | Architecture reference for the personality/needs engine |
| Terasology / MovingBlocks libs | Apache 2.0 | Yes | Moddable data-driven content structure ideas |
| Kenney.nl assets | CC0 | Yes, no attribution | Prototype/placeholder art + SFX |
| Freesound (CC0 clips) | CC0 / CC-BY | Yes (check per-clip) | Delta Tunes sample bank source material |
| FMOD / Wwise | Commercial, free indie tier | Yes (within tier terms) | Adaptive music engine for Delta Tunes |
| Qwen 3 (small) | Apache 2.0 | Yes | Embeddable local Chronicle narrator |
| Mistral (Apache variants) | Apache 2.0 | Yes | Alt local narrator |
| Llama 3.x | Llama Community License | Mostly (read MAU clause) | Capable narrator if terms fit |
| Phi (small) | MIT (most releases) | Yes | Tiniest-footprint narrator |
| Rain World / Solar 2 / Spore / NMS / Eternal Cylinder | Closed commercial | **No** | Design study only — do not copy code or art |

*Licenses change and vary by version/release; verify the current license on the actual repo or model card before integrating anything. This summary reflects information available as of mid-2026 and is not legal advice.*
