# Daily News Brief publishing style

Use this format for future Daily News Brief posts on the Hugo blog. It is editorial guidance for human and AI contributors; it does not automatically publish scheduled ChatGPT digests.

## Structure

- Write in clear US English.
- Use 4–6 verified, material stories; avoid repeating earlier updates without a meaningful new development.
- Give each article one linked, original headline. Do not repeat that title in an italic subtitle, a translated subtitle, or a quoted opening paragraph.
- Immediately below the headline, show the publisher, author (if known), and original publication date.
- Put one factual, immediately understandable lead sentence **before** the photograph.
- Use one short paragraph of extra context after the image. Give a concrete action only when supported by the source.
- Bold only the most important date, amount, exploit status, CVE, or operational action.
- Keep the introduction to one sentence covering up to three important developments. Let Hugo show reading time automatically.
- Use authentic, properly licensed and attributed archive/editorial photographs only when relevant; do not invent images or pass off an archive photo as an image of the reported event.
- Include image alt text, explicit credits, source link, and license. The first story may use the larger image; secondary images are smaller.
- Set `toc: false` in the post front matter to remove the article table-of-contents sidebar.

## Reusable CSS classes

The theme automatically loads `assets/scss/custom.scss`. The custom reading layout only applies when the article contains `<p class="news-brief-kicker">...</p>` as a **direct child** of the article content.

Use this structure (replace placeholders and links):

```markdown
---
title: "Daily News Brief — Month DD, YYYY"
date: YYYY-MM-DDTHH:MM:SS+02:00
draft: false
toc: false
slug: "daily-news-brief-YYYY-MM-DD"
categories: ["Daily News Brief"]
---

<p class="news-brief-kicker">6 stories · A quick briefing</p>

<p class="news-brief-intro">One sentence connecting the day's top developments.</p>

<p class="news-brief-topic">Security · Windows</p>

## [Original publisher headline](https://example.com/original-story)

<p class="news-brief-byline">Publisher · Author · Month DD, YYYY</p>

<p class="news-brief-lead">One factual sentence, with <strong>one important detail</strong>.</p>

<figure class="news-brief-photo news-brief-photo--featured">
  <img src="https://example.org/licensed-photo.jpg" alt="Accurate description" width="960" height="720" loading="lazy" decoding="async">
  <figcaption>Archive photo: Creator / <a href="https://example.org/photo-license">Image source</a> (license).</figcaption>
</figure>

Additional concise factual context.

<p class="news-brief-action"><strong>For defenders:</strong> A source-supported action, if relevant.</p>
```

For later photos, use `class="news-brief-photo"` without `news-brief-photo--featured`. Omit the figure entirely if no reliably sourced image is available. Do not apply this layout across other post types.
