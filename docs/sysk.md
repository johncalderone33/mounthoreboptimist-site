# SYSK — Someone You Should Know playbook

Read this when adding a new month's student feature.

Each month, two Mount Horeb High School students are honored.

SYSK month pages are organized by **school year**, not calendar year, because each year's honorees are one senior cohort (e.g., the Class of 2026 spans October 2025 through May 2026). URL pattern: `/someone-you-should-know/class-of-<grad-year>/<month>`.

## Workflow when adding a new month

1. Drop photos in `public/images/sysk/<year>-<MM>/<lastname>-<firstname>.jpeg` (calendar year and month of the meeting, not school year).
2. Copy the prior month's page as `src/pages/someone-you-should-know/class-of-<grad-year>/<month>.astro`.
3. Swap names, two-paragraph bios, and image paths. Each student gets their own alternating-bg section, ending with the italic `<em>{Name}</em> is Someone You Should Know.` line.
4. Update [src/pages/someone-you-should-know/index.astro](../src/pages/someone-you-should-know/index.astro) — change "Most recently" heading + names + link.
5. Update the school-year index page ([src/pages/someone-you-should-know/class-of-&lt;grad-year&gt;/index.astro](../src/pages/someone-you-should-know/class-of-2026/index.astro)) to include the new month.
6. When a new school year starts (October), create a new `class-of-<grad-year>/` folder and index, and add a link to [src/components/sysk/SyskArchiveFooter.astro](../src/components/sysk/SyskArchiveFooter.astro).

## Bio voice

Warm, specific, third-person, includes school activities + outside-school service + future plans. Two paragraphs. ~100–150 words each. Match the existing pages.

For voice rules generally, see [voice.md](voice.md).
