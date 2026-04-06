# Plan: Anti-Slop Design Skill

Skill that generates **5 radically different design variants** for any UI request, presents them in a toggleable comparison view, and lets the user pick their favorite. Integrates the `frontend-design` skill as its generation engine. Prevents AI slop through blacklists, curated asset libraries, and a structured audit loop.

---

## Gap This Skill Fills

| Existing skill | Covers | Missing |
|---|---|---|
| `frontend-design` | Creative direction, bold aesthetics | Single output, no comparison, no blacklists, no curated assets |
| `ui-skills` | Technical constraints (Tailwind, a11y, perf) | Zero aesthetic guidance |
| `ui-ux-pro-max` | Broad catalog (50 styles, 21 palettes) | No multi-variant workflow, no audit loop |
| `design-shotgun` | Multiple variants + comparison board | No anti-slop blacklists, no curated font/color libraries |

**This skill uniquely combines:**
- 5 unique design variants per request (different aesthetic, font, color, layout each)
- Toggle switcher UI to compare all 5 side-by-side
- User picks winner → skill adopts and polishes that variant
- `frontend-design` skill as the generation engine (taste + creativity)
- Blacklist system (fonts, patterns, layouts to NEVER produce)
- Curated font/color/aesthetic libraries (concrete assets, not vibes)
- Generate → Audit → Normalize → Polish workflow per variant

---

## Skill Name

`anti-slop-design`

**Trigger description draft:**
> Generate 5 radically different design variants for any UI, with a toggle switcher to compare them. Each variant uses a unique aesthetic style, font pairing, color palette, and layout — none generic, none AI-slop. Integrates the `frontend-design` skill for creative generation. Prevents Inter, purple gradients, glassmorphism, shadcn defaults via blacklists and curated asset libraries. After comparison, user picks their favorite to adopt. Use when building any UI — components, pages, dashboards, landing pages — and you want distinctive, intentionally designed output. Triggers on: "design this", "show me options", "avoid AI slop", "distinctive UI", "not generic", "unique design", "explore designs", "give me variants".

---

## Skill Architecture

```
anti-slop-design/
├── SKILL.md                          # Core workflow + blacklists + variant engine + toggle UI
└── references/
    ├── font-library.md               # Curated fonts by category with pairings
    ├── color-systems.md              # Palette recipes, token templates, dark/light
    ├── aesthetic-styles.md           # 12+ named styles with characteristics + when to use
    ├── toggle-switcher.md            # HTML/CSS/JS for the 5-variant comparison toggle UI
    ├── audit-checklist.md            # Slop detection checklist for post-generation review
    └── prompt-templates.md           # Fill-in templates for component/page/screen briefs
```

---

## Phase 1: SKILL.md Body Design

Core document (~450 lines). Sections:

### 1. Skill Integration: `frontend-design`

This skill uses `frontend-design` as its creative generation engine. The workflow:

1. `anti-slop-design` handles: brief collection, aesthetic assignment, blacklist enforcement, variant diversity, toggle UI, user selection
2. `frontend-design` handles: actual code generation with bold creative direction per variant

**How integration works:**
- Before generating each variant, load the `frontend-design` skill instructions
- Pass it a variant-specific brief with: assigned aesthetic style, font pairing, color palette, layout direction
- `frontend-design` generates the code; `anti-slop-design` audits the output against blacklists
- If audit fails → regenerate with explicit corrections

**Instruction in SKILL.md:**
```
For each of the 5 variants, invoke the `frontend-design` skill with variant-specific
creative direction. The frontend-design skill provides the creative generation engine;
this skill provides the constraints, diversity, and selection workflow around it.
```

### 2. Blacklist System (NEVER rules)
Loaded immediately. Applied to ALL 5 variants.

**Banned fonts:** Inter, Roboto, Arial, Open Sans, Space Grotesk, system-ui, system fonts

**Banned patterns:**
- Purple gradients on white backgrounds
- Glassmorphism / frosted glass
- Cards nested inside cards
- Bounce / elastic animations
- Icon above every heading
- Generic shadcn/Tailwind UI component layouts
- Gray text on colored backgrounds
- Evenly-distributed timid palettes

**Banned defaults:**
- Leaving font choice to the AI's default
- `border-radius: 8px` everywhere
- Same shadow on every element
- 400 vs 600 weight as "contrast"

