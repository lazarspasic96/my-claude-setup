# Aesthetic Styles Reference

12 named aesthetic directions. When assigning 5 variants, pick styles that are **maximally different** from each other (e.g., don't pick Swiss AND Japanese Minimalism — both are minimal).

## Diversity Matrix

Use this to ensure your 5 picks span the spectrum:

| Axis | Pole A | Pole B |
|---|---|---|
| Density | Sparse / whitespace | Dense / packed |
| Color temp | Warm (amber, terracotta) | Cool (teal, steel, ice) |
| Type voice | Serif / editorial | Mono / technical |
| Structure | Grid-strict | Organic / asymmetric |
| Era feel | Retro / analog | Futuristic / digital |

Pick 5 styles that cover at least 4 of the 5 axes.

---

## 1. Swiss / International

**Traits:** Grid-strict, high contrast, extreme typographic hierarchy, sparse, systematic spacing, no decoration
**Vibe:** Precision, clarity, authority

**Font pairing:** DM Sans 700 / DM Sans 400
**Palette:** Arctic Steel
**Layout:** 12-column grid, strict alignment, generous margins, tabular data
**Spacing:** 8px base, multiples of 8 only
**Radius:** 0px (sharp corners)
**Elevation:** 1px borders, no shadows

**Best for:** SaaS dashboards, productivity tools, enterprise B2B, data-heavy UIs

**Web micro-example:**
```css
.swiss-card { border: 1px solid var(--border); padding: 32px; }
.swiss-heading { font-size: 3rem; font-weight: 700; line-height: 1; letter-spacing: -0.02em; }
```

**RN note:** Use `borderWidth: 1` everywhere. No `borderRadius`. Strict `padding` multiples of 8.

---

## 2. Brutalist

**Traits:** Raw structure, bold borders (2-4px), stark black/white contrast, visible grid, no rounded corners, monospace accents, anti-decorative
**Vibe:** Honest, confrontational, utilitarian

**Font pairing:** Archivo Black 400 / IBM Plex Mono 400
**Palette:** `#000000` bg, `#FFFFFF` text, `#FF0000` accent (or invert)
**Layout:** Visible grid lines, overlapping elements, raw structure exposed
**Spacing:** Tight (4px base), intentionally uneven
**Radius:** 0px
**Elevation:** Thick borders (2-4px solid), no shadows

**Best for:** Developer portfolios, art/design studios, punk/indie brands, statement pages

**Web micro-example:**
```css
.brut-card { border: 3px solid #000; padding: 16px; background: #fff; }
.brut-heading { font-family: 'Archivo Black'; font-size: 4rem; text-transform: uppercase; }
```

**RN note:** `borderWidth: 3`. No `borderRadius`. Heavy `fontWeight: '900'`.

---

## 3. Editorial / Magazine

**Traits:** Asymmetric layouts, large serif display type, dramatic scale contrast (tiny captions vs massive headlines), pull quotes, column breaks, image-text interplay
**Vibe:** Curated, sophisticated, storytelling

**Font pairing:** Fraunces 900 / JetBrains Mono 400
**Palette:** Warm Paper
**Layout:** Asymmetric 2-3 column, pull quotes, oversized first letters, mixed column widths
**Spacing:** Varies — tight body, generous display
**Radius:** 2px
**Elevation:** Subtle 0.5px borders

**Best for:** Content platforms, blogs, media apps, news readers, literary sites

**Web micro-example:**
```css
.editorial-hero { font-family: 'Fraunces'; font-size: 5rem; font-weight: 900; line-height: 0.95; }
.editorial-body { font-family: 'JetBrains Mono'; font-size: 0.875rem; column-count: 2; }
```

**RN note:** Use `fontSize: 48` for display. Two-column layout via `flexDirection: 'row'` with `flex: 1` children.

---

## 4. Terminal / Code Editor

**Traits:** Monospace everything, dark background, green/amber/cyan accent, visible cursor blink, scanline or CRT effects, command-line patterns, `>_` prompts
**Vibe:** Technical, hacker, focused

**Font pairing:** JetBrains Mono 700 / JetBrains Mono 300
**Palette:** Midnight Teal (or custom: `#0D1117` bg, `#00FF88` accent)
**Layout:** Single-column terminal flow, fixed-width, left-aligned
**Spacing:** Line-height heavy (1.7+), monospace grid
**Radius:** 0px
**Elevation:** None — flat dark surfaces

**Best for:** Dev tools, API docs, CLI dashboards, monitoring, hacker aesthetic

**Web micro-example:**
```css
.term-container { background: #0D1117; color: #E6EDF3; font-family: 'JetBrains Mono'; padding: 24px; }
.term-prompt::before { content: '>_ '; color: #00D1B2; }
```

**RN note:** All-mono. Use `fontFamily: 'JetBrainsMono_400Regular'`. Dark bg via container style.

---

## 5. Tactile Digital

**Traits:** Spring physics animations, squash/stretch on press, physical depth (layered shadows), rounded shapes, bouncy micro-interactions, toy-like feel
**Vibe:** Playful, premium consumer, delightful

**Font pairing:** Plus Jakarta Sans 800 / Plus Jakarta Sans 400
**Palette:** Custom warm: `#FFF8F0` bg, `#1A1A1A` text, `#FF6B35` accent
**Layout:** Card-based, generous padding, centered content, floating elements
**Spacing:** 12px base, generous (16-24px gaps)
**Radius:** 16-24px (pill shapes)
**Elevation:** Multi-layer shadows (2-3 levels)

**Best for:** Consumer mobile apps, fitness, social, onboarding flows

**Web micro-example:**
```css
.tactile-card { border-radius: 20px; box-shadow: 0 4px 12px rgba(0,0,0,0.08), 0 1px 3px rgba(0,0,0,0.04); }
.tactile-btn:active { transform: scale(0.96); }
```

**RN note:** Perfect for RN. Use `react-native-reanimated` for spring physics. `borderRadius: 20`.

---

## 6. Anti-Polish

**Traits:** Grain/noise overlays, hand-drawn borders, organic imperfections, film grain, texture-heavy, intentionally rough, collage feel
**Vibe:** Authentic, creative, indie, handmade

**Font pairing:** Syne 700 / Crimson Pro 400
**Palette:** Terracotta
**Layout:** Collage-style, overlapping, rotated elements, broken grid
**Spacing:** Intentionally uneven, organic
**Radius:** Varies — some sharp, some round (inconsistency is the point)
**Elevation:** Textured surfaces, no clean shadows

**Best for:** Creative studios, lifestyle brands, music, art, zines

**Web micro-example:**
```css
.anti-bg { background-image: url('data:image/svg+xml,...'); /* noise texture */ }
.anti-card { transform: rotate(-1deg); border: 2px solid var(--accent); }
```

**RN note:** Use `react-native-svg` for textures. Slight `transform: [{ rotate: '-1deg' }]`.

---

## 7. Nature Distilled

**Traits:** Organic curves, gradient meshes mimicking natural light, natural color palettes (forest, ocean, earth), flowing shapes, gentle animations
**Vibe:** Calm, grounded, wellness

**Font pairing:** Lora 600 / Figtree 400
**Palette:** Forest Deep
**Layout:** Flowing sections, curved dividers, centered, breathing space
**Spacing:** 16px base, very generous (32-48px section gaps)
**Radius:** 12-16px (soft, not pill)
**Elevation:** Soft shadows, translucent overlays

**Best for:** Wellness apps, meditation, fitness, sustainability, health

**Web micro-example:**
```css
.nature-section { border-radius: 24px 24px 0 0; background: linear-gradient(135deg, #0C1810, #1A2E22); }
.nature-heading { font-family: 'Lora'; color: #4ADE80; }
```

**RN note:** Use `expo-linear-gradient` for gradient bgs. Soft `borderRadius: 16`.

---

## 8. Neo-Bauhaus

**Traits:** Primary colors (red, yellow, blue, black), geometric shapes, bold structure, visible grid, functional, circles/squares/triangles as decoration
**Vibe:** Structured, bold, artistic-functional

**Font pairing:** Archivo Black 400 / DM Sans 400
**Palette:** Obsidian Fire (or custom: `#0A0A0A` bg with `#FF0000`, `#FFD600`, `#2563EB` accents)
**Layout:** Geometric blocks, asymmetric grid, bold section dividers, shape-based
**Spacing:** 8px base, grid-aligned
**Radius:** Mix of 0px (squares) and 50% (circles)
**Elevation:** None — flat, color-separated

**Best for:** Design tools, creative platforms, educational, portfolios

**Web micro-example:**
```css
.bauhaus-accent { width: 80px; height: 80px; border-radius: 50%; background: #FF0000; }
.bauhaus-heading { font-family: 'Archivo Black'; font-size: 4rem; }
```

---

## 9. Art Deco

**Traits:** Gold/metallic accents, geometric patterns (chevrons, sunbursts), vertical lines, symmetry, ornamental borders, luxurious feel
**Vibe:** Opulent, heritage, premium

**Font pairing:** EB Garamond 700 / Urbanist 400
**Palette:** Noir Gold
**Layout:** Centered symmetry, vertical emphasis, decorative borders, ornamental dividers
**Spacing:** 8px base, symmetrical padding
**Radius:** 0px (sharp) or ornamental curves
**Elevation:** Gold/metallic borders, subtle inner glow

**Best for:** Finance, luxury brands, premium memberships, high-end e-commerce

**Web micro-example:**
```css
.deco-border { border: 2px solid #D4A853; padding: 32px; position: relative; }
.deco-heading { font-family: 'EB Garamond'; letter-spacing: 0.15em; text-transform: uppercase; }
```

---

## 10. Retro Computing

**Traits:** Pixel/bitmap feel, CRT scanlines, limited color palette (4-8 colors), terminal green/amber, blocky layout, 8-bit aesthetic
**Vibe:** Nostalgic, fun, geeky, indie

**Font pairing:** Space Mono 700 / Space Mono 400
**Palette:** Custom: `#1A1A2E` bg, `#00FF41` primary, `#E94560` accent
**Layout:** Fixed-width blocks, terminal-style rows, pixel grid
**Spacing:** 4px base (pixel grid)
**Radius:** 0px
**Elevation:** None — pixelated borders

**Best for:** Games, personal sites, nostalgia projects, creative dev tools

---

## 11. Japanese Minimalism

**Traits:** Extreme whitespace (50%+ of screen), delicate thin typography, restrained color (near-monochrome + one accent), paper-like texture, intentional emptiness
**Vibe:** Serene, premium, contemplative

**Font pairing:** Cormorant Garamond 300 / DM Sans 300
**Palette:** Noir Gold (with accent used very sparingly — 5% not 10%)
**Layout:** Extreme margins, centered single elements, vast empty space
**Spacing:** 24px base, enormous section gaps (80-120px)
**Radius:** 0px
**Elevation:** None — flat, spatial separation only

**Best for:** Premium product pages, luxury e-commerce, galleries, architecture

---

## 12. Industrial

**Traits:** Exposed structure, monospace, warning/caution colors (amber, red), utility-first, raw materials feel, data-dense, no ornamentation
**Vibe:** Functional, serious, operational

**Font pairing:** IBM Plex Mono 600 / IBM Plex Mono 400
**Palette:** Custom: `#111111` bg, `#F5F5F5` text, `#F59E0B` accent (warning amber)
**Layout:** Dense data grids, status indicators, horizontal dividers, utility panels
**Spacing:** 4px base, compact
**Radius:** 2px
**Elevation:** 1px borders, status-colored left borders on cards

**Best for:** Monitoring dashboards, DevOps, infrastructure tools, ops panels

**Web micro-example:**
```css
.ind-card { border-left: 3px solid #F59E0B; background: #1A1A1A; padding: 12px 16px; }
.ind-label { font-family: 'IBM Plex Mono'; font-size: 11px; text-transform: uppercase; color: #888; }
```
