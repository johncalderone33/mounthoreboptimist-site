# SYSK — Someone You Should Know playbook

Read this when adding a new month's student feature.

Each month, two Mount Horeb High School students are honored.

## Workflow when adding a new month

1. Drop photos in `public/images/sysk/<year>-<MM>/<lastname>-<firstname>.jpeg`.
2. Copy the prior month's page as `src/pages/someone-you-should-know/<year>/<month>.astro`.
3. Swap names, two-paragraph bios, and image paths. Each student gets their own alternating-bg section, ending with the italic `<em>{Name}</em> is Someone You Should Know.` line.
4. Update [src/pages/someone-you-should-know/index.astro](../src/pages/someone-you-should-know/index.astro) — change "Most recently" heading + names + link.
5. Update the year index page ([src/pages/someone-you-should-know/<year>/index.astro](../src/pages/someone-you-should-know/2026/index.astro)) to include the new month.
6. If a new year starts, update [src/components/sysk/SyskArchiveFooter.astro](../src/components/sysk/SyskArchiveFooter.astro) to add the new year link.

## Bio voice

Warm, specific, third-person, includes school activities + outside-school service + future plans. Two paragraphs. ~100–150 words each. Match the existing pages.

For voice rules generally, see [voice.md](voice.md).
