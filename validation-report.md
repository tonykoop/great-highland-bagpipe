# Validation Report - Great Highland Bagpipe

## Clean Checks

- Required Tier 1 packet files exist: design, BOM, sourcing, cut list,
  validation sheet, assembly manual, RFQ, drawing brief, visual BOM brief,
  Wolfram starter, risks, README, capstone deck, print packet, PDF, manifest,
  and generated PPTX.
- README is no longer the minimal scaffold and references an existing hero
  image at `images/ghb-system-map.svg`.
- CSV key columns are populated with explicit specs, quantities, search terms,
  dimensions, costs, or marked prototype assumptions.
- Capstone Markdown deck has 15 slides and no placeholder design-intent
  fallback.
- Printable packet artifacts generated: `print-packet.md`,
  `print-packet.html`, and `print-packet.pdf`.
- Static build-log site generated at `site/index.html`.

## Fixed In v4 Verifier Loop

- `capstone-deck.pptx` was missing because `python-pptx` is not installed in
  this environment. A minimal valid OpenXML PPTX was generated from
  `capstone-deck.md` using the Python standard library.

## Escalated

- None. `validate_packet.py . --fix` reports all gates passed.

## Remaining Prototype Work

- Supplier prices, lead times, and part dimensions must be checked before
  purchase.
- Reed-seat dimensions must be updated from the actual reeds selected for the
  prototype.
- Measured tuning, pressure, and leakage results should be recorded in
  `validation.csv` after the first physical build.
