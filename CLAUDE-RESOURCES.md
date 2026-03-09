# Claude Resources Overview

Complete reference of all Claude commands, agents, skills, plugins, and scripts in this repository.

---

## Commands

Invoke with `/command-name`

| Command | File | Description |
|---------|------|-------------|
| `/commit` | [commit.md](.claude/commands/commit.md) | Auto-stage all files and create meaningful commit messages with ticket formatting (TEC-XXXXX). Extracts ticket number from branch name, uses imperative mood, and never includes AI attribution. |
| `/commit-and-push` | [commit-and-push.md](.claude/commands/commit-and-push.md) | Full commit and push workflow with validation. Checks git status, groups files into logical commits, verifies no .env files or secrets are staged, and pushes to remote branch. |
| `/handoff` | [handoff.md](.claude/commands/handoff.md) | Create or update HANDOFF.md for context continuity. Documents goal, current progress, what worked, what didn't work, and next steps for the next agent to continue work. |
| `/interview` | [interview.md](.claude/commands/interview.md) | Interview to flesh out plans/specs. Uses AskUserQuestion tool to ask in-depth questions about technical implementation, UI/UX, concerns, and tradeoffs until the spec is complete. |
| `/code-review` | [code-review.md](.claude/commands/code-review.md) | Invoke code-reviewer agent for thorough review. Checks plan alignment, code quality, architecture decisions, documentation compliance, and categorizes issues as Critical/Important/Suggestions. |
| `/ui-skills` | [ui-skills.md](.claude/commands/ui-skills.md) | Apply opinionated UI constraints for Tailwind CSS, accessible components, animations, typography, layout, and performance. Can review files against these rules. |
| `/explain` | [explain.md](.claude/commands/explain.md) | Explain code or concepts with WHY/WHAT/HOW format, ASCII diagrams, and key file references. Target audience: intermediate developer. |
| `/techdebt` | [techdebt.md](.claude/commands/techdebt.md) | Scan codebase for tech debt by severity (Critical/Important/Low). Finds TODOs, `any` types, console.logs, long files, deep nesting, magic numbers. |
| `/sync-skills` | [sync-skills.md](.claude/commands/sync-skills.md) | Sync all skills and commands from global ~/.claude to this project's local .claude directory. Resolves symlinks and overwrites existing files. |
| `/sync-config` | [sync-config.md](.claude/commands/sync-config.md) | Compare and sync files between global `~/.claude/` and local `.claude/`. Supports directional sync (to-local, to-global) per folder. |

---

## Scripts

Utility scripts for managing Claude resources.

| Script | File | Description |
|--------|------|-------------|
| sync-global-skills | [sync-global-skills.sh](.claude/scripts/sync-global-skills.sh) | Copies all commands and skills from `~/.claude` to local `.claude`, resolving symlinks. Run with `bash .claude/scripts/sync-global-skills.sh`. |
| sync-config | [sync-config.sh](.claude/scripts/sync-config.sh) | Compare and sync CLAUDE.md, agents, and commands between global `~/.claude` and local `.claude`. Supports `compare`, `to-local`, `to-global` actions. Run with `bash .claude/scripts/sync-config.sh [action] [folder]`. |

---

## Agents

Automatically invoked by Claude when task matches description.

| Agent | File | Description |
|-------|------|-------------|
| code-reviewer | [code-reviewer.md](.claude/agents/code-reviewer.md) | Senior code reviewer that validates completed work against original plans. Performs plan alignment analysis, code quality assessment, architecture review, documentation verification, and provides categorized feedback (Critical/Important/Suggestions). |
| frontend-developer | [frontend-developer.md](.claude/agents/frontend-developer.md) | Expert UI engineer for React 18+, Vue 3+, Angular 15+. Builds performant, accessible, maintainable interfaces with TypeScript strict mode, WCAG 2.1 AA compliance, mobile-first responsive design, and 85%+ test coverage. |
| fullstack-developer | [fullstack-developer.md](.claude/agents/fullstack-developer.md) | End-to-end feature owner delivering complete solutions from database to UI. Handles data flow architecture, cross-stack authentication, real-time implementation, and deployment pipelines with focus on seamless integration. |
| accessibility-tester | [accessibility-tester.md](.claude/agents/accessibility-tester.md) | Expert accessibility tester for WCAG 2.1/3.0 compliance. Tests with screen readers (NVDA, JAWS, VoiceOver), keyboard navigation, color contrast, cognitive accessibility, and ARIA implementation. Targets zero critical violations. |
| ui-ux-designer | [ui-ux-designer.md](.claude/agents/ui-ux-designer.md) | UI/UX designer specializing in user-centered design. Creates user journey maps, wireframes, design systems, and accessibility annotations. Focuses on user research, progressive disclosure, and mobile-first responsive thinking. |
| java-pro | [java-pro.md](.claude/agents/java-pro.md) | Java expert for modern Java (streams, lambdas, records), concurrency (CompletableFuture, virtual threads), Spring Boot, JVM performance tuning, reactive programming with Project Reactor, and enterprise patterns. |
| mobile-developer | [mobile-developer.md](.claude/agents/mobile-developer.md) | Cross-platform mobile developer for React Native and Flutter. Handles native module integration, offline-first sync, push notifications, deep linking, app performance optimization, and app store submissions. |
| payment-integration | [payment-integration.md](.claude/agents/payment-integration.md) | Payment integration specialist for Stripe, PayPal, Square APIs. Implements checkout flows, subscription billing, webhook handling, and ensures PCI compliance with proper idempotency and error handling. |
| brainstormer | [brainstormer.md](.claude/agents/brainstormer.md) | Solution brainstormer for architectural decisions and technical planning. Evaluates multiple approaches with pros/cons, challenges assumptions, and provides recommendations following YAGNI, KISS, DRY principles. Does not implement—only advises. |

