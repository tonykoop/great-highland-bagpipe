# Design Intent — great-highland-bagpipe rev A

- Master CAD: `cad/great-highland-bagpipe-master.scad` (sha256: 7bcdc95fce3c7fae077277482be11eb72df51515757a26632cf0f1e08deeaa63), driven by `great-highland-bagpipe-design-table.xlsx` (sha256: 3ddafd30d57a32bd5da541066588c79f2f1255a5bc5907dc597e76836bcbe0d7)
- Function: Full Great Highland Bagpipe system — conical-bore chanter (open-open, cane double reed) coupled to two tenor + one bass stopped-pipe drones (synthetic/cane reeds), fed by a pressurized bag (18-25 inH2O first-pass range) through a blowpipe one-way valve and turned stocks. Chanter plays a just-intonation Mixolydian-like scale tuned to the drones, not equal temperament (design.md).
- Environment: hand-blown, sustained-pressure system; reed response and drone onset/cutoff are pressure-dependent; wood body (African blackwood preferred, Delrin/ipe/cherry for prototyping) is a coupled reed/resonator/reservoir system, not a simple first-order pipe.
- Target qty: 1 (prototype set — 1 chanter, 2 tenor drones, 1 bass drone). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Chanter Low A | 480 Hz | onset/normal-play/cutoff pressure logged (validation.csv) | pitch reference, not concert A440 | family-spec.csv GHB-CHANTER (measurement_required) |
| Chanter predicted length | 14.5 in | cents error vs validation.csv after reed fit | intonation | family-spec.csv GHB-CHANTER (empirically_seeded) |
| Chanter bore | 0.157-0.800 in conical | undersize holes first, enlarge incrementally (risks.md) | acoustic/reed agreement | family-spec.csv GHB-CHANTER (empirically_seeded) |
| Tenor drone (A3) length | 17.0 in | unison match to reference tenor before duplicating | drone tuning | family-spec.csv GHB-TENOR-1 (empirically_seeded) |
| Bass drone (A2) length | 32.0 in | onset/cutoff/drift measured after tenor stability | drone tuning | family-spec.csv GHB-BASS (empirically_seeded) |
| Bag pressure | 18-25 inH2O | manometer readings during 10-min play simulation | reed pitch/stability | design.md Design Inputs (measurement_required) |
| Blowpipe bore | 0.500 in | must hold pressure, no reverse flow, before reed tests | pressure supply reliability | family-spec.csv GHB-BLOWPIPE (measurement_required) |

## Incidental (free for DFM)

- Decorative turning/mounts, hemp/beeswax wrap cosmetics, bag cover fabric choice, non-mating stock ornamentation.

## Must-nots (DFM may never violate)

- Do not lock final bore/hole geometry from the first-order `c/(2L)`/`c/(4L)` estimate alone — chanter bore, reed, tone-hole network, and bag pressure are a coupled system (risks.md "Acoustic Chanter Bore And Reed Do Not Agree").
- Do not bore/ream final blackwood before proving the workflow in Delrin/ipe/cherry — long small-diameter bores in blackwood risk heat-checking and wander (risks.md structural risk).
- Do not duplicate the second tenor drone until the first tenor's reed seat and slide behavior are measured and validated (family-spec.csv GHB-TENOR-2).
- Do not treat any bore/length/pressure value as build-ready until validation.csv gates clear — all currently `measurement_required` or `empirically_seeded`.

## Material intent

- Preferred: African blackwood (final), per bom.csv.
- Acceptable subs: Delrin, ipe, cherry, walnut, maple for prototyping (bom.csv notes: use for first prototype, avoid final blackwood until bore workflow is proven).
- Forbidden: none recorded beyond the prototype-before-blackwood sequencing above.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable.
