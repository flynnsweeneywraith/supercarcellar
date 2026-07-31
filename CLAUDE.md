# Supercarcellar — Shopify Store Project

E-commerce project managed with Claude Code. The store owner is a beginner —
explain steps plainly, avoid jargon, and never assume Shopify admin knowledge.

## Session objectives (2026-07)

1. Launch a new product
2. Set up a product bundle with a 20% discount offer
3. Launch a high-converting listicle landing page
4. Analyze recent sales data to find the highest-performing products
5. Audit the site's SEO; suggest and implement changes

## Always-do rules

- **Plan first.** Before any mutation (Shopify API write, file change), outline
  the logic and get confirmation for anything hard to reverse.
- **Never touch the Live theme.** All theme work happens in a duplicated
  draft/unpublished theme. Publishing the theme is a user decision, never
  Claude's.
- **Draft mode for everything new.** New products → status `DRAFT`. New
  discounts → deactivated or with a future start date. New pages → hidden /
  unpublished. The owner reviews before anything goes live.
- **Audit log.** Every Shopify API call that writes data, and every file
  change, gets a line in `PROGRESS.md` (timestamp, action, IDs affected,
  result).
- **Commit and push.** This runs in an ephemeral cloud container — work not
  pushed to GitHub is lost when the session ends.

## Store access

- Shopify access is via the official **Shopify connector** on claude.ai
  (MCP). If its tools are missing from a session, ask the owner to enable the
  connector for the chat.
- Theme/code work (landing page, SEO fixes in templates) may need Shopify CLI
  (`npm i -g @shopify/cli`) with a **Theme Access token** — set up only when
  needed.

## Frontend design

- The landing page and any UI work must use the project skills in
  `.claude/skills/` (`taste-skill` for new pages, `redesign-skill` for
  upgrading existing ones).

## Store schema notes (learned facts — keep updated)

> Claude: when you learn something specific about this store (product/collection
> structure, naming conventions, theme name, metafields, markets, apps
> installed), record it here so future sessions inherit it.

- _Nothing recorded yet — store not connected as of 2026-07-31._
