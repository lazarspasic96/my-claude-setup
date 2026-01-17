# Claude Resources Overview

Complete reference of all Claude commands, agents, skills, and plugins in this repository.

---

## Commands

Invoke with `/command-name`

| Command | File | Description |
|---------|------|-------------|
| `/commit` | [commit.md](.claude/commands/commit.md) | Auto-stage and commit with ticket formatting (TEC-XXXXX) |
| `/commit-and-push` | [commit-and-push.md](.claude/commands/commit-and-push.md) | Full commit and push workflow with validation |
| `/handoff` | [handoff.md](.claude/commands/handoff.md) | Create HANDOFF.md for context continuity |
| `/interview` | [interview.md](.claude/commands/interview.md) | Interview to flesh out plans/specs |
| `/code-review` | [code-review.md](.claude/commands/code-review.md) | Invoke code-reviewer agent |

---

## Agents

Automatically invoked by Claude when task matches description.

| Agent | File | Description |
|-------|------|-------------|
| code-reviewer | [code-reviewer.md](.claude/agents/code-reviewer.md) | Review code against plan and standards |
| frontend-developer | [frontend-developer.md](.claude/agents/frontend-developer.md) | React/Vue/Angular UI development |
| fullstack-developer | [fullstack-developer.md](.claude/agents/fullstack-developer.md) | End-to-end feature development |
| accessibility-tester | [accessibility-tester.md](.claude/agents/accessibility-tester.md) | WCAG compliance and a11y testing |
| ui-ux-designer | [ui-ux-designer.md](.claude/agents/ui-ux-designer.md) | Design systems, wireframes, user flows |
| java-pro | [java-pro.md](.claude/agents/java-pro.md) | Java/Spring Boot, JVM optimization |
| mobile-developer | [mobile-developer.md](.claude/agents/mobile-developer.md) | React Native/Flutter apps |
| payment-integration | [payment-integration.md](.claude/agents/payment-integration.md) | Stripe/PayPal, PCI compliance |

---

## Skills

Standalone capability modules.

| Skill | Location | Description |
|-------|----------|-------------|
| react-native-best-practices | [SKILL.md](.claude/skills/react-native-best-practices/SKILL.md) | RN performance: FPS, TTI, bundle size, memory |
| vercel-react-best-practices | [SKILL.md](.claude/skills/vercel-react-best-practices/SKILL.md) | React/Next.js patterns from Vercel |

---

## Expo Plugins

Packaged skill collections. Invoke with `/plugin:skill-name`

### expo-app-design

| Skill | Invocation | File |
|-------|------------|------|
| building-ui | `/expo-app-design:building-ui` | [SKILL.md](.claude/plugins/expo-plugins/expo-app-design/skills/building-ui/SKILL.md) |
| use-dom | `/expo-app-design:use-dom` | [SKILL.md](.claude/plugins/expo-plugins/expo-app-design/skills/use-dom/SKILL.md) |
| data-fetching | `/expo-app-design:data-fetching` | [SKILL.md](.claude/plugins/expo-plugins/expo-app-design/skills/data-fetching/SKILL.md) |
| tailwind-setup | `/expo-app-design:tailwind-setup` | [SKILL.md](.claude/plugins/expo-plugins/expo-app-design/skills/tailwind-setup/SKILL.md) |
| dev-client | `/expo-app-design:dev-client` | [SKILL.md](.claude/plugins/expo-plugins/expo-app-design/skills/dev-client/SKILL.md) |
| api-routes | `/expo-app-design:api-routes` | [SKILL.md](.claude/plugins/expo-plugins/expo-app-design/skills/api-routes/SKILL.md) |

### expo-deployment

| Skill | Invocation | File |
|-------|------------|------|
| cicd-workflows | `/expo-deployment:cicd-workflows` | [SKILL.md](.claude/plugins/expo-plugins/expo-deployment/skills/cicd-workflows/SKILL.md) |
| deployment | `/expo-deployment:deployment` | [SKILL.md](.claude/plugins/expo-plugins/expo-deployment/skills/deployment/SKILL.md) |

### upgrading-expo

| Skill | Invocation | File |
|-------|------------|------|
| upgrading-expo | `/upgrading-expo:upgrading-expo` | [SKILL.md](.claude/plugins/expo-plugins/upgrading-expo/skills/upgrading-expo/SKILL.md) |

---

## Claude Official Plugins

### frontend-design

| Skill | Invocation | File |
|-------|------------|------|
| frontend-design | `/frontend-design:frontend-design` | [SKILL.md](.claude/plugins/claude-plugins-official/frontend-design/skills/frontend-design/SKILL.md) |

### code-review

| Command | Invocation | File |
|---------|------------|------|
| code-review | `/code-review:code-review` | [code-review.md](.claude/plugins/claude-plugins-official/code-review/commands/code-review.md) |

### code-simplifier

| Agent | File |
|-------|------|
| code-simplifier | [code-simplifier.md](.claude/plugins/claude-plugins-official/code-simplifier/agents/code-simplifier.md) |

### feature-dev

| Resource | Type | File |
|----------|------|------|
| code-architect | Agent | [code-architect.md](.claude/plugins/claude-plugins-official/feature-dev/agents/code-architect.md) |
| code-explorer | Agent | [code-explorer.md](.claude/plugins/claude-plugins-official/feature-dev/agents/code-explorer.md) |
| code-reviewer | Agent | [code-reviewer.md](.claude/plugins/claude-plugins-official/feature-dev/agents/code-reviewer.md) |
| feature-dev | Agent | [feature-dev.md](.claude/plugins/claude-plugins-official/feature-dev/agents/feature-dev.md) |

### pr-review-toolkit

| Resource | Type | File |
|----------|------|------|
| code-reviewer | Agent | [code-reviewer.md](.claude/plugins/claude-plugins-official/pr-review-toolkit/agents/code-reviewer.md) |
| code-simplifier | Agent | [code-simplifier.md](.claude/plugins/claude-plugins-official/pr-review-toolkit/agents/code-simplifier.md) |
| comment-analyzer | Agent | [comment-analyzer.md](.claude/plugins/claude-plugins-official/pr-review-toolkit/agents/comment-analyzer.md) |
| pr-test-analyzer | Agent | [pr-test-analyzer.md](.claude/plugins/claude-plugins-official/pr-review-toolkit/agents/pr-test-analyzer.md) |
| silent-failure-hunter | Agent | [silent-failure-hunter.md](.claude/plugins/claude-plugins-official/pr-review-toolkit/agents/silent-failure-hunter.md) |
| type-design-analyzer | Agent | [type-design-analyzer.md](.claude/plugins/claude-plugins-official/pr-review-toolkit/agents/type-design-analyzer.md) |
| review-pr | Command | [review-pr.md](.claude/plugins/claude-plugins-official/pr-review-toolkit/commands/review-pr.md) |

### security-guidance

| Resource | Type | Location |
|----------|------|----------|
| hooks | Hooks | [hooks/](.claude/plugins/claude-plugins-official/security-guidance/hooks/) |

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
| Command | `.claude/commands/` | `/name` | Manual |
| Agent | `.claude/agents/` | Automatic | Task matches description |
| Skill | `.claude/skills/` | `/name` | Manual |
| Plugin | `.claude/plugins/` | `/plugin:skill` | Manual |
