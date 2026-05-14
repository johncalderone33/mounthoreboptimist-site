# CLAUDE.md — Mount Horeb Optimist Club site

A small Astro site for the **Optimist Club of Mount Horeb, Wisconsin** (chartered 1995). Service-club site — tells the club's story, honors students monthly, promotes events, connects with neighbors. Not transactional. JC owns it end to end. Local Astro dev → push `main` to GitHub → auto-deploys via Cloudflare Pages.

How to work with JC personally lives in `~/.claude/CLAUDE.md` (user-level). This file covers project-specific rules only.

## Detail docs — read on demand

These files hold the heavy content. Pull only what the task needs.

- **Writing or reviewing copy on the site?** Read [docs/voice.md](docs/voice.md). Warm, neighborly voice. Sentence fragments. Em-dashes. No corporate marketing tone. Real place names. Never invent specifics.
- **Designing or coding any page or component?** Read [docs/design.md](docs/design.md). Brand tokens table, layout patterns, new-page skeleton.
- **Running commands, debugging the build, navigating the codebase, or shipping?** Read [docs/stack.md](docs/stack.md). Astro 6 + Tailwind v4 + strict TS. Repo map. Deploy flow.
- **Adding a new month's student feature (Someone You Should Know)?** Read [docs/sysk.md](docs/sysk.md). Photo paths, page-copy workflow, bio voice.
- **Working on the monthly newsletter or the MailerLite email phase?** Read [docs/newsletter.md](docs/newsletter.md). Standard sections, masthead rules, guest-content voice preservation, anonymity rule.

## Hard guardrails — never violate

- **Don't add JS frameworks.** No React, Vue, Svelte. Vanilla Astro + small `<script>` blocks only.
- **Don't add new dependencies without asking.** The stack is intentionally small.
- **Don't invent new brand colors or tokens.** Use the table in [docs/design.md](docs/design.md). If a color isn't there, ask before adding it.
- **Don't push to git, open PRs, or run destructive commands without confirmation.** Deploy is automatic from `main` — pushing affects the live site.
- **Don't refactor "for cleanup" without being asked.** The site is mid-build — cleanup is JC's call.
- **Don't add blog-style content.** No editorial calendar exists.
- **Don't write code comments unless explaining a non-obvious WHY.** Astro components are self-explanatory; comments are noise.
- **Don't freelance into JC's other Claude projects.** Luniter, Philosophy, Lifelong Fitness each have their own homes.

## External services & contacts

- **Newsletter:** MailerLite. Account `2284473`, form `185399760391243303`. Form lives inline in [src/pages/index.astro](src/pages/index.astro). If a `/newsletter` page is built, extract the form into a component.
- **Primary email:** `hello@mounthoreboptimist.com`
- **Photo-removal email:** `mounthoreboptimist@gmail.com`
- **Facebook:** facebook.com/mounthoreboptimistclub
- **SWIS District:** swisdistrict.org
- **Optimist International:** optimist.org

## Known cleanups — surface when relevant, don't fix unsolicited

1. **Footer `/join` and `/donate` links** — pages don't exist; awaiting JC's call (build pages, remove links, or repoint to mailto/external).
2. **Confirm domain** — [astro.config.mjs](astro.config.mjs) is set to `https://mounthoreboptimist.com` based on the contact email. If Cloudflare Pages is using a different URL (e.g., `<project>.pages.dev`), update before deploy — affects sitemap and canonicals.
3. **Two unused npm deps** — `@astrojs/rss` and `@astrojs/mdx` are no longer used after the blog scaffold was removed. Harmless to leave; prune from `package.json` if desired.
4. **Header.astro mixes tabs and spaces** — minor cosmetic; only matters if a linter is added.