---

## Skills

Standalone capability modules synced from global `~/.claude/skills/`. Run `/sync-skills` to update.

### Accessibility & Design

| Skill | Description |
|-------|-------------|
| [accessibility-compliance](.claude/skills/accessibility-compliance/) | WCAG 2.2 compliant interfaces with mobile accessibility, inclusive design patterns, and assistive technology support. |
| [frontend-design](.claude/skills/frontend-design/) | Create distinctive, production-grade frontend interfaces with high design quality. Avoids generic AI aesthetics. |
| [ui-skills](.claude/skills/ui-skills/) | Opinionated constraints for building better interfaces with agents. Tailwind, accessible components, animations, typography. |
| [ui-ux-pro-max](.claude/skills/ui-ux-pro-max/) | UI/UX design intelligence. 50 styles, 21 palettes, 50 font pairings, 9 stacks. Glassmorphism, brutalism, neumorphism, bento grid, and more. |
| [web-design-guidelines](.claude/skills/web-design-guidelines/) | Review UI code for Web Interface Guidelines compliance. Use for "review my UI", "check accessibility", "audit design". |
| [implement-design](.claude/skills/implement-design/) | Translates Figma designs into production-ready code with 1:1 visual fidelity. Use when implementing UI from Figma files. |

### React & Next.js

| Skill | Description |
|-------|-------------|
| [vercel-react-best-practices](.claude/skills/vercel-react-best-practices/) | React/Next.js performance optimization from Vercel Engineering. Components, data fetching, bundle optimization. |
| [vercel-composition-patterns](.claude/skills/vercel-composition-patterns/) | React composition patterns that scale. Compound components, render props, context providers, component architecture. |
| [react-useeffect](.claude/skills/react-useeffect/) | React useEffect best practices from official docs. When to use effects, derived state, data fetching, state synchronization. |
| [tanstack-query](.claude/skills/tanstack-query/) | TanStack Query v5 — useMutationState, optimistic updates, throwOnError, network mode, infinite query options. |
| [tanstack-query-best-practices](.claude/skills/tanstack-query-best-practices/) | TanStack Query best practices for data fetching, caching, mutations, and server state management in React. |
| [next-best-practices](.claude/skills/next-best-practices/) | Next.js best practices — file conventions, RSC boundaries, data patterns, async APIs, metadata, error handling, bundling. |
| [next-upgrade](.claude/skills/next-upgrade/) | Upgrade Next.js to the latest version following official migration guides and codemods. |

### React Native & Expo

| Skill | Description |
|-------|-------------|
| [react-native-best-practices](.claude/skills/react-native-best-practices/) | React Native performance optimization — FPS, TTI, bundle size, memory leaks, re-renders, animations. |
| [building-native-ui](.claude/skills/building-native-ui/) | Building beautiful apps with Expo Router. Routing, native tabs, icons, controls, visual effects, animations. |
| [native-data-fetching](.claude/skills/native-data-fetching/) | Network requests, API calls, data fetching. Covers fetch, axios, React Query, SWR, caching, offline support. |
| [expo-api-routes](.claude/skills/expo-api-routes/) | API routes in Expo Router with EAS Hosting. |
| [expo-cicd-workflows](.claude/skills/expo-cicd-workflows/) | EAS workflow YAML files for Expo CI/CD pipelines and deployment automation. |
| [expo-deployment](.claude/skills/expo-deployment/) | Deploy Expo apps to iOS App Store, Android Play Store, web hosting, and API routes. |
| [expo-dev-client](.claude/skills/expo-dev-client/) | Build and distribute Expo development clients locally or via TestFlight. |
| [expo-tailwind-setup](.claude/skills/expo-tailwind-setup/) | Set up Tailwind CSS v4 in Expo with react-native-css and NativeWind v5. |
| [upgrading-expo](.claude/skills/upgrading-expo/) | Upgrade Expo SDK versions and fix dependency issues. |
| [app-icon](.claude/skills/app-icon/) | Generate app icons for React Native Expo apps with iOS 26 support. |
| [use-dom](.claude/skills/use-dom/) | Expo DOM components — run web code in a webview on native, as-is on web. Incremental migration. |