### 3. Design Brief Protocol
Before generating ANY variant, collect the brief:

```
1. User job + success state (one sentence)
2. Screen inventory (required components + actions)
3. Token constraints (palette, type, spacing, elevation) — OR "surprise me"
4. Interaction states (per interactive component)
5. Reference products/sites capturing target vibe — OR "explore freely"
```

If user says "surprise me" for fields 3 and 5 → skill auto-assigns 5 maximally different aesthetics from `references/aesthetic-styles.md`.

### 4. 5-Variant Generation Engine (CORE WORKFLOW)

**Step 1 — Assign 5 Unique Aesthetic Directions**

Select 5 styles from `references/aesthetic-styles.md` that are **maximally different** from each other. Each variant gets:
- A different named aesthetic style
- A different font pairing from `references/font-library.md`
- A different color palette from `references/color-systems.md`
- A different layout approach (asymmetric, grid-strict, editorial, single-column, dashboard)

**Diversity constraint:** No two variants may share the same font family, primary palette, or layout pattern. Each must feel like it came from a different designer.

Example assignment for a "dashboard" request:

| Variant | Style | Display Font | Palette | Layout |
|---|---|---|---|---|
| A | Swiss/International | DM Sans 900 | Arctic Steel | Grid-strict, 12-col |
| B | Terminal/Code Editor | JetBrains Mono | Midnight Teal | Monospace dashboard |
| C | Editorial/Magazine | Fraunces 900 | Warm Paper | Asymmetric editorial |
| D | Japanese Minimalism | Cormorant Garamond | Noir Gold | Extreme whitespace |
| E | Neo-Bauhaus | Archivo Black | Obsidian Fire | Geometric blocks |

**Step 2 — Generate Each Variant**

