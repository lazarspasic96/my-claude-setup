---
name: anti-slop-design
description: Generate 5 radically different design variants for any UI, with a toggle switcher to compare them. Each variant uses a unique aesthetic style, font pairing, color palette, and layout — none generic, none AI-slop. Integrates the `frontend-design` skill for creative generation. Prevents Inter, purple gradients, glassmorphism, shadcn defaults via blacklists and curated asset libraries. After comparison, user picks their favorite to adopt and polish. Covers web (HTML/CSS/React) and React Native. Use when building any UI — components, pages, dashboards, landing pages — and you want distinctive, intentionally designed output. Triggers on: "design this", "show me options", "avoid AI slop", "distinctive UI", "not generic", "unique design", "explore designs", "give me variants", "anti-slop", "make it look good but different".
---

# Anti-Slop Design

Generate 5 unique design variants, present them in a toggle comparison UI, let the user pick their favorite, then polish and output production code. Uses `frontend-design` as the creative generation engine.

## Workflow Overview

```
1. Collect brief (5 fields)
2. Assign 5 maximally different aesthetics
3. Generate each variant using frontend-design + blacklists
4. Audit each variant against checklist
5. Build toggle switcher UI
6. User picks A-E (or mix)
7. Extract, polish, output production code
```

## Step 1: Collect Brief

Ask user for these 5 fields. If they skip 3 and 5, auto-assign.

1. **User job** + success state (one sentence)
2. **Screen inventory** — required components and actions
3. **Token constraints** — palette, fonts, spacing preference. Accept "surprise me"
4. **Interaction states** — per interactive component
5. **Reference** — 1-3 products/sites that capture the vibe. Accept "explore freely"

See [references/prompt-templates.md](references/prompt-templates.md) for the full brief collection template.

Minimum required: fields 1 and 2. Generate without 3-5 by auto-assigning from reference libraries.

## Step 2: Assign 5 Unique Aesthetics

Select 5 styles from [references/aesthetic-styles.md](references/aesthetic-styles.md) that are **maximally different**. For each variant assign:
- A named aesthetic style
- A display font + body font from [references/font-library.md](references/font-library.md)
- A color palette from [references/color-systems.md](references/color-systems.md)
- A layout approach

**Diversity constraint (mandatory):** No two variants may share font family, primary palette, or layout pattern. Cover at least 4 of 5 diversity axes: density, color temp, type voice, structure, era feel.

See [references/prompt-templates.md](references/prompt-templates.md) § Variant Assignment Template for the assignment format.

## Step 3: Generate Each Variant

For each variant A-E:

1. Load the `frontend-design` skill instructions — it is the creative generation engine
2. Pass variant-specific brief with: aesthetic + font + palette + layout + blacklist rules below
3. Generate complete, working, self-contained code (not mockups)
4. Scope CSS with variant prefix (`.va-`, `.vb-`, etc.) to prevent cross-variant bleed

See [references/prompt-templates.md](references/prompt-templates.md) § Per-Variant Generation Prompt for the full template.

### Blacklist (apply to ALL variants)

**Banned fonts:** Inter, Roboto, Arial, Open Sans, Space Grotesk, system-ui, Helvetica, Segoe UI, Noto Sans

**Banned patterns:**
- Purple/violet gradient on white or light background
- Glassmorphism (frosted glass, backdrop-filter blur as primary design)
- Cards nested inside cards
- Bounce / elastic animations (spring OK only for Tactile style)
- Icon above every heading
- Generic shadcn/Tailwind UI default layouts
- Gray text on colored backgrounds
- Evenly-distributed timid palettes

**Banned defaults:**
- Leaving font choice unspecified
- `border-radius: 8px` on everything
- Same shadow on every element
- 400 vs 600 weight as "contrast" (need 300+ point gap)
- Plain white (#FFFFFF) or #F5F5F5 as primary background

## Step 4: Audit Each Variant

Run [references/audit-checklist.md](references/audit-checklist.md) against each variant. Fix failures immediately before proceeding. Key checks:
- Typography: blacklisted font? Weak weight/size contrast?
- Color: purple on white? Inline hex? No CSS variables?
- Layout: symmetric card grid? Cards in cards? Icon above heading?
- Patterns: glassmorphism? Bounce animation? Generic shadcn?
- Cross-variant: two variants sharing font/palette/layout?

## Step 5: Build Toggle Switcher

**Web:** Generate a single HTML file with all 5 variants and a toggle bar. Use the template from [references/toggle-switcher.md](references/toggle-switcher.md). Requirements:
- Fixed top bar with 5 buttons (keyboard nav: press 1-5)
- Each button shows: "A: [Style] — [vibe]"
- Fade transition between variants (200ms)
- Dark neutral toggle bar (doesn't bias any variant)
- Mobile-responsive (horizontal scroll)

**React Native:** Generate 5 separate component files (`VariantA.tsx` through `VariantE.tsx`) + one `DesignComparison.tsx` wrapper with segment control.

## Step 6: Present + Ask User

After generating the toggle file, present:

```
Your 5 design variants:

A: [Style] — [vibe], [font], [palette]
B: [Style] — [vibe], [font], [palette]
C: [Style] — [vibe], [font], [palette]
D: [Style] — [vibe], [font], [palette]
E: [Style] — [vibe], [font], [palette]

Toggle between them with buttons 1-5. Which design do you want to adopt?
- Pick one (A-E)
- Mix elements ("A's layout with C's colors")
- Request changes ("B but warmer")
```

## Step 7: Adopt + Polish

When user picks:

**Single variant:** Extract selected variant's code → remove scoping prefix → run `frontend-design` polish pass → final audit → output clean production code.

**Mix:** Combine specified elements from multiple variants → re-audit for cohesion → polish → output.

**Changes:** Apply modifications to selected variant → re-audit → output.

## Reference Navigation

| Need | File |
|---|---|
| Font choices + pairings | [references/font-library.md](references/font-library.md) |
| Color palettes + CSS vars | [references/color-systems.md](references/color-systems.md) |
| Aesthetic style details | [references/aesthetic-styles.md](references/aesthetic-styles.md) |
| Toggle UI template | [references/toggle-switcher.md](references/toggle-switcher.md) |
| Slop detection checklist | [references/audit-checklist.md](references/audit-checklist.md) |
| Brief + prompt templates | [references/prompt-templates.md](references/prompt-templates.md) |
