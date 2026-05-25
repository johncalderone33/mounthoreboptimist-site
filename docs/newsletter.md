# Newsletter (*The Mount Horeb Optimist*) playbook

Read this when working on the monthly newsletter or planning the MailerLite email phase.

Monthly publication, sent on the 1st of the month. Issue covers the **prior month** (recap) and the **current month** (events lookahead). E.g., the May 1 issue recaps April and previews May.

## Web-version structure

- Issues at `src/pages/newsletter/<year>/<month>.astro` (e.g., [src/pages/newsletter/2026/may.astro](../src/pages/newsletter/2026/may.astro)).
- Index at [src/pages/newsletter/index.astro](../src/pages/newsletter/index.astro) lists all issues, newest at top.
- Standard sections (in order): masthead → opening (2–3 italic sentences, no heading) → "What happened" (prior month recap, 2 paragraphs) → "Someone you should know" (prior month's SYSK pair, photos + 1-line blurbs + link to full page) → "What's coming up" (current month events) → "Meet an optimist" (first names only, no last names, no titles, **no photos**, 3 Qs + 3 As — monthly feature, every issue) → "How to help" (centered short CTA paragraph) → end ornament.
- Width: `max-w-2xl` — narrower than the rest of the site for publication feel.
- Section dividers: centered gold `· · ·` ornament between sections (no `bg` shifts).
- Masthead: container at `max-w-5xl` (wider than the body), double-rule top/bottom (`border-y-4 border-double border-optimist-blue`), club name in eyebrow above, **publication title** in `font-masthead uppercase whitespace-nowrap` with fluid sizing `text-[clamp(1.25rem,6vw,4rem)]` so the four words always fit one line at any viewport. Font is Antonio Bold via Google Fonts, picked as a close free match to the OI wordmark. Issue label below.
- **Publication name:** *The Mount Horeb Optimist* (title case, four words). Don't use the lowercase "mounthoreboptimist" form — that was the working title before the rename.
- Issue label format: `Vol. N · No. N · <Month> <Year>`.
- Target length: 700–900 words, ~3-minute read.
- Voice: same as rest of site — see [voice.md](voice.md).

## Guest-content voice preservation (Meet an Optimist)

Preserve the contributor's voice. Fix typos and grammar (Mt → Mount Horeb, apostrophes, duplicate words). Convert ALL CAPS to italics. **Don't** soften their exclamation points, restructure their sentences, or add Oxford commas they didn't use. JC: *"I don't want to edit her enthusiasm."*

## Meet an Optimist anonymity rule

The spotlight subject is identified by **first name only** — no last name, no title, no photo. Section is intentionally low-key. Their answers may name other people (Ellen credited Charlie Jefko and Emily Powers) — that's about giving credit, not identifying the spotlight subject.

## Meet an Optimist — question bank and asked log

Questions to draw from each month live in [meet-an-optimist-question-bank.md](meet-an-optimist-question-bank.md). Log each question you use in [meet-an-optimist-asked.md](meet-an-optimist-asked.md) so we don't repeat. Regenerate the browsable HTML view (`meet-an-optimist-asked.html`) with `bash docs/render-asked-table.sh`.

## Adding a new issue

Copy the prior month's file, swap dates/content, add an entry at the top of the [newsletter index](../src/pages/newsletter/index.astro). Header and Footer already link to `/newsletter`.

## MailerLite (email distribution)

The newsletter ships in two places on the same day: the web issue at `/newsletter/<year>/<month>` and the MailerLite email blast. **Web first, always.** Draft and finalize the issue in Astro where edits are easy and version-controlled. On send day (the 1st of the month), push the web version to `main` and copy the finalized prose into MailerLite's drag-and-drop editor for the email blast. The web version is the canonical archive — the email is a redistribution.

The two won't look identical, and don't need to. Email is constrained (table-based layout, narrower column, conservative typography). Match brand colors (`optimist-blue`, `optimist-yellow`, `optimist-beige`) and the feel of the web version, not its exact layout.

Email-only must-haves (don't appear on the web version):

- **Link to the club website** (mounthoreboptimist.com) prominently in the email.
- **Link to the club Facebook page** (facebook.com/mounthoreboptimistclub).
- **Footer subscribe-link line**: something like *"If someone forwarded this to you, click here to join our mailing list."* Link points to the home-page newsletter signup section (or wherever the subscribe form lives at deploy time).