For each of the 5 variants:
1. Load `frontend-design` skill instructions
2. Pass variant-specific brief: aesthetic + font + palette + layout + blacklist
3. Generate complete, working code (HTML/CSS/JS or React — matching user's stack)
4. Each variant must be a **self-contained, fully functional implementation** — not a mockup

**Step 3 — Audit Each Variant**

Run `references/audit-checklist.md` against each variant:
- Any blacklisted font/pattern/layout? → Fix immediately
- Token consistency? → Normalize to CSS variables
- Distinctive enough? → If it could be confused with another variant, differentiate more

**Step 4 — Build Toggle Switcher UI**

Generate a single HTML file containing all 5 variants with a toggle bar. See `references/toggle-switcher.md` for the template.

Toggle UI requirements:
- Fixed top bar with 5 buttons labeled: `Design A`, `Design B`, `Design C`, `Design D`, `Design E`
- Each button shows: style name + one-word vibe (e.g., "A: Swiss — Clean")
- Clicking a button shows that variant's full implementation, hides the others
- Active button visually highlighted
- Smooth transition between variants (fade, not jump)
- Toggle bar itself styled neutrally (dark, minimal) so it doesn't bias perception
- Current variant name displayed prominently
- Mobile-responsive: buttons stack or scroll horizontally on small screens

**Step 5 — Present to User + Ask for Selection**

After generating the toggle file:
1. Show the user the file path
2. Briefly describe each variant (2-3 words per style: "A: Swiss — grid-strict, DM Sans, blue accent")
3. Ask: **"Which design do you want to adopt? Pick A-E, or tell me what to mix."**

**Step 6 — Adopt + Polish Selected Variant**

When user picks a variant:
1. Extract the selected variant's code from the toggle file
2. Run the full `frontend-design` polish pass on it
3. Apply final audit from `references/audit-checklist.md`
4. Output clean, standalone production code (no toggle UI, no other variants)
5. If user says "mix A and C" → combine the specified elements and re-audit

### 5. Quick Navigation to References
- Need fonts? → Read `references/font-library.md`
- Need colors? → Read `references/color-systems.md`
- Need aesthetic direction? → Read `references/aesthetic-styles.md`
- Toggle UI template? → Read `references/toggle-switcher.md`
- Post-generation review? → Read `references/audit-checklist.md`
- Need a prompt template? → Read `references/prompt-templates.md`

---

## Phase 2: Reference Files

### `references/font-library.md` (~250 lines)
Curated fonts by category. Each entry: font name, weight range, pairing, when to use, Google Fonts availability, React Native compatibility.

**Categories:**
| Category | Fonts |
|---|---|
| Code / Technical | JetBrains Mono, Fira Code, IBM Plex Mono, Source Code Pro |
| Editorial / Magazine | Fraunces, Playfair Display, Crimson Pro, Newsreader, Lora |
| Startup / Modern | Clash Display, Satoshi, Cabinet Grotesk, General Sans |
| Distinctive / Personality | Bricolage Grotesque, Plus Jakarta Sans, Syne, Outfit |
| Geometric / Structural | DM Sans, Manrope, Figtree, Urbanist |
| Luxury / Refined | Cormorant Garamond, Libre Baskerville, Spectral |
| Playful / Creative | Archivo Black, Unbounded, Rubik, Lexend |

**Pairing rules:**
- Serif display + mono body = editorial tech
- Geometric sans display + humanist sans body = clean modern
- Bold grotesque display + light serif body = luxury contrast
- Weight contrast: 100-200 vs 800-900 (never 400 vs 600)
- Size jumps: 3x minimum (not 1.5x)

**React Native section:**
- List which fonts are available via `expo-google-fonts`
- Note fonts that need custom loading vs system availability
- RN-specific fallback strategy

### `references/color-systems.md` (~180 lines)
Named palette systems with hex values, CSS variable templates, dark/light mode variants.

**Palette archetypes (minimum 8):**
| Name | Bg | Text | Accent | Vibe |
|---|---|---|---|---|
| Obsidian Fire | #0A0A0A | #F5F0E8 | #FF4D00 | High-energy dark |
| Midnight Teal | #0D1117 | #E6EDF3 | #00D1B2 | Developer/tech |
| Warm Paper | #F5F0E8 | #1A1A1A | #C75000 | Editorial warmth |
| Arctic Steel | #F8FAFC | #0F172A | #2563EB | Clean professional |
| Forest Deep | #0C1810 | #D1E8D5 | #4ADE80 | Organic/nature |
| Noir Gold | #111111 | #FAFAFA | #D4A853 | Luxury/premium |
| Electric Night | #0A0118 | #E2D9F3 | #A855F7 | Purple done RIGHT (on near-black) |
| Terracotta | #1C1210 | #F0E6DC | #C2724E | Warm earthen |

Each palette includes: CSS variable block, RN StyleSheet equivalent, dark/light toggle logic, semantic aliases.

**Rules:**
- One dominant bg + one text + one accent = minimum viable palette
- Max 2 supporting neutrals
- 60/30/10 distribution (not even spread)

### `references/aesthetic-styles.md` (~300 lines)
12 named aesthetic directions. Each entry includes characteristics, font pairings, palette, layout, and a micro-example.

| Style | Key Traits | Best For |
|---|---|---|
| Swiss / International | Grid-strict, high contrast, sparse | SaaS, productivity |
| Brutalist | Raw, bold borders, stark contrast | Dev tools, portfolios |
| Editorial / Magazine | Asymmetric, large serif, dramatic scale | Content, media |
| Terminal / Code Editor | Monospace, dark, green/amber accent | Dev tools, dashboards |
| Tactile Digital | Spring physics, physical metaphors | Consumer mobile |
| Anti-Polish | Grain, texture, organic imperfections | Creative, lifestyle |
| Nature Distilled | Organic curves, natural palettes | Wellness, fitness |
| Neo-Bauhaus | Primary colors, geometric, bold structure | Design tools |
| Art Deco | Gold, geometric patterns, symmetry | Finance, luxury |
| Retro Computing | Pixel fonts, CRT, limited palette | Games, nostalgia |
| Japanese Minimalism | Extreme whitespace, delicate type | Premium products |
| Industrial | Monospace, warning colors, utility-first | Monitoring, ops |

Each entry includes web AND React Native implementation notes.

### `references/toggle-switcher.md` (~150 lines)
Complete HTML/CSS/JS template for the 5-variant comparison UI.

**Template structure:**
```html
<!-- Toggle bar: fixed top, dark neutral, 5 buttons -->
<!-- Variant containers: 5 divs, one visible at a time -->
<!-- JS: toggle logic, keyboard nav (1-5 keys), fade transition -->
<!-- Responsive: horizontal scroll on mobile -->
```

**Requirements:**
- Self-contained (no external deps)
- Toggle bar styled dark/neutral so it doesn't bias any variant
- Keyboard accessible: press 1-5 to switch
- Each variant section marked with data attribute for extraction
- Fade transition between variants (200ms opacity)
- Shows variant label: "Design A: Swiss — Clean, grid-strict, DM Sans"
- For React Native: output as separate component files instead (no toggle HTML — use a text list describing each variant with file paths)

### `references/audit-checklist.md` (~120 lines)
Post-generation slop detection. Applied to EACH of the 5 variants.

**Typography audit:**
- [ ] Font is NOT in the blacklist
- [ ] Weight contrast is 300+ points
- [ ] Size jumps are dramatic (3x+)
- [ ] Display and body fonts intentionally different
- [ ] Font serves the aesthetic (not a safe default)

**Color audit:**
- [ ] No purple gradient on white
- [ ] Palette uses CSS variables / RN theme tokens
- [ ] 60/30/10 distribution
- [ ] Accent in max 2-3 places
- [ ] Background is NOT plain white or #F5F5F5

**Layout audit:**
- [ ] Not a symmetric card grid
- [ ] At least one layout-breaking element
- [ ] Generous whitespace OR controlled density
- [ ] No cards inside cards
- [ ] No icon above every heading

**Pattern audit:**
- [ ] No glassmorphism
- [ ] No bounce/elastic animations
- [ ] No generic shadcn/Tailwind UI layouts
- [ ] Background has texture/depth
- [ ] Hover states (web) / press states (RN) exist and are distinctive

**Cross-variant uniqueness audit:**
- [ ] No two variants share a font family
- [ ] No two variants share a primary palette
- [ ] No two variants share a layout pattern
- [ ] Each variant is immediately distinguishable from the others

### `references/prompt-templates.md` (~120 lines)
Fill-in templates for brief collection and variant-specific generation prompts.

**Brief collection template, variant assignment template, and per-variant generation prompt template.**

---

## Phase 3: Implementation Order

1. **Create skill directory** — `anti-slop-design/` with SKILL.md + references/
2. **Write toggle-switcher.md first** — the comparison UI is the novel core
3. **Write reference files** — font-library, color-systems, aesthetic-styles
4. **Write audit-checklist and prompt-templates**
5. **Write SKILL.md** — ties everything together: brief → 5 variants → toggle → selection → adopt
6. **Test with real generation** — build a dashboard with 5 variants, verify toggle works, run audit
7. **Package** — run package_skill.py

---

## Phase 4: Integration with `frontend-design` Skill

**This skill orchestrates; `frontend-design` generates.**

```
User request
    │
    ▼
/anti-slop-design (this skill)
    │
    ├─ Collect brief (5 fields)
    ├─ Assign 5 unique aesthetic directions
    │   (font + palette + style + layout per variant)
    │
    ├─ For each variant A-E:
    │   ├─ Load `frontend-design` skill instructions
    │   ├─ Pass variant-specific creative direction + blacklist
    │   ├─ `frontend-design` generates the code
    │   ├─ Audit output against blacklist + checklist
    │   └─ Fix any violations
    │
    ├─ Build toggle switcher UI with all 5 variants
    ├─ Present to user: "Which design? A-E or mix."
    │
    └─ User picks → Extract → Polish → Output production code
```

**Why this split works:**
- `frontend-design` already excels at creative, bold code generation
- This skill adds what it lacks: diversity enforcement, concrete assets, comparison workflow
- No duplication — each skill does what it's best at

---

## Resolved Decisions

1. **Scope:** Web + React Native (both platforms). Reference files include RN-specific guidance (StyleSheet patterns, RN-compatible fonts, mobile layout conventions).
2. **Project config:** No per-project config. Skill uses built-in references only. Keeps it simple and portable.
3. **Triggering:** Explicit invocation only via `/anti-slop-design`. No auto-triggering.
4. **Integration:** Fully standalone. Uses `frontend-design` as generation engine but has no external dependencies.
5. **Variants:** Always 5 unique designs. Each with different aesthetic, font, palette, layout. Toggle UI for comparison.
6. **Selection:** User picks favorite (A-E) or requests a mix. Skill extracts, polishes, and outputs production code.
