# Global CLAUDE.md

## NEVER EVER DO

These rules are ABSOLUTE:

### NEVER Publish Sensitive Data
- NEVER publish passwords, API keys, tokens to git/npm/docker
- Before ANY commit: verify no secrets included

### NEVER Commit .env Files
- NEVER commit these files to git:
  - .env
  - .env.local
  - .env.development
  - .env.production
  - .env.test
  - .env.staging
- ALWAYS verify all .env files are in .gitignore



## Naming Conventions
- Hooks: usePrefix (useAuth.ts, useFetch.ts)
- Utilities: camelCase (formatDate.ts, parseUrl.ts)


---

## Testing
- Framework: Playwright (when used)
- Location: /tests folder in project root
- Naming: .test.ts or .spec.ts

---

## Code Comments — Rules for Claude

### DO
- Add comments where business logic is complex
- Add comments where code is not self-explanatory
- Keep comments concise and useful

### DO NOT
- Add obvious comments
- Write long paragraph comments
- Comment every line
- Add comments to self-explanatory code



## Code Style — Rules for Claude

### ALWAYS
- Use TypeScript, never plain JavaScript
- Use async/await, never .then() chains
- Use named exports when possible
- Use early returns to reduce nesting
- Use descriptive variable names

### NEVER
- Use any type (find proper type or use unknown)
- Use var (use const or let)
- Leave console.log in production code
- Use magic numbers (define constants)


## Project CLAUDE.md Requirements

When creating new projects, ALWAYS generate a project CLAUDE.md with:
- Project overview (what it does)
- Tech stack
- Build commands
- Test commands
- Architecture overview


## Plan Mode

- Make the plan extremely concise. Sacrifice grammar for the sake of concision.
- At the end of each plan, give me a list of unresolved questions to answer, if any.
- For multi-step plans, divide them into multiple phases with different headings.

- Read codebase/relevant files BEFORE answering questions.
- Check in before major changes for verification.
- Give high-level explanations of changes made.
- Keep changes simple — minimal code impact.
- NEVER speculate about unread code. Read files first.


---

## Framework Skills

### React Projects
- Always apply `vercel-react-best-practices` skill
- Focus on: performance patterns, Server Components, data fetching, bundle optimization
- Max 350 lines per file
- Max one React component per file

### React Native Projects
- Always apply `react-native-best-practices` skill
- Focus on: FPS, TTI, bundle size, memory leaks, re-renders, animations
- Max 350 lines per file
- Max one React component per file


### Expo Projects
- Always apply `expo-app-design` skills:
  - `building-ui` — components, animations, tabs, navigation
  - `data-fetching` — API calls, caching, offline
  - `tailwind-setup` — Tailwind + NativeWind
  - `api-routes` — Expo Router API routes
- For deployment: use `expo-deployment` skills
- For upgrades: use `upgrading-expo` skill

---

## Architecture Documentation

- Maintain a documentation file describing app architecture.
- Update when architecture changes.
