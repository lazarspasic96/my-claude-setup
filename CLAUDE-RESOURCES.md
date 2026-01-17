# Claude Resources Overview

Complete reference of all Claude commands, agents, skills, and plugins in this repository.

---

## Commands

Invoke with `/command-name`

| Command | File | Description |
|---------|------|-------------|
| `/commit` | [commands/commit.md](commands/commit.md) | Auto-stage and commit with ticket formatting (TEC-XXXXX) |
| `/commit-and-push` | [commands/commit-and-push.md](commands/commit-and-push.md) | Full commit and push workflow with validation |
| `/handoff` | [commands/handoff.md](commands/handoff.md) | Create HANDOFF.md for context continuity |
| `/interview` | [commands/interview.md](commands/interview.md) | Interview to flesh out plans/specs |
| `/code-review` | [commands/code-review.md](commands/code-review.md) | Invoke code-reviewer agent |

---

## Agents

Automatically invoked by Claude when task matches description.

| Agent | File | Description |
|-------|------|-------------|
| code-reviewer | [.claude/agents/code-reviewer.md](.claude/agents/code-reviewer.md) | Review code against plan and standards |
| frontend-developer | [.claude/agents/frontend-developer.md](.claude/agents/frontend-developer.md) | React/Vue/Angular UI development |
| fullstack-developer | [.claude/agents/fullstack-developer.md](.claude/agents/fullstack-developer.md) | End-to-end feature development |
| accessibility-tester | [.claude/agents/accessibility-tester.md](.claude/agents/accessibility-tester.md) | WCAG compliance and a11y testing |
| ui-ux-designer | [.claude/agents/ui-ux-designer.md](.claude/agents/ui-ux-designer.md) | Design systems, wireframes, user flows |
| java-pro | [.claude/agents/java-pro.md](.claude/agents/java-pro.md) | Java/Spring Boot, JVM optimization |
| mobile-developer | [.claude/agents/mobile-developer.md](.claude/agents/mobile-developer.md) | React Native/Flutter apps |
| payment-integration | [.claude/agents/payment-integration.md](.claude/agents/payment-integration.md) | Stripe/PayPal, PCI compliance |

---

## Skills

Standalone capability modules.

| Skill | Location | Description |
|-------|----------|-------------|
| react-native-best-practices | [.claude/skills/react-native-best-practices/](.claude/skills/react-native-best-practices/) | RN performance: FPS, TTI, bundle size, memory |
| vercel-react-best-practices | [.claude/skills/vercel-react-best-practices/](.claude/skills/vercel-react-best-practices/) | React/Next.js patterns from Vercel |

---

## Plugins

Packaged skill collections. Invoke with `/plugin:skill-name`

### expo-app-design

| Skill | Invocation | Description |
|-------|------------|-------------|
| building-ui | `/expo-app-design:building-ui` | UI components, animations, tabs, navigation |
| use-dom | `/expo-app-design:use-dom` | Web code in native webview |
| data-fetching | `/expo-app-design:data-fetching` | API calls, caching, offline support |
| tailwind-setup | `/expo-app-design:tailwind-setup` | Tailwind CSS v4 + NativeWind v5 |
| dev-client | `/expo-app-design:dev-client` | Development builds, TestFlight |
| api-routes | `/expo-app-design:api-routes` | Expo Router API routes |

### expo-deployment

| Skill | Invocation | Description |
|-------|------------|-------------|
| cicd-workflows | `/expo-deployment:cicd-workflows` | EAS workflow YAML files |
| deployment | `/expo-deployment:deployment` | App Store, Play Store, TestFlight |

### upgrading-expo

| Skill | Invocation | Description |
|-------|------------|-------------|
| upgrading-expo | `/upgrading-expo:upgrading-expo` | SDK upgrades, React 19, New Architecture |

---

## Claude Official Plugins

### frontend-design

| Skill | Invocation | Description |
|-------|------------|-------------|
| frontend-design | `/frontend-design:frontend-design` | Distinctive, production-grade UI with bold aesthetics |

### code-review

| Command | Invocation | Description |
|---------|------------|-------------|
| code-review | `/code-review:code-review` | Thorough code review command |

### code-simplifier

| Agent | Description |
|-------|-------------|
| code-simplifier | Simplify and refactor complex code |

### feature-dev

| Resource | Type | Description |
|----------|------|-------------|
| code-architect | Agent | Architecture planning |
| code-explorer | Agent | Codebase exploration |
| code-reviewer | Agent | Code review |
| feature-dev | Agent | Full feature development |

### pr-review-toolkit

| Resource | Type | Description |
|----------|------|-------------|
| code-reviewer | Agent | PR code review |
| code-simplifier | Agent | Simplify PR code |
| comment-analyzer | Agent | Analyze PR comments |
| pr-test-analyzer | Agent | Analyze test coverage |
| silent-failure-hunter | Agent | Find hidden failures |
| type-design-analyzer | Agent | Type system analysis |
| review-pr | Command | Full PR review workflow |

### security-guidance

| Resource | Type | Description |
|----------|------|-------------|
| hooks | Hooks | Security checks on commits |

---

## Directory Structure

```
claude-learning-ai/
├── CLAUDE.md                 # Global instructions
├── CLAUDE-RESOURCES.md       # This file
├── commands/                 # User-invocable commands
│   ├── commit.md
│   ├── commit-and-push.md
│   ├── handoff.md
│   ├── interview.md
│   └── code-review.md
└── .claude/
    ├── agents/               # Auto-invoked specialists
    │   ├── code-reviewer.md
    │   ├── frontend-developer.md
    │   ├── fullstack-developer.md
    │   ├── accessibility-tester.md
    │   ├── ui-ux-designer.md
    │   ├── java-pro.md
    │   ├── mobile-developer.md
    │   └── payment-integration.md
    ├── skills/               # Standalone capabilities
    │   ├── react-native-best-practices/
    │   └── vercel-react-best-practices/
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
| Command | `commands/` | `/name` | Manual |
| Agent | `.claude/agents/` | Automatic | Task matches description |
| Skill | `.claude/skills/` | `/name` | Manual |
| Plugin | `.claude/plugins/` | `/plugin:skill` | Manual |
