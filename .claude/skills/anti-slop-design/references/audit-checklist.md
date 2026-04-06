# Audit Checklist

Run this against EACH of the 5 variants after generation. Any failure must be fixed before presenting to user.

## Typography Audit

- [ ] Font is NOT in blacklist (Inter, Roboto, Arial, Open Sans, Space Grotesk, system-ui, Helvetica, Segoe UI, Noto Sans)
- [ ] Weight contrast between display and body is 300+ points (e.g., 900 vs 400). Not 400 vs 600.
- [ ] Size jump between display and body is 3x+ (e.g., 48px vs 16px). Not 24px vs 16px.
- [ ] Display and body fonts are intentionally different families OR same family with dramatic weight contrast
- [ ] Font choice serves the aesthetic direction (Fraunces for editorial, JetBrains Mono for terminal — not a generic fallback)
- [ ] `text-balance` on headings, `text-pretty` on body (web)
- [ ] `tabular-nums` on numeric data

## Color Audit

- [ ] No purple/violet gradient on white or light background
- [ ] All colors use CSS variables (web) or palette constants (RN) — no inline hex values
- [ ] 60/30/10 distribution — bg dominant, text secondary, accent sparse
- [ ] Accent color appears in max 2-3 places per screen (CTAs, active states, key highlights)
- [ ] Background is NOT plain white (`#FFFFFF`), `#F5F5F5`, or `#FAFAFA` as the primary surface
- [ ] Text-to-background contrast ratio meets WCAG AA (4.5:1 for body text)

## Layout Audit

- [ ] Not a predictable symmetric card grid (3-col cards with same padding/radius)
- [ ] At least one layout-breaking element: asymmetry, overlap, bleed, diagonal, or dramatic scale contrast
- [ ] Whitespace is intentional: either generous negative space OR controlled density — not "medium/default"
- [ ] No cards nested inside cards
- [ ] No icon placed above every heading (AI's favorite crutch)
- [ ] Layout reflects the chosen aesthetic style (Swiss = grid-strict, Editorial = asymmetric, etc.)

## Pattern Audit

- [ ] No glassmorphism (frosted glass, `backdrop-filter: blur`, translucent overlays as primary design)
- [ ] No bounce/elastic animations (spring is OK for Tactile style only when explicitly assigned)
- [ ] No generic shadcn/Tailwind UI default component appearances
- [ ] Background has texture or depth — gradient, noise, pattern, or intentional solid (not accidentally plain)
- [ ] Interactive states exist: hover (web) / press (RN) / focus states are distinctive, not just opacity change
- [ ] No `border-radius: 8px` on everything — radius matches the aesthetic (0px for Swiss/Brutalist, 16-24px for Tactile)

## Distinctiveness Audit

- [ ] Could someone identify this design as belonging to a specific brand/product? (not interchangeable with any other app)
- [ ] There is one memorable visual element (a dramatic heading, unique layout, distinctive color moment)
- [ ] The design commits fully to its aesthetic — not hedging between styles

## Cross-Variant Uniqueness Audit (run after all 5 are generated)

- [ ] No two variants share the same display font family
- [ ] No two variants share the same primary color palette
- [ ] No two variants share the same layout pattern (e.g., both can't be 3-col card grids)
- [ ] No two variants share the same background treatment
- [ ] Each variant is immediately visually distinguishable from the others at a glance
- [ ] The 5 variants span at least 4 of the 5 diversity axes (density, color temp, type voice, structure, era feel)

## Quick Fix Guide

| Failure | Fix |
|---|---|
| Blacklisted font | Replace from `references/font-library.md` matching the variant's aesthetic |
| Weak weight contrast | Increase display to 800-900, reduce body to 300-400 |
| Small size jump | Display to 3rem+, body stays at 0.875-1rem |
| Purple on white | Switch to palette from `references/color-systems.md` |
| Inline hex colors | Extract to CSS variables / RN palette constant |
| Symmetric card grid | Break one column wider, offset vertically, or overlay an element |
| Glassmorphism | Replace with solid surface + 1px border or noise texture |
| Bounce animation | Replace with `ease-out` opacity + translateY, 200ms max |
| No hover state | Add `scale(1.02)` + accent border-color, or color shift |
| Variants too similar | Reassign aesthetic style from `references/aesthetic-styles.md` and regenerate |
