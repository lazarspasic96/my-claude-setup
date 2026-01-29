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
| `/sync-skills` | [sync-skills.md](.claude/commands/sync-skills.md) | Sync all skills and commands from global ~/.claude to this project's local .claude directory. Resolves symlinks and overwrites existing files. |

---

## Scripts

Utility scripts for managing Claude resources.

| Script | File | Description |
|--------|------|-------------|
| sync-global-skills | [sync-global-skills.sh](.claude/scripts/sync-global-skills.sh) | Copies all commands and skills from `~/.claude` to local `.claude`, resolving symlinks. Run with `bash .claude/scripts/sync-global-skills.sh`. |

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

### React & Next.js

| Skill | Description |
|-------|-------------|
| [vercel-react-best-practices](.claude/skills/vercel-react-best-practices/) | React/Next.js performance optimization from Vercel Engineering. Components, data fetching, bundle optimization. |
| [vercel-composition-patterns](.claude/skills/vercel-composition-patterns/) | React composition patterns that scale. Compound components, render props, context providers, component architecture. |
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

### Tooling

| Skill | Description |
|-------|-------------|
| [agent-browser](.claude/skills/agent-browser/) | Automates browser interactions for web testing, form filling, screenshots, and data extraction. |
| [find-skills](.claude/skills/find-skills/) | Discover and install agent skills. Use when looking for functionality that might exist as an installable skill. |
| [skill-creator](.claude/skills/skill-creator/) | Guide for creating effective skills that extend Claude's capabilities. |

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
    │   ├── handoff.md
    │   ├── interview.md
    │   ├── code-review.md
    │   ├── ui-skills.md
    │   └── sync-skills.md
    ├── scripts/              # Utility scripts
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
    │   ├── better-auth-best-practices/
    │   ├── building-native-ui/
    │   ├── expo-api-routes/
    │   ├── expo-cicd-workflows/
    │   ├── expo-deployment/
    │   ├── expo-dev-client/
    │   ├── expo-tailwind-setup/
    │   ├── find-skills/
    │   ├── frontend-design/
    │   ├── native-data-fetching/
    │   ├── next-best-practices/
    │   ├── next-upgrade/
    │   ├── pptx/
    │   ├── react-native-best-practices/
    │   ├── remotion-best-practices/
    │   ├── seo-audit/
    │   ├── skill-creator/
    │   ├── supabase-postgres-best-practices/
    │   ├── ui-skills/
    │   ├── ui-ux-pro-max/
    │   ├── upgrading-expo/
    │   ├── use-dom/
    │   ├── vercel-composition-patterns/
    │   ├── vercel-react-best-practices/
    │   └── web-design-guidelines/
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
