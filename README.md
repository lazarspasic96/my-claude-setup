# Claude Resources Overview

Complete reference of all Claude commands, agents, skills, and plugins in this repository.

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

Standalone capability modules with best practices and optimization guidelines.

| Skill | Location | Description |
|-------|----------|-------------|
| react-native-best-practices | [SKILL.md](.claude/skills/react-native-best-practices/SKILL.md) | Performance optimization guide for React Native apps covering FPS & re-renders (CRITICAL), bundle size (CRITICAL), TTI optimization (HIGH), native performance (HIGH), memory management (MEDIUM-HIGH), and animations (MEDIUM). Based on Callstack's Ultimate Guide. |
| vercel-react-best-practices | [SKILL.md](.claude/skills/vercel-react-best-practices/SKILL.md) | Comprehensive React/Next.js optimization from Vercel Engineering. 45 rules across 8 categories: eliminating waterfalls (CRITICAL), bundle size (CRITICAL), server-side performance (HIGH), client-side data fetching (MEDIUM-HIGH), re-render optimization (MEDIUM), and more. |
| web-design-guidelines | [SKILL.md](.claude/skills/web-design-guidelines/SKILL.md) | Review UI code for Web Interface Guidelines compliance. Use for "review my UI", "check accessibility", "audit design", "review UX", or "check site against best practices". Fetches latest Vercel guidelines and outputs findings in file:line format. |

---

## Expo Plugins

Packaged skill collections for Expo development. Invoke with `/plugin:skill-name`

### expo-app-design

Skills for building beautiful Expo apps with modern patterns.

| Skill | Invocation | File | Description |
|-------|------------|------|-------------|
| building-ui | `/expo-app-design:building-ui` | [SKILL.md](.claude/plugins/expo-plugins/expo-app-design/skills/building-ui/SKILL.md) | Complete guide for building beautiful apps with Expo Router. Covers fundamentals, styling, components, navigation, animations, patterns, and native tabs. |
| use-dom | `/expo-app-design:use-dom` | [SKILL.md](.claude/plugins/expo-plugins/expo-app-design/skills/use-dom/SKILL.md) | Use Expo DOM components to run web code in a webview on native and as-is on web. Enables incremental migration of web code to native. |
| data-fetching | `/expo-app-design:data-fetching` | [SKILL.md](.claude/plugins/expo-plugins/expo-app-design/skills/data-fetching/SKILL.md) | Comprehensive data fetching guide covering fetch API, axios, React Query, SWR, error handling, caching strategies, and offline support. |
| tailwind-setup | `/expo-app-design:tailwind-setup` | [SKILL.md](.claude/plugins/expo-plugins/expo-app-design/skills/tailwind-setup/SKILL.md) | Set up Tailwind CSS v4 in Expo with react-native-css and NativeWind v5 for universal styling across web and native. |
| dev-client | `/expo-app-design:dev-client` | [SKILL.md](.claude/plugins/expo-plugins/expo-app-design/skills/dev-client/SKILL.md) | Build and distribute Expo development clients locally or via TestFlight for testing native code changes. |
| api-routes | `/expo-app-design:api-routes` | [SKILL.md](.claude/plugins/expo-plugins/expo-app-design/skills/api-routes/SKILL.md) | Guidelines for creating API routes in Expo Router with EAS Hosting for serverless backend functionality. |

### expo-deployment

Skills for deploying Expo apps to production.

| Skill | Invocation | File | Description |
|-------|------------|------|-------------|
| cicd-workflows | `/expo-deployment:cicd-workflows` | [SKILL.md](.claude/plugins/expo-plugins/expo-deployment/skills/cicd-workflows/SKILL.md) | Guide for understanding and writing EAS workflow YAML files. Covers CI/CD pipelines, build automation, and deployment workflows in .eas/workflows/. |
| deployment | `/expo-deployment:deployment` | [SKILL.md](.claude/plugins/expo-plugins/expo-deployment/skills/deployment/SKILL.md) | Deploying Expo apps to iOS App Store, Android Play Store, web hosting, and API routes with EAS. |

### upgrading-expo

Skills for upgrading Expo SDK versions.

| Skill | Invocation | File | Description |
|-------|------------|------|-------------|
| upgrading-expo | `/upgrading-expo:upgrading-expo` | [SKILL.md](.claude/plugins/expo-plugins/upgrading-expo/skills/upgrading-expo/SKILL.md) | Guidelines for upgrading Expo SDK versions and fixing dependency issues. Covers breaking changes, migration steps, and troubleshooting. |

---

## Claude Official Plugins

Official plugins from Claude with specialized capabilities.

### frontend-design

Create distinctive, production-grade frontend interfaces.

| Skill | Invocation | File | Description |
|-------|------------|------|-------------|
| frontend-design | `/frontend-design:frontend-design` | [SKILL.md](.claude/plugins/claude-plugins-official/frontend-design/skills/frontend-design/SKILL.md) | Create distinctive, polished frontend interfaces that avoid generic AI aesthetics. Focuses on bold typography, cohesive color themes, motion/animations, spatial composition, and creative backgrounds. Commit to a clear aesthetic direction and execute with precision. |

