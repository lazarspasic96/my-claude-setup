# Escaping AI Slop in UI Design

A practical guide for frontend developers using AI coding tools (Claude Code, Cursor, Codex, Windsurf) to produce distinctive, non-generic interfaces.

---

## Root Cause

AI models like Claude, GPT-4, and Codex were trained on the same corpus: Tailwind UI, shadcn/ui, and thousands of generic boilerplates. The result is convergence on the same defaults. They don't have *taste* — they have *patterns*. The fix is to inject taste explicitly through structured prompts, references, and constraints.

---

## The AI Slop Signature — Avoid All of These

### Fonts to never use
- Inter
- Roboto
- Arial
- Open Sans
- Space Grotesk *(noted as "overused by AI" even in Anthropic's own skill docs)*
- system-ui / system fonts

### Patterns to never produce
- Purple gradients on white backgrounds
- Glassmorphism
- Cards nested inside cards
- Bounce / elastic animations
- Icon above every heading
- Generic shadcn/Tailwind UI component layouts
- Gray text on colored backgrounds

---

## Strategy 1 — Prompt Engineering (Biggest Lever)

### Be a creative director, not a requester

Treat the AI as a junior designer. You must provide the brief, not just the task.

| ❌ Bad | ✅ Good |
|---|---|
| "Build me a dashboard" | "Give me 3 sidebar variations for a fintech dashboard" |
| "Create a fitness app UI" | "Workout tracker with editorial-magazine aesthetic, dark theme" |
| "Make it look modern" | "Dark, high-contrast, inspired by Vercel's design language" |

---

### Explicitly name what to avoid — in every single prompt

This single addition eliminates ~80% of AI slop:

```
Avoid Inter, Roboto, Arial, Space Grotesk, system fonts.
No purple gradients or white backgrounds.
No glassmorphism, no cards inside cards.
No generic shadcn/Tailwind UI patterns.
Think outside the box — surprise me.
```

---

### Name specific aesthetics and references

Instead of adjectives, name actual things. AI responds much better to concrete references than vague emotions.

```
Aesthetic: Swiss International Typographic Style
Inspired by: Linear, Vercel, Stripe docs
Color approach: One dominant color + sharp accent, dark theme
Layout: Asymmetric, editorial-grid, magazine-style
Motion: One orchestrated page-load with staggered reveals — no bounce
```

---

### Specify each design dimension individually

Don't say "beautiful UI" — break it into dimensions. Anthropic's own prompting docs confirm this is the most reliable approach.

#### Typography
- Name the exact font — never leave it to default
- Weight contrast: use 100–200 vs 800–900, not 400 vs 600
- Size jumps of 3× not 1.5×
- One distinctive font used decisively

**Good font choices by category:**

| Category | Options |
|---|---|
| Code / technical | JetBrains Mono, Fira Code, IBM Plex Mono |
| Editorial | Fraunces, Playfair Display, Crimson Pro, Newsreader |
| Startup / modern | Clash Display, Satoshi, Cabinet Grotesk |
| Distinctive | Bricolage Grotesque, Plus Jakarta Sans |

#### Color
- One dominant color + one sharp accent
- Commit to a cohesive palette using CSS variables
- Draw from IDE themes or cultural aesthetics for inspiration
- Avoid timid, evenly-distributed palettes

#### Motion
- One high-impact page load with staggered reveals (`animation-delay`)
- CSS-only solutions for HTML artifacts
- Motion library for React when available
- Focus on high-impact moments — not scattered micro-interactions

#### Backgrounds
- Layer CSS gradients, geometric patterns, or contextual effects
- Noise textures, grain overlays, gradient meshes
- Avoid solid colors as a default background

#### Spatial composition
- Asymmetry, overlap, diagonal flow
- Grid-breaking elements
- Generous negative space
- Unexpected layouts over predictable grids

---

### Ask for alternatives, not refinements

When output is generic, don't say "make it better." Ask for 3 alternative approaches with different aesthetics, or ask the AI to draw an analogy from an unexpected domain. This breaks the convergence loop.

```
"Give me 3 variations with completely different aesthetics for this card.
One inspired by brutalism, one editorial/magazine, one terminal/code editor."
```

---

## Strategy 2 — Your Workflow Before Touching AI

### Collect references BEFORE prompting

The single biggest quality multiplier. AI defaults to safe choices unless you give it a direction to pull toward.

1. **Find 3–5 reference designs that nail your target vibe**
   - Dribbble, Mobbin, Awwwards, Godly, Screenlane
2. **Extract what makes them work — be specific**
   - "Left-aligned hero with 900-weight headline at 80px"
   - "Amber accent on a near-black background"
   - "4px grid spacing, no border-radius"
3. **Turn that into a design brief, then paste into your prompt**
   - Now the AI has taste to borrow instead of patterns to regurgitate

---

### Define your token system first, generate inside it

AI slop happens when there's no design system owner. Define your constraints before generation, then force the AI to stay inside them.

```
Palette: #0A0A0A bg, #F5F0E8 text, #FF4D00 accent
Type: Fraunces display, IBM Plex Mono body
Spacing: 4px base unit
Radius: 2px only (sharp, not rounded)
No shadows — use borders instead
```

---

### Write a 5-field brief for every screen

```
1. User job and success state — in one sentence
2. Screen inventory — required components and actions
3. Token constraints — palette, type, spacing, elevation
4. Required interaction states — per interactive component
5. One reference screen or component capturing brand tone
```

---

## Strategy 3 — Tools and Skills

### Impeccable design skill (Claude Code / Cursor / Gemini CLI)

An open-source design skill by Paul Bakaus (original creator of jQuery UI). Built on top of Anthropic's official `frontend-design` skill but goes much deeper — adds 7 design domains and 20 commands.

**Install:**
```bash
npx impeccable install
```

**Key commands:**
```bash
/teach-impeccable   # One-time setup — saves project design context
/audit app          # Find generic design issues
/normalize app      # Align output to your system
/polish app         # Final differentiation pass
```

Supports: Claude Code, Cursor, Gemini CLI, Codex CLI, VS Code Copilot.

---

### Connect Figma MCP for exact token inheritance

Instead of the AI guessing your colors and fonts, pipe in exact tokens from Figma. With Figma MCP in Cursor, paste a Figma link and get the exact font, color, and spacing — eliminating the AI's biggest guess-work opportunity.

This is especially powerful with bidirectional sync: generate UI → paste into Figma plugin → adjust design → paste back → "apply my Figma changes." The AI understands your design system context throughout.

---

### Invest in a real design system

Teams using connected design systems (Figma ↔ code tokens) report dramatically better AI output quality because the AI has real constraints to work within. The more structure you give, the less slop you get. Design systems prove their value not just to humans, but to machines.

---

## Strategy 4 — Post-Generation Workflow

### Generate → Audit → Normalize → Polish

Never ship the first output. Use this 3-step loop after every generation.

**Step 1 — Audit (find what's generic)**
```
"List every design choice in this output that looks like an AI default
or that you've seen repeated in other apps. Be honest."
```

**Step 2 — Normalize (align to your system)**
```
"Replace Inter with Fraunces. Replace the purple accent with #FF4D00.
Remove all box shadows and use 0.5px borders instead."
```

**Step 3 — Polish (differentiate)**
```
"What would make this feel more intentional and surprising?
Suggest 3 changes that are unexpected but coherent with the brand."
```

---

## Quick-Reference Prompt Template

Copy and fill in for every component you build:

```
Component: [what you're building]
Context: [app type, user, purpose in one sentence]

Aesthetic: [name a style — Swiss, Brutalist, Editorial, Terminal, Bauhaus, etc.]
Reference: [name real products/sites that nail the vibe]
Font: [specific Google Font name]
Color: [bg hex, text hex, one accent hex]
Motion: [describe one specific animation, e.g. "staggered fade-up on load, 60ms delay between items"]

Avoid:
- Inter, Roboto, Arial, Space Grotesk, system fonts
- Purple gradients on white
- Glassmorphism or cards inside cards
- shadcn/Tailwind UI default patterns
- Bounce animations, icon above every heading

Think outside the box. Surprise me.
```

---

## Aesthetic Reference Cheat Sheet

| Style | Key characteristics | Good for |
|---|---|---|
| Swiss / International | Grid-strict, Helvetica-era typography, high contrast, sparse | SaaS, productivity tools |
| Brutalist | Raw structure, bold borders, stark contrast, no decoration | Developer tools, portfolios |
| Editorial / Magazine | Asymmetric layouts, large serif display, dramatic scale contrast | Content apps, media |
| Terminal / Code editor | Monospace, dark bg, green/amber accent, scanlines | Dev tools, APIs, dashboards |
| Tactile Digital | Spring physics, squash/bounce feel, physical metaphors | Consumer mobile apps |
| Anti-Polish | Grain, texture, organic imperfections, hand-drawn borders | Creative, lifestyle brands |
| Nature Distilled | Organic curves, shifting light gradients, natural palettes | Wellness, fitness apps |

---

## Key Sources

- [Anthropic — Prompting for frontend aesthetics](https://platform.claude.com/cookbook/coding-prompting-for-frontend-aesthetics)
- [Anthropic — Claude prompting best practices](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices)
- [Impeccable design skill (GitHub / DEV)](https://dev.to/_46ea277e677b888e0cd13/stop-your-ai-coding-tool-from-generating-generic-ui-impeccable-design-skill-4g1l)
- [Managed Code — AI Slop in Design](https://www.managed-code.com/blog-post/ai-slop-in-design)
- [Builder.io — 11 Prompting Tips for UIs That Don't Suck](https://www.builder.io/blog/prompting-tips)
- [Snyk — Top Claude Skills for UI/UX Engineers](https://snyk.io/articles/top-claude-skills-ui-ux-engineers/)
- [UX Collective — Building AI-driven workflows with Claude Code + Figma MCP](https://uxdesign.cc/designing-with-claude-code-and-codex-cli-building-ai-driven-workflows-powered-by-code-connect-ui-f10c136ec11f)
