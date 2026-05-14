# Stack, repo map, deploy

Read this when running commands, debugging the build, navigating the codebase, or shipping changes.

## Stack

- **Astro 6.1.9** (file-based routing, `.astro` components, no client-side framework)
- **Tailwind CSS v4** via `@tailwindcss/vite` — uses the new `@theme` token syntax in [src/styles/global.css](../src/styles/global.css). v3 conventions (config file, `@apply`-heavy patterns) do not apply here.
- **MDX**, **@astrojs/sitemap**, **@astrojs/rss**, **sharp** integrations
- **Strict TypeScript** (`astro/tsconfigs/strict` + `strictNullChecks`)
- **Atkinson font**, locally hosted woff via the `astro:assets` `<Font>` component
- **Node ≥ 22.12**, managed via **fnm** (`.node-version` pins to `22`). If `npm` isn't on PATH, run `fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression` first, or `fnm use` in the project dir.

Scripts:
- `npm run dev` — Astro dev server
- `npm run build` — production build
- `npm run preview` — preview built site

No client-side JS framework. Vanilla `<script>` blocks inside Astro components for interactivity (see Header mobile menu, newsletter form).

## Repo map

```
src/
  pages/
    index.astro                  home (hero, three pillars, who, frolic, newsletter, hello)
    about.astro
    what-we-do.astro
    events.astro
    contact.astro
    the-creed.astro              the ten promises, full text
    someone-you-should-know/
      index.astro                top of SYSK section
      2026/
        index.astro              year index
        january.astro / february.astro / march.astro / april.astro
  components/
    BaseHead.astro               <head>, OG, fonts, canonical, sitemap link
    Header.astro                 nav + mobile menu (vanilla JS)
    HeaderLink.astro             active-state nav link
    Footer.astro                 four columns + roundel + SWIS logo
    sysk/
      SyskRecognitionNote.astro  "$50 + scholarship eligibility" disclaimer
      SyskArchiveFooter.astro    "More students to know" link block
  styles/global.css              Tailwind v4 @theme tokens (the brand)
  consts.ts                      SITE_TITLE = 'Mount Horeb Optimist Club', SITE_DESCRIPTION
  assets/
    fonts/                       atkinson-regular.woff, atkinson-bold.woff
public/
  brand/club-logo/               full logo set (color, black, white, PMS_286, stacked, roundel)
  images/
    sysk/<year>-<MM>/            student photos, named "<lastname>-<firstname>.jpeg"
    events/                      event photos
    what-we-do/                  program photos
    about.webp                   Frolic / Ferris wheel hero (also OG fallback)
    mho-club-roundel.jpg         footer logo
    swis-district-65078.png      SWIS District logo
  favicon.svg / favicon.ico
  robots.txt                     points to sitemap-index.xml
astro.config.mjs                 site: 'https://mounthoreboptimist.com'
.node-version                    '22' — for fnm auto-switch on cd
```

## Deploy flow

1. Local dev: `npm run dev`, verify in browser.
2. `git commit` on `main`.
3. `git push origin main` → Cloudflare Pages auto-builds and deploys.
4. If unsure about a build, run `npm run build` locally first.

Don't push if the dev server has uncaught errors. Cloudflare will fail the build and the live site will keep serving the previous version, but it's wasted CI.