### AI & Backend

| Skill | Description |
|-------|-------------|
| [ai-sdk](.claude/skills/ai-sdk/) | Vercel AI SDK — generateText, streamText, agents, chatbots, RAG, tool calling, structured output, useChat. |
| [better-auth-best-practices](.claude/skills/better-auth-best-practices/) | Integrating Better Auth — comprehensive TypeScript authentication framework. |
| [supabase-postgres-best-practices](.claude/skills/supabase-postgres-best-practices/) | Postgres performance optimization and best practices from Supabase. Queries, schema design, database config. |

### SEO & Media

| Skill | Description |
|-------|-------------|
| [seo-audit](.claude/skills/seo-audit/) | Audit, review, or diagnose SEO issues. Technical SEO, on-page SEO, meta tags review. |
| [remotion-best-practices](.claude/skills/remotion-best-practices/) | Best practices for Remotion — video creation in React. |
| [pptx](.claude/skills/pptx/) | Presentation creation, editing, and analysis for .pptx files. |
| [nano-banana-2](.claude/skills/nano-banana-2/) | Generate images with Google Gemini 3.1 Flash via inference.sh CLI. Text-to-image, image editing, multi-image compositing. |

### Architecture & Planning

| Skill | Description |
|-------|-------------|
| [design-an-interface](.claude/skills/design-an-interface/) | Generate multiple radically different interface designs using parallel sub-agents. Based on "Design It Twice" philosophy. |
| [write-a-prd](.claude/skills/write-a-prd/) | Create a PRD through user interviews, codebase exploration, and iterative refinement. |
| [prd-to-plan](.claude/skills/prd-to-plan/) | Turn a PRD into a multi-phase implementation plan using tracer-bullet vertical slices. Saves to `./plans/`. |
| [prd-to-issues](.claude/skills/prd-to-issues/) | Break a PRD into independently-grabbable GitHub issues using vertical slices. |
| [request-refactor-plan](.claude/skills/request-refactor-plan/) | Create a refactor plan through problem analysis, codebase exploration, and solution design. |
| [grill-me](.claude/skills/grill-me/) | Relentless interview about every aspect of a plan until shared understanding is reached. |

### Development Workflow

| Skill | Description |
|-------|-------------|
| [tdd](.claude/skills/tdd/) | Test-driven development with red-green-refactor loop. Integration tests via public interfaces, not implementation details. |
| [git-guardrails-claude-code](.claude/skills/git-guardrails-claude-code/) | Set up Claude Code hooks to block dangerous git commands (push, reset --hard, clean, branch -D). |
| [setup-pre-commit](.claude/skills/setup-pre-commit/) | Set up Husky pre-commit hooks with lint-staged (Prettier), type checking, and tests. |
| [migrate-to-shoehorn](.claude/skills/migrate-to-shoehorn/) | Migrate test files from `as` type assertions to @total-typescript/shoehorn for type-safe partial test data. |
| [edit-article](.claude/skills/edit-article/) | Edit articles with structured section analysis, dependency ordering, and iterative refinement. |
| [obsidian-vault](.claude/skills/obsidian-vault/) | Manage Obsidian vault with naming conventions and flat structure for AI research notes. |
| [scaffold-exercises](.claude/skills/scaffold-exercises/) | Create exercise directory structures that pass `pnpm ai-hero-cli internal lint`. |

### Tooling & Code Quality

| Skill | Description |
|-------|-------------|
| [agent-browser](.claude/skills/agent-browser/) | Automates browser interactions for web testing, form filling, screenshots, and data extraction. |
| [eslint-prettier-config](.claude/skills/eslint-prettier-config/) | ESLint and Prettier config for consistent code quality with TypeScript, React, and modern best practices. |
| [find-skills](.claude/skills/find-skills/) | Discover and install agent skills. Use when looking for functionality that might exist as an installable skill. |
| [skill-creator](.claude/skills/skill-creator/) | Guide for creating effective skills that extend Claude's capabilities. |
| [write-a-skill](.claude/skills/write-a-skill/) | Create new agent skills with proper structure, progressive disclosure, and bundled resources. |

