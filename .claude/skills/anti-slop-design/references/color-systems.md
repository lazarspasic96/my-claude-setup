# Color Systems

Named palette systems with CSS variables, RN StyleSheet tokens, and dark/light variants. Each palette is opinionated and distinctive — not a safe default.

## Blacklisted Color Patterns (NEVER)

- Purple gradient on white background
- Gray (#F5F5F5, #E5E5E5) as primary background
- Evenly distributed rainbow palettes
- Tailwind default colors used without customization (blue-500 on white, etc.)
- More than 3 accent colors

---

## Palette Archetypes

### Obsidian Fire
High-energy dark theme. For dashboards, dev tools, bold SaaS.

| Role | Hex | Usage |
|---|---|---|
| Background | `#0A0A0A` | Page bg, cards |
| Surface | `#141414` | Elevated surfaces, modals |
| Text | `#F5F0E8` | Primary text |
| Text muted | `#8A8578` | Secondary text, labels |
| Accent | `#FF4D00` | CTAs, active states, links |
| Border | `#1F1F1F` | Dividers, card borders |

```css
:root {
  --bg: #0A0A0A; --surface: #141414; --text: #F5F0E8;
  --text-muted: #8A8578; --accent: #FF4D00; --border: #1F1F1F;
}
```

### Midnight Teal
Developer/tech aesthetic. For APIs, documentation, dev platforms.

| Role | Hex | Usage |
|---|---|---|
| Background | `#0D1117` | Page bg |
| Surface | `#161B22` | Cards, code blocks |
| Text | `#E6EDF3` | Primary text |
| Text muted | `#7D8590` | Secondary text |
| Accent | `#00D1B2` | Links, success, highlights |
| Border | `#21262D` | Dividers |

```css
:root {
  --bg: #0D1117; --surface: #161B22; --text: #E6EDF3;
  --text-muted: #7D8590; --accent: #00D1B2; --border: #21262D;
}
```

### Warm Paper
Editorial warmth. For content apps, blogs, reading experiences.

| Role | Hex | Usage |
|---|---|---|
| Background | `#F5F0E8` | Page bg |
| Surface | `#FFFDF8` | Cards, elevated |
| Text | `#1A1A1A` | Primary text |
| Text muted | `#6B6356` | Secondary text |
| Accent | `#C75000` | Links, CTAs |
| Border | `#E2D9CC` | Dividers |

```css
:root {
  --bg: #F5F0E8; --surface: #FFFDF8; --text: #1A1A1A;
  --text-muted: #6B6356; --accent: #C75000; --border: #E2D9CC;
}
```

### Arctic Steel
Clean professional. For B2B SaaS, productivity tools, enterprise.

| Role | Hex | Usage |
|---|---|---|
| Background | `#F8FAFC` | Page bg |
| Surface | `#FFFFFF` | Cards |
| Text | `#0F172A` | Primary text |
| Text muted | `#64748B` | Secondary text |
| Accent | `#2563EB` | Links, primary actions |
| Border | `#E2E8F0` | Dividers |

```css
:root {
  --bg: #F8FAFC; --surface: #FFFFFF; --text: #0F172A;
  --text-muted: #64748B; --accent: #2563EB; --border: #E2E8F0;
}
```

### Forest Deep
Organic/nature aesthetic. For wellness, fitness, sustainability apps.

| Role | Hex | Usage |
|---|---|---|
| Background | `#0C1810` | Page bg |
| Surface | `#121F18` | Cards |
| Text | `#D1E8D5` | Primary text |
| Text muted | `#6B8F72` | Secondary text |
| Accent | `#4ADE80` | CTAs, highlights |
| Border | `#1A2E22` | Dividers |

```css
:root {
  --bg: #0C1810; --surface: #121F18; --text: #D1E8D5;
  --text-muted: #6B8F72; --accent: #4ADE80; --border: #1A2E22;
}
```

### Noir Gold
Luxury/premium. For fintech, premium products, exclusive platforms.

| Role | Hex | Usage |
|---|---|---|
| Background | `#111111` | Page bg |
| Surface | `#1A1A1A` | Cards |
| Text | `#FAFAFA` | Primary text |
| Text muted | `#888888` | Secondary text |
| Accent | `#D4A853` | Gold highlights, CTAs |
| Border | `#2A2A2A` | Dividers |

```css
:root {
  --bg: #111111; --surface: #1A1A1A; --text: #FAFAFA;
  --text-muted: #888888; --accent: #D4A853; --border: #2A2A2A;
}
```

### Electric Night
Creative/bold. Purple done RIGHT — on near-black, not white.

| Role | Hex | Usage |
|---|---|---|
| Background | `#0A0118` | Page bg |
| Surface | `#140726` | Cards |
| Text | `#E2D9F3` | Primary text |
| Text muted | `#8B7AA8` | Secondary text |
| Accent | `#A855F7` | Highlights, CTAs |
| Border | `#1E0E33` | Dividers |

```css
:root {
  --bg: #0A0118; --surface: #140726; --text: #E2D9F3;
  --text-muted: #8B7AA8; --accent: #A855F7; --border: #1E0E33;
}
```

### Terracotta
Warm earthen. For lifestyle, food, travel, creative brands.

| Role | Hex | Usage |
|---|---|---|
| Background | `#1C1210` | Page bg |
| Surface | `#261A16` | Cards |
| Text | `#F0E6DC` | Primary text |
| Text muted | `#A08B7C` | Secondary text |
| Accent | `#C2724E` | Highlights, CTAs |
| Border | `#342420` | Dividers |

```css
:root {
  --bg: #1C1210; --surface: #261A16; --text: #F0E6DC;
  --text-muted: #A08B7C; --accent: #C2724E; --border: #342420;
}
```

### Polar Ice
Minimal, cool light theme. For design tools, creative apps, portfolios.

| Role | Hex | Usage |
|---|---|---|
| Background | `#F0F4F8` | Page bg |
| Surface | `#FFFFFF` | Cards |
| Text | `#1B2A4A` | Primary text |
| Text muted | `#6B7C93` | Secondary text |
| Accent | `#0EA5E9` | Highlights, CTAs |
| Border | `#D5DDE5` | Dividers |

```css
:root {
  --bg: #F0F4F8; --surface: #FFFFFF; --text: #1B2A4A;
  --text-muted: #6B7C93; --accent: #0EA5E9; --border: #D5DDE5;
}
```

### Ember Dusk
Warm dark with red accent. For music, nightlife, media, entertainment.

| Role | Hex | Usage |
|---|---|---|
| Background | `#120808` | Page bg |
| Surface | `#1C1010` | Cards |
| Text | `#F2E8E8` | Primary text |
| Text muted | `#9C7A7A` | Secondary text |
| Accent | `#EF4444` | Highlights, CTAs |
| Border | `#2A1515` | Dividers |

```css
:root {
  --bg: #120808; --surface: #1C1010; --text: #F2E8E8;
  --text-muted: #9C7A7A; --accent: #EF4444; --border: #2A1515;
}
```

---

## Distribution Rules

- **60/30/10:** 60% background, 30% text/surfaces, 10% accent. Never distribute evenly.
- **Accent restraint:** Accent appears on CTAs, active nav items, key highlights — max 2-3 places per screen.
- **Surface hierarchy:** Background < Surface < Elevated surface. Min 2-step contrast between levels.
- **Text contrast:** Primary text always WCAG AA (4.5:1 min). Muted text at 3:1 min.

## React Native Token Pattern

```tsx
const palette = {
  bg: '#0A0A0A',
  surface: '#141414',
  text: '#F5F0E8',
  textMuted: '#8A8578',
  accent: '#FF4D00',
  border: '#1F1F1F',
} as const;

const styles = StyleSheet.create({
  container: { backgroundColor: palette.bg, flex: 1 },
  card: { backgroundColor: palette.surface, borderColor: palette.border, borderWidth: 1 },
  heading: { color: palette.text, fontSize: 32, fontWeight: '900' },
  label: { color: palette.textMuted, fontSize: 14 },
  button: { backgroundColor: palette.accent, paddingVertical: 12, paddingHorizontal: 24 },
});
```