### code-review

Code review command plugin.

| Command | Invocation | File | Description |
|---------|------------|------|-------------|
| code-review | `/code-review:code-review` | [code-review.md](.claude/plugins/claude-plugins-official/code-review/commands/code-review.md) | Plugin-based code review command for comprehensive code analysis. |

### code-simplifier

Agent for simplifying complex code.

| Agent | File | Description |
|-------|------|-------------|
| code-simplifier | [code-simplifier.md](.claude/plugins/claude-plugins-official/code-simplifier/agents/code-simplifier.md) | Automatically invoked to simplify overly complex code, reduce cognitive load, and improve maintainability. |

### feature-dev

Feature development plugin with multiple specialized agents.

| Resource | Type | File | Description |
|----------|------|------|-------------|
| code-architect | Agent | [code-architect.md](.claude/plugins/claude-plugins-official/feature-dev/agents/code-architect.md) | Designs software architecture and system structure for new features. |
| code-explorer | Agent | [code-explorer.md](.claude/plugins/claude-plugins-official/feature-dev/agents/code-explorer.md) | Explores and analyzes existing codebase to understand patterns and structure. |
| code-reviewer | Agent | [code-reviewer.md](.claude/plugins/claude-plugins-official/feature-dev/agents/code-reviewer.md) | Reviews code for quality, patterns, and best practices. |
| feature-dev | Agent | [feature-dev.md](.claude/plugins/claude-plugins-official/feature-dev/agents/feature-dev.md) | Main agent for end-to-end feature development coordination. |

### pr-review-toolkit

Comprehensive PR review toolkit with specialized analysis agents.

| Resource | Type | File | Description |
|----------|------|------|-------------|
| code-reviewer | Agent | [code-reviewer.md](.claude/plugins/claude-plugins-official/pr-review-toolkit/agents/code-reviewer.md) | General code review for PRs focusing on quality and patterns. |
| code-simplifier | Agent | [code-simplifier.md](.claude/plugins/claude-plugins-official/pr-review-toolkit/agents/code-simplifier.md) | Identifies overly complex code in PRs and suggests simplifications. |
| comment-analyzer | Agent | [comment-analyzer.md](.claude/plugins/claude-plugins-official/pr-review-toolkit/agents/comment-analyzer.md) | Analyzes PR comments for actionable feedback and discussion points. |
| pr-test-analyzer | Agent | [pr-test-analyzer.md](.claude/plugins/claude-plugins-official/pr-review-toolkit/agents/pr-test-analyzer.md) | Analyzes test coverage and quality in pull requests. |
| silent-failure-hunter | Agent | [silent-failure-hunter.md](.claude/plugins/claude-plugins-official/pr-review-toolkit/agents/silent-failure-hunter.md) | Detects code that may fail silently without proper error handling. |
| type-design-analyzer | Agent | [type-design-analyzer.md](.claude/plugins/claude-plugins-official/pr-review-toolkit/agents/type-design-analyzer.md) | Reviews TypeScript type design for correctness and best practices. |
| review-pr | Command | [review-pr.md](.claude/plugins/claude-plugins-official/pr-review-toolkit/commands/review-pr.md) | Command to initiate comprehensive PR review using all toolkit agents. |

### security-guidance

Security-focused hooks for safe development.

| Resource | Type | Location | Description |
|----------|------|----------|-------------|
| hooks | Hooks | [hooks/](.claude/plugins/claude-plugins-official/security-guidance/hooks/) | Security hooks that execute during development to prevent security vulnerabilities and enforce safe coding practices. |

---

## Directory Structure

```
claude-learning-ai/
├── CLAUDE.md                 # Global instructions
├── CLAUDE-RESOURCES.md       # This file
├── README.md                 # Same as CLAUDE-RESOURCES.md
└── .claude/
    ├── commands/             # User-invocable commands
    │   ├── commit.md
    │   ├── commit-and-push.md
    │   ├── handoff.md
    │   ├── interview.md
    │   └── code-review.md
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
    ├── skills/               # Standalone capabilities
    │   ├── react-native-best-practices/
    │   ├── vercel-react-best-practices/
    │   └── web-design-guidelines/
    └── plugins/              # Packaged skill collections
        ├── expo-plugins/
        │   ├── expo-app-design/
        │   ├── expo-deployment/
        │   └── upgrading-expo/
        └── claude-plugins-official/
            ├── frontend-design/
            ├── code-review/
            ├── code-simplifier/
            ├── feature-dev/
            ├── pr-review-toolkit/
            └── security-guidance/
```

---

## Quick Reference

| Type | Location | Invocation | Trigger |
|------|----------|------------|---------|
| Command | `.claude/commands/` | `/name` | Manual |
| Agent | `.claude/agents/` | Automatic | Task matches description |
| Skill | `.claude/skills/` | `/name` | Manual |
| Plugin | `.claude/plugins/` | `/plugin:skill` | Manual |
