# Design — brand tokens, layout patterns, new-page skeleton

Read this when designing or coding any page or component on the Mount Horeb Optimist site.

## Brand tokens (defined in [src/styles/global.css](../src/styles/global.css))

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

For SYSK monthly pages, add `<SyskRecognitionNote />` and `<SyskArchiveFooter />` before `</main>`. See [sysk.md](sysk.md) for the full SYSK playbook.
