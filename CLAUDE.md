# CLAUDE.md — Mount Horeb Optimist Club site

This file is for me. Audience of one. Optimized for utility, not readability.

---

## What this project is

A small Astro site for the **Optimist Club of Mount Horeb, Wisconsin** (chartered 1995). Service-club site — tells the club's story, honors students monthly, promotes events, connects with neighbors. Not transactional. No e-commerce. JC is building it himself in VS Code, running it on the local Astro dev server, pushing `main` to GitHub, and deploying via **Cloudflare Pages**.

JC = John Calderone. Member of the club. He owns this site end to end.

---

## Working with JC

Most of this is universal to JC across all his projects. Treat it as standing.

- **67 years old. Builder. Single-tasker, never in a hurry.** Best answer beats faster answer. Never speed up "for him" — it's the opposite of what he wants.
- **Always do the right thing.** When there's a choice between the careful way and the quick way, take the careful way. Don't offer the choice — just take it. *"I'm never in a hurry. I'm young."* (Examples: separate clean commits over one bundle, preview branch before pushing to main, verify a build over assuming it works, investigate a quirk over papering over it.)
- **Voice dictation + ADD.** He hits return before he finishes his thought. **Mid-thought rule:** if a message ends abruptly, on a preposition, on a conjunction, or just feels unfinished — ask "did you stop mid-thought?" before answering. Don't answer incomplete messages.
- **One question at a time.** Never fire a list. Ask one, wait, then the next.
- **Always ask "anything else?"** before closing a thread or moving to a next step.
- **No bullet points by default.** Clean prose. Comprehensive when it needs to be, visually clean. Bullets only when the content genuinely demands it (a checklist he'll use, a comparison).
- **No walls of text.** Break things up. Whitespace counts.
- **Peer tone. Zero sycophancy.** No "great question," no "that's a really interesting point," no flattery, no cushioning criticism in compliments. If something is sharp, say so briefly and move on. If it isn't, say that instead.
- **Hold ground under pushback.** Disagree when you disagree. Make the case. Don't fold because he pushed back — that's the opposite of what he needs. Earn agreement; don't assume it.
- **Reference prior context naturally.** Don't make him re-explain things we've covered.
- **Flag implications he didn't ask about** — anything that breaks the build, breaks SEO, embarrasses the brand, or contradicts the voice — but cleanly at the end, not buried mid-response.
- **Markdown for deliverables by default.** He uses markdown across all his projects, doesn't have Word.
- **When uncertain:** flag the gap, then give your best-guess answer. Don't stall.

He has other Claude projects (Luniter, Philosophy, Lifelong Fitness). If a question lands in another lane (e.g., investment framework, philosophy session, fitness programming), gently redirect. Don't freelance across projects.

---

## The voice — this is the most important thing to get right

The club's voice is **warm, small-town, neighborly**. It is the single most distinctive thing about the site and the easiest thing to wreck. When writing or reviewing copy, hold this line.

**Voice rules:**

- Sentence fragments are deliberate. ("Friends of youth. Neighbors who believe in our home.")
- Concrete details over abstractions. ("Third Monday of every month, 6:45 in the evening at the Mount Horeb Public Library.") **But never invent specifics** — days of the week, times, quotes, named events, attendance numbers. Use only details verified from JC, the existing site, or sources I can cite. If a specific would strengthen a sentence but isn't known, leave it out. Vagueness beats fabrication.
- Em-dashes everywhere — use the literal `&mdash;` in `.astro` source, not the Unicode character.
- Italics sparingly, with `<em>`, for emphasis or names being honored.
- Direct address to the reader. "If this sounds like the kind of place you'd like to stand, come say hello."
- **No corporate marketing tone.** No "amazing," no "world-class," no "passionate," no "stakeholders," no "best-in-class," no buzzwords.
- Volunteers and members are **friends**, **neighbors**, **Optimists** — never "members," never "stakeholders."
- Real place names, by name: Grundahl Park, Mount Horeb Public Library, Miller & Sons Supermarket, Mount Horeb Mail, Sugar Creek Bible Camp.
- **The Frolic** = Mount Horeb Summer Frolic. Always capitalize. It's the year's headline event.
- Full club name on first reference: **Optimist Club of Mount Horeb, Wisconsin**. After that: "the club" or "the Optimists."
- First sentence should welcome the reader. Last sentence should leave them glad they came.
- Read every paragraph out loud in your head. If it sounds like a brochure, rewrite it.

When JC asks for new copy, write in this voice. When JC shows you copy he wrote, hold him to it.

---

## Stack

- **Astro 6.1.9** (file-based routing, `.astro` components, no client-side framework)
- **Tailwind CSS v4** via `@tailwindcss/vite` — uses the new `@theme` token syntax in [src/styles/global.css](src/styles/global.css). v3 conventions (config file, `@apply`-heavy patterns) do not apply here.
- **MDX**, **@astrojs/sitemap**, **@astrojs/rss**, **sharp** integrations
- **Strict TypeScript** (`astro/tsconfigs/strict` + `strictNullChecks`)
- **Atkinson font**, locally hosted woff via the `astro:assets` `<Font>` component
- **Node ≥ 22.12**, managed via **fnm** (`.node-version` pins to `22`). If `npm` isn't on PATH, run `fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression` first, or `fnm use` in the project dir.

Scripts:
- `npm run dev` — Astro dev server
- `npm run build` — production build
- `npm run preview` — preview built site

No client-side JS framework. Don't add React/Vue/Svelte. Vanilla `<script>` blocks inside Astro components for interactivity (see Header mobile menu, newsletter form).

---

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

---

## Brand tokens (defined in [src/styles/global.css](src/styles/global.css))

| Token | Hex | Usage |
|---|---|---|
| `optimist-blue` | #0032a0 | **Primary.** Body copy color. Header/footer bg. CTA text on yellow. |
| `optimist-yellow` | #ffb81d | **Primary CTA bg.** "Say hello" buttons. |
| `optimist-gold` | #87714d | Hover state on yellow CTAs. |
| `optimist-beige` | #f2e5b3 | Warm section background. |
| `optimist-navy` | #002f6d | Hover state on blue. |
| `optimist-slate` | #51534a | Eyebrow text, secondary copy, disclaimers. |
| `optimist-sky` | #98caec | Rare accent. |
| `optimist-stone` | #d7d2cb | Rare accent. |

Use as Tailwind classes: `bg-optimist-blue`, `text-optimist-blue`, `border-optimist-yellow`. **Don't invent new tokens.** If a color isn't in this table, ask before adding it.

---

## Layout patterns — match these on new pages

- **Section width:** `max-w-3xl mx-auto px-6 py-20` for prose. `max-w-5xl` or `max-w-6xl` for grids.
- **Section pattern:** alternating `bg-white` and `bg-optimist-beige` blocks down the page.
- **Eyebrow heading:** `text-sm tracking-[0.3em] uppercase text-optimist-slate` (or `text-base` on top-of-page eyebrows).
- **H1 page title:** `text-4xl md:text-5xl font-bold text-optimist-blue` centered.
- **H2 section heading:** `text-3xl md:text-4xl font-bold text-optimist-blue`, often centered.
- **Body copy:** `text-lg md:text-xl leading-relaxed text-optimist-blue` — **body text is blue, not black.** Distinctive choice. Don't switch to gray/black.
- **CTA button:** `inline-block px-8 py-3 rounded-full bg-optimist-yellow text-optimist-blue font-semibold hover:bg-optimist-gold transition-colors`
- **Image:** `w-full h-auto rounded-sm` (subtle rounding, not pill-rounded).
- **Vertical rhythm:** `mt-6` between adjacent paragraphs, `mt-10` heading→body, `mt-12`–`mt-20` between major blocks.
- **Pull quote / blockquote:** `pl-6 border-l-4 border-optimist-yellow italic text-lg md:text-xl leading-relaxed text-optimist-blue` (see The Creed page).

---

## Page anatomy — new-page skeleton

```astro
---
import BaseHead from '../components/BaseHead.astro';
import Footer from '../components/Footer.astro';
import Header from '../components/Header.astro';
import { SITE_TITLE } from '../consts';
---

<!doctype html>
<html lang="en">
  <head>
    <BaseHead title={`Page Name · ${SITE_TITLE}`} description="One sentence, ~155 chars max." />
  </head>
  <body>
    <Header />
    <main>

<!-- alternating bg sections go here -->

    </main>
    <Footer />
  </body>
</html>
```

For SYSK monthly pages, add `<SyskRecognitionNote />` and `<SyskArchiveFooter />` before `</main>`.

---

## SYSK (Someone You Should Know) playbook

Each month, two Mount Horeb High School students are honored. Workflow when adding a new month:

1. Drop photos in `public/images/sysk/<year>-<MM>/<lastname>-<firstname>.jpeg`.
2. Copy the prior month's page as `src/pages/someone-you-should-know/<year>/<month>.astro`.
3. Swap names, two-paragraph bios, and image paths. Each student gets their own alternating-bg section, ending with the italic `<em>{Name}</em> is Someone You Should Know.` line.
4. Update [src/pages/someone-you-should-know/index.astro](src/pages/someone-you-should-know/index.astro) — change "Most recently" heading + names + link.
5. Update the year index page ([src/pages/someone-you-should-know/<year>/index.astro](src/pages/someone-you-should-know/2026/index.astro)) to include the new month.
6. If a new year starts, update [src/components/sysk/SyskArchiveFooter.astro](src/components/sysk/SyskArchiveFooter.astro) to add the new year link.

Bio voice: warm, specific, third-person, includes school activities + outside-school service + future plans. Two paragraphs. ~100–150 words each. Match the existing pages.

---

## External services & contacts

- **Newsletter:** MailerLite. Account `2284473`, form `185399760391243303`. Form lives inline in [src/pages/index.astro](src/pages/index.astro). If a `/newsletter` page is built, extract the form into a component.
- **Primary email:** `hello@mounthoreboptimist.com`
- **Photo-removal email:** `mounthoreboptimist@gmail.com`
- **Facebook:** facebook.com/mounthoreboptimistclub
- **SWIS District:** swisdistrict.org
- **Optimist International:** optimist.org

---

## Deploy flow

1. Local dev: `npm run dev`, verify in browser.
2. `git commit` on `main`.
3. `git push origin main` → Cloudflare Pages auto-builds and deploys.
4. If unsure about a build, run `npm run build` locally first.

Don't push if the dev server has uncaught errors. Cloudflare will fail the build and the live site will keep serving the previous version, but it's wasted CI.

---

## Newsletter (*The Mount Horeb Optimist*) playbook

Monthly publication, sent on the 1st of the month. Issue covers the **prior month** (recap) and the **current month** (events lookahead). E.g., the May 1 issue recaps April and previews May.

- Issues at `src/pages/newsletter/<year>/<month>.astro` (e.g., [src/pages/newsletter/2026/may.astro](src/pages/newsletter/2026/may.astro)).
- Index at [src/pages/newsletter/index.astro](src/pages/newsletter/index.astro) lists all issues, newest at top.
- Standard sections (in order): masthead → opening (2–3 italic sentences, no heading) → "What happened" (prior month recap, 2 paragraphs) → "Someone you should know" (prior month's SYSK pair, photos + 1-line blurbs + link to full page) → "What's coming up" (current month events) → "Meet an optimist" (first names only, no last names, no titles, **no photos**, 3 Qs + 3 As — monthly feature, every issue) → "How to help" (centered short CTA paragraph) → end ornament.
- Width: `max-w-2xl` — narrower than the rest of the site for publication feel.
- Section dividers: centered gold `· · ·` ornament between sections (no `bg` shifts).
- Masthead: container at `max-w-5xl` (wider than the body), double-rule top/bottom (`border-y-4 border-double border-optimist-blue`), club name in eyebrow above, **publication title** in `font-masthead uppercase whitespace-nowrap` with fluid sizing `text-[clamp(1.25rem,6vw,4rem)]` so the four words always fit one line at any viewport. Font is Antonio Bold via Google Fonts, picked as a close free match to the OI wordmark. Issue label below.
- **Publication name:** *The Mount Horeb Optimist* (title case, four words). Don't use the lowercase "mounthoreboptimist" form — that was the working title before the rename.
- Issue label format: `Vol. N · No. N · <Month> <Year>`.
- Target length: 700–900 words, ~3-minute read.
- Voice: same as rest of site (warm, neighborly, em-dashes, sentence fragments, no marketing buzzwords).
- **Guest-content voice preservation (Meet an Optimist):** preserve the contributor's voice. Fix typos and grammar (Mt → Mount Horeb, apostrophes, duplicate words). Convert ALL CAPS to italics. **Don't** soften their exclamation points, restructure their sentences, or add Oxford commas they didn't use. JC: *"I don't want to edit her enthusiasm."*
- **Meet an Optimist anonymity rule:** the spotlight subject is identified by **first name only** — no last name, no title, no photo. Section is intentionally low-key. Their answers may name other people (Ellen credited Charlie Jefko and Emily Powers) — that's about giving credit, not identifying the spotlight subject.

When adding a new issue: copy the prior month's file, swap dates/content, add an entry at the top of the [newsletter index](src/pages/newsletter/index.astro). Header and Footer already link to `/newsletter`.

---

## Pending: MailerLite phase (next)

When we move from the web version to the email version of the newsletter, these are the must-haves JC flagged. They live on the email only — not the web version.

- **Link to the club website** (mounthoreboptimist.com) prominently in the email.
- **Link to the club Facebook page** (facebook.com/mounthoreboptimistclub).
- **Footer subscribe-link line**: something like *"If someone forwarded this to you, click here to join our mailing list."* Link points to the home-page newsletter signup section (or wherever the subscribe form lives at deploy time).

Workflow plan: build the issue content in MailerLite's drag-and-drop editor, matching the brand colors (`optimist-blue`, `optimist-yellow`, `optimist-beige`) and the feel of the web version. The two won't look identical — and don't need to. Email is more constrained (table-based layout, narrower column, conservative typography). The web version is the canonical archive.

---

## Known cleanups — surface when relevant, don't fix unsolicited

1. **Footer `/join` and `/donate` links** — pages don't exist; awaiting JC's call (build pages, remove links, or repoint to mailto/external).
2. **Confirm domain** — [astro.config.mjs](astro.config.mjs) is set to `https://mounthoreboptimist.com` based on the contact email. If Cloudflare Pages is using a different URL (e.g., `<project>.pages.dev`), update before deploy — affects sitemap and canonicals.
3. **Two unused npm deps** — `@astrojs/rss` and `@astrojs/mdx` are no longer used after the blog scaffold was removed. Harmless to leave; prune from `package.json` if desired.
4. **Header.astro mixes tabs and spaces** — minor cosmetic; only matters if a linter is added.

---

## What I shouldn't do

- **Don't add JS frameworks.** No React, Vue, Svelte. Vanilla Astro + small `<script>` blocks.
- **Don't add new dependencies without asking.** The stack is intentionally small.
- **Don't refactor "for cleanup" without being asked.** The site is mid-build — cleanup is JC's call, not mine.
- **Don't invent new brand colors or tokens.** Use the table above.
- **Don't break the voice.** If a section JC asks for would require a tone shift, surface that tradeoff before writing.
- **Don't write code comments unless explaining a non-obvious WHY.** Astro components are self-explanatory; comments are noise.
- **Don't add blog-style content.** No editorial calendar exists; writing posts is out of scope unless JC starts that work explicitly.
- **Don't push to git, open PRs, or run destructive commands without confirmation.** Deploy is automatic from `main` — pushing affects the live site.
- **Don't freelance into JC's other Claude projects.** Luniter, Philosophy, Lifelong Fitness each have their own homes.
