# Prompt Templates

Templates for each stage of the anti-slop design workflow.

## 1. Brief Collection Template

Ask the user these 5 fields. If they skip fields 3 and 5, auto-assign from the reference libraries.

```
1. USER JOB: What is the user trying to accomplish with this screen?
   → One sentence. Example: "Track daily workouts and see weekly progress"

2. SCREEN INVENTORY: What components and actions are required?
   → List. Example: "Sidebar nav, stats cards, activity chart, workout log table, add workout button"

3. TOKEN CONSTRAINTS: Do you have a palette, font, or spacing preference?
   → Specific or "surprise me". Example: "Dark theme, warm colors" or "surprise me"

4. INTERACTION STATES: What interactive elements need defined states?
   → Example: "Buttons need hover+active, cards need hover expand, table rows selectable"

5. REFERENCE: Name 1-3 products/sites that capture the vibe you want.
   → Example: "Linear, Vercel dashboard, Stripe docs" or "explore freely"
```

## 2. Variant Assignment Template

After collecting the brief, assign 5 variants using this format. Consult `references/aesthetic-styles.md` diversity matrix to ensure maximum spread.

```
VARIANT ASSIGNMENT
==================
Request: [user's request in one line]
Stack: [HTML/CSS | React | React Native]

| Variant | Aesthetic Style    | Display Font         | Palette        | Layout Approach      |
|---------|--------------------|----------------------|----------------|----------------------|
| A       | [style name]       | [font + weight]      | [palette name] | [layout type]        |
| B       | [style name]       | [font + weight]      | [palette name] | [layout type]        |
| C       | [style name]       | [font + weight]      | [palette name] | [layout type]        |
| D       | [style name]       | [font + weight]      | [palette name] | [layout type]        |
| E       | [style name]       | [font + weight]      | [palette name] | [layout type]        |

Diversity check:
- Density axis: [sparse] ←→ [dense] covered? ✓/✗
- Color temp: [warm] ←→ [cool] covered? ✓/✗
- Type voice: [serif] ←→ [mono] covered? ✓/✗
- Structure: [grid] ←→ [organic] covered? ✓/✗
- Era feel: [retro] ←→ [futuristic] covered? ✓/✗
```

## 3. Per-Variant Generation Prompt

Use this prompt for EACH variant when invoking `frontend-design`. Fill in all brackets.

```
Build [component/page name] with these EXACT specifications:

AESTHETIC: [style name] — [2-3 key traits from aesthetic-styles.md]
FONT: [display font name] at weight [weight] for headings, [body font name] at weight [weight] for body
PALETTE (use CSS variables):
  --bg: [hex]
  --surface: [hex]
  --text: [hex]
  --text-muted: [hex]
  --accent: [hex]
  --border: [hex]
LAYOUT: [layout approach — e.g., "12-col grid-strict" or "asymmetric 2-col editorial"]
SPACING: [base unit]px base unit
RADIUS: [value]px
ELEVATION: [borders | shadows | none]

REQUIRED COMPONENTS:
[list from brief field 2]

INTERACTION STATES:
[list from brief field 4]

SCOPE CSS: Prefix all classes with [.va- | .vb- | .vc- | .vd- | .ve-] to avoid cross-variant bleed.
Include a scoped <style> block. Load Google Fonts via <link> inside the variant section.

BLACKLIST — DO NOT USE:
- Fonts: Inter, Roboto, Arial, Open Sans, Space Grotesk, system-ui, Helvetica
- Patterns: purple gradient on white, glassmorphism, cards inside cards, bounce animations
- Layouts: icon above every heading, symmetric card grid (unless Swiss style), generic shadcn patterns
- Colors: no inline hex — all via CSS variables. No plain white (#FFFFFF) background.

Make it MEMORABLE. Commit fully to the [style name] aesthetic. No hedging.
```

## 4. User Selection Prompt

After presenting the toggle UI, ask:

```
Here are your 5 design variants:

A: [Style] — [2-word vibe], [font name], [palette name]
B: [Style] — [2-word vibe], [font name], [palette name]
C: [Style] — [2-word vibe], [font name], [palette name]
D: [Style] — [2-word vibe], [font name], [palette name]
E: [Style] — [2-word vibe], [font name], [palette name]

Toggle between them using buttons 1-5 or click the tabs.

Which design do you want to adopt?
- Pick one (A-E)
- Mix elements ("A's layout with C's colors")
- Request changes ("B but with warmer colors")
```

## 5. Adoption + Polish Prompt

After user picks, extract and polish:

```
Extract Design [X] from the comparison file.

1. Remove variant scoping (rename .v[x]- prefixed classes to clean names)
2. Move <style> and <link> to document head
3. Remove toggle bar and other variant sections
4. Run the frontend-design polish pass:
   - Is there one more unexpected-but-coherent detail to add?
   - Is every spacing value intentional?
   - Are all interactive states defined and distinctive?
5. Run final audit from references/audit-checklist.md
6. Output clean, standalone, production-ready code
```

## 6. Mix Prompt (when user wants elements from multiple variants)

```
Mix elements from the selected variants:

Take from Design [X]: [specific elements — e.g., "layout structure, spacing approach"]
Take from Design [Y]: [specific elements — e.g., "color palette, font choices"]

Merge rules:
- The palette from [Y] overrides [X]'s colors
- The layout from [X] stays intact
- Fonts from [Y] replace [X]'s fonts
- Re-audit the merged result against references/audit-checklist.md
- Ensure the mix is cohesive — not Frankenstein
```
