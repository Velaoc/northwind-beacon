<!-- foundation:identity -->
# Northwind Beacon

Marketing landing page for Beacon, a SaaS product: hero, features, pricing tiers, FAQ, and a waitlist email signup that stores leads for the operator.

- Site: https://northwind-beacon.api.holode.xyz
- Support: support@northwind-beacon.api.holode.xyz
<!-- /foundation:identity -->

## What this is

Marketing landing page for Beacon, a SaaS product: hero, features, pricing tiers, FAQ, and a waitlist email signup that stores leads for the operator.

## Who it is for

- visitor
- operator

## Main features

- **Browse landing page** — Visitor reads hero, features, pricing tiers, and FAQ sections.
- **Join waitlist** — Visitor submits email (and optional name); a Lead is stored with unique normalized email.
- **Review leads** — Operator views captured waitlist leads in the admin inbox.

## Core entities

- Lead

## Run locally

```bash
bundle install
bin/rails db:prepare
bin/dev
```

Requires Ruby, PostgreSQL, and the usual Rails toolchain. See `bin/setup` if present.

## Demo

Two sample waitlist leads (distinct emails) so the operator inbox demonstrates real data, plus a success-state confirmation when a visitor signs up.

## Deploy notes

Production `config.hosts` is derived from `domain` in `config/foundation.yml`. Keep that value aligned with the real host or every request will 403.
