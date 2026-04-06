# Font Library

Curated fonts that are distinctive, beautiful, and NOT AI-slop defaults. Organized by aesthetic category.

## Blacklisted Fonts (NEVER use)

Inter, Roboto, Arial, Open Sans, Space Grotesk, system-ui, Helvetica, Segoe UI, Noto Sans

---

## Code / Technical

| Font | Weights | Pair With | Vibe | Google Fonts | RN (expo-google-fonts) |
|---|---|---|---|---|---|
| JetBrains Mono | 100-800 | DM Sans, Manrope | Developer, precise | Yes | Yes |
| Fira Code | 300-700 | Figtree, Plus Jakarta Sans | Hacker, ligatures | Yes | Yes |
| IBM Plex Mono | 100-700 | IBM Plex Sans, Urbanist | Corporate tech | Yes | Yes |
| Source Code Pro | 200-900 | Source Sans 3, Outfit | Neutral mono | Yes | Yes |
| Geist Mono | 100-900 | Geist Sans | Vercel-inspired | Custom load | Custom load |

## Editorial / Magazine

| Font | Weights | Pair With | Vibe | Google Fonts | RN |
|---|---|---|---|---|---|
| Fraunces | 100-900 | IBM Plex Mono, DM Sans | Warm, expressive serif | Yes | Yes |
| Playfair Display | 400-900 | Lato, Source Sans 3 | Classic editorial | Yes | Yes |
| Crimson Pro | 200-900 | Manrope, Outfit | Readable long-form serif | Yes | Yes |
| Newsreader | 200-800 | Inter (exception: body only), Figtree | News/magazine | Yes | Yes |
| Lora | 400-700 | Merriweather Sans, Urbanist | Book-quality serif | Yes | Yes |
| Cormorant Garamond | 300-700 | Fira Code, JetBrains Mono | Elegant, delicate | Yes | Yes |

## Startup / Modern

| Font | Weights | Pair With | Vibe | Google Fonts | RN |
|---|---|---|---|---|---|
| Clash Display | 200-700 | General Sans, Satoshi | Bold, geometric | Custom (Fontshare) | Custom load |
| Satoshi | 300-900 | Clash Display, Cabinet Grotesk | Clean, confident | Custom (Fontshare) | Custom load |
| Cabinet Grotesk | 100-900 | Satoshi, General Sans | Friendly geometric | Custom (Fontshare) | Custom load |
| General Sans | 200-700 | Clash Display, Satoshi | Versatile modern | Custom (Fontshare) | Custom load |
| Geist Sans | 100-900 | Geist Mono | Vercel aesthetic | Custom load | Custom load |

## Distinctive / Personality

| Font | Weights | Pair With | Vibe | Google Fonts | RN |
|---|---|---|---|---|---|
| Bricolage Grotesque | 200-800 | IBM Plex Mono, Crimson Pro | Quirky, characterful | Yes | Yes |
| Plus Jakarta Sans | 200-800 | Fraunces, Lora | Friendly, rounded | Yes | Yes |
| Syne | 400-800 | Fira Code, DM Mono | Futuristic, geometric | Yes | Yes |
| Outfit | 100-900 | JetBrains Mono, Crimson Pro | Clean with character | Yes | Yes |
| Space Mono | 400-700 | Syne, Archivo Black | Retro-tech | Yes | Yes |

## Geometric / Structural

| Font | Weights | Pair With | Vibe | Google Fonts | RN |
|---|---|---|---|---|---|
| DM Sans | 100-1000 | DM Mono, Fraunces | Clean geometric | Yes | Yes |
| Manrope | 200-800 | Crimson Pro, Playfair Display | Semi-geometric, warm | Yes | Yes |
| Figtree | 300-900 | Fira Code, Newsreader | Open, approachable | Yes | Yes |
| Urbanist | 100-900 | Lora, Source Code Pro | Sharp, modern | Yes | Yes |
| Nunito Sans | 200-1000 | JetBrains Mono, Lora | Rounded geometric | Yes | Yes |

## Luxury / Refined

| Font | Weights | Pair With | Vibe | Google Fonts | RN |
|---|---|---|---|---|---|
| Cormorant Garamond | 300-700 | Fira Code, JetBrains Mono | High fashion serif | Yes | Yes |
| Libre Baskerville | 400-700 | DM Sans, Urbanist | Traditional elegance | Yes | Yes |
| Spectral | 200-800 | IBM Plex Mono, Manrope | Literary, refined | Yes | Yes |
| EB Garamond | 400-800 | Outfit, Figtree | Classical grace | Yes | Yes |

## Playful / Creative

| Font | Weights | Pair With | Vibe | Google Fonts | RN |
|---|---|---|---|---|---|
| Archivo Black | 400 | Archivo, Crimson Pro | Ultra bold display | Yes | Yes |
| Unbounded | 200-900 | DM Sans, Fira Code | Rounded, futuristic | Yes | Yes |
| Rubik | 300-900 | Rubik Mono One, Lora | Friendly, chunky | Yes | Yes |
| Lexend | 100-900 | JetBrains Mono, Spectral | Optimized readability | Yes | Yes |

---

## Pairing Rules

### Principles
- **Weight contrast:** 100-200 vs 800-900. Never 400 vs 600 — that's invisible.
- **Size jumps:** 3x minimum between display and body. 48px display / 16px body, not 24px / 16px.
- **Role clarity:** Display font = personality. Body font = readability. Never use display for body.
- **Max 2 families:** One display + one body. A third (mono for code) is acceptable if needed.

### Proven Pairings by Aesthetic

| Aesthetic | Display | Body | Why It Works |
|---|---|---|---|
| Editorial tech | Fraunces 900 | JetBrains Mono 400 | Warm serif + cold mono = tension |
| Clean modern | DM Sans 700 | DM Sans 400 | Same family, weight does the work |
| Luxury contrast | Cormorant Garamond 300 | Manrope 500 | Delicate serif + sturdy sans |
| Bold startup | Clash Display 700 | Satoshi 400 | Geometric harmony, different voices |
| Brutalist | Archivo Black 400 | IBM Plex Mono 400 | Heavy + utilitarian |
| Terminal | JetBrains Mono 700 | JetBrains Mono 300 | All-mono, weight-only hierarchy |
| Japanese minimal | Cormorant Garamond 300 | DM Sans 300 | Light + light = deliberate restraint |
| Retro | Space Mono 700 | Space Mono 400 | Monospace character, weight contrast |
| Nature/organic | Lora 600 | Figtree 400 | Organic serif + friendly sans |

### React Native Font Loading

For Expo projects, use `expo-google-fonts`:
```tsx
import { useFonts, Fraunces_900Black } from '@expo-google-fonts/fraunces';
import { JetBrainsMono_400Regular } from '@expo-google-fonts/jetbrains-mono';
```

For Fontshare fonts (Clash Display, Satoshi, etc.): download .ttf files, place in `assets/fonts/`, load via `expo-font`:
```tsx
import { useFonts } from 'expo-font';
const [loaded] = useFonts({
  'ClashDisplay-Bold': require('./assets/fonts/ClashDisplay-Bold.ttf'),
});
```