---

## Plugins (Legacy)

Packaged skill collections. Superseded by the skills directory above but still present for reference.

### expo-plugins

| Plugin | Skills |
|--------|--------|
| expo-app-design | building-ui, use-dom, data-fetching, tailwind-setup, dev-client, api-routes |
| expo-deployment | cicd-workflows, deployment |
| upgrading-expo | upgrading-expo |

### claude-plugins-official

| Plugin | Resources |
|--------|-----------|
| frontend-design | frontend-design skill |
| code-review | code-review command |
| code-simplifier | code-simplifier agent |
| feature-dev | code-architect, code-explorer, code-reviewer agents + feature-dev command |
| pr-review-toolkit | code-reviewer, code-simplifier, comment-analyzer, pr-test-analyzer, silent-failure-hunter, type-design-analyzer agents + review-pr command |
| security-guidance | Security hooks |

---

## Directory Structure

```
claude-learning-ai/
├── CLAUDE.md                 # Global instructions
├── CLAUDE-RESOURCES.md       # This file
├── README.md                 # Same as CLAUDE-RESOURCES.md
└── .claude/
    ├── commands/             # User-invocable commands (/name)
    │   ├── commit.md
    │   ├── commit-and-push.md
    │   ├── code-review.md
    │   ├── explain.md
    │   ├── handoff.md
    │   ├── interview.md
    │   ├── sync-config.md
    │   ├── sync-skills.md
    │   ├── techdebt.md
    │   └── ui-skills.md
    ├── scripts/              # Utility scripts
    │   ├── sync-config.sh
    │   └── sync-global-skills.sh
    ├── agents/               # Auto-invoked specialists
    │   ├── code-reviewer.md
    │   ├── frontend-developer.md
    │   ├── fullstack-developer.md
    │   ├── accessibility-tester.md
    │   ├── ui-ux-designer.md
    │   ├── java-pro.md
    │   ├── mobile-developer.md
    │   ├── payment-integration.md
    │   └── brainstormer.md
    ├── skills/               # Synced from global ~/.claude/skills
    │   ├── accessibility-compliance/
    │   ├── agent-browser/
    │   ├── ai-sdk/
    │   ├── app-icon/
    │   ├── better-auth-best-practices/
    │   ├── building-native-ui/
    │   ├── design-an-interface/
    │   ├── edit-article/
    │   ├── eslint-prettier-config/
    │   ├── expo-api-routes/
    │   ├── expo-cicd-workflows/
    │   ├── expo-deployment/
    │   ├── expo-dev-client/
    │   ├── expo-tailwind-setup/
    │   ├── find-skills/
    │   ├── frontend-design/
    │   ├── git-guardrails-claude-code/
    │   ├── grill-me/
    │   ├── implement-design/
    │   ├── migrate-to-shoehorn/
    │   ├── nano-banana-2/
    │   ├── native-data-fetching/
    │   ├── next-best-practices/
    │   ├── next-upgrade/
    │   ├── obsidian-vault/
    │   ├── pptx/
    │   ├── prd-to-issues/
    │   ├── prd-to-plan/
    │   ├── react-native-best-practices/
    │   ├── react-useeffect/
    │   ├── remotion-best-practices/
    │   ├── request-refactor-plan/
    │   ├── scaffold-exercises/
    │   ├── seo-audit/
    │   ├── setup-pre-commit/
    │   ├── skill-creator/
    │   ├── supabase-postgres-best-practices/
    │   ├── tanstack-query/
    │   ├── tanstack-query-best-practices/
    │   ├── tdd/
    │   ├── ui-skills/
    │   ├── ui-ux-pro-max/
    │   ├── upgrading-expo/
    │   ├── use-dom/
    │   ├── vercel-composition-patterns/
    │   ├── vercel-react-best-practices/
    │   ├── web-design-guidelines/
    │   ├── write-a-prd/
    │   └── write-a-skill/
    └── plugins/              # Legacy packaged collections
        ├── expo-plugins/
        └── claude-plugins-official/
```

---

## Quick Reference

| Type | Location | Invocation | Trigger |
|------|----------|------------|---------|
| Command | `.claude/commands/` | `/name` | Manual |
| Agent | `.claude/agents/` | Automatic | Task matches description |
| Skill | `.claude/skills/` | `/name` | Manual / Auto |
| Script | `.claude/scripts/` | `bash .claude/scripts/name.sh` | Manual |
| Plugin | `.claude/plugins/` | `/plugin:skill` | Manual (legacy) |
