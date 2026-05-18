# Great Highland Bagpipe

> A system-of-systems engineering packet for a full Great Highland Bagpipe set:
> chanter, drones, reeds, bag, stocks, blowpipe, pressure regulation, tuning,
> sourcing, maintenance, and validation.

![Great Highland Bagpipe system map](images/ghb-system-map.svg)

## GitHub Repo Metadata

**Description:** Parametric Great Highland Bagpipe build packet covering the
chanter, tenor and bass drones, reeds, bag pressure, stocks, blowpipe, tuning,
maintenance, sourcing, and validation.

**Suggested topics:** `great-highland-bagpipe`, `bagpipe`, `woodwind`,
`reed-instrument`, `parametric-design`, `acoustic-modeling`, `cnc-lathe`,
`woodturning`, `wolfram`, `instrument-making`, `build-packet`

## What This Is

This repository turns the Great Highland Bagpipe workbook into an L2/L3-candidate
packet. It treats the instrument as an interacting set of subsystems rather
than a single pipe: the conical double-reed chanter, two tenor drones, one bass
drone, three drone reeds, one chanter reed, five stocks, blowpipe valve,
reservoir bag, hemped tuning slides, and a maintenance/validation loop.

The design starts from `great-highland-bagpipe-design-table.xlsx`, which uses a
modern GHB Low A of 480 Hz, just-intonation chanter ratios, and first-pass
dimensions for a full chanter and drone set. Formula-derived dimensions are
marked as first-order estimates until confirmed against a physical reed, bore,
and pressure setup.

## Packet Map

- [`design.md`](design.md) - governing acoustic model, subsystem interfaces,
  pressure model, assumptions, and hardware alignment.
- [`bom.csv`](bom.csv) - bill of materials with part categories, operations,
  drawing references, and substitute rules.
- [`sourcing.csv`](sourcing.csv) - supplier/search tracker with current-check
  fields left for purchasing.
- [`cut-list.csv`](cut-list.csv) - rough and finished stock sizes for chanter,
  drones, stocks, blowpipe, mounts, and fixtures.
- [`validation.csv`](validation.csv) - tuning, pressure, leakage, fit, and
  maintenance checks.
- [`reed-pressure-validation.csv`](reed-pressure-validation.csv) - reed source
  roles, onset/cutoff pressure gates, and coupled pressure-response evidence
  rows kept at measurement-required status until real manometer/tuner data
  exists.
- [`assembly-manual.md`](assembly-manual.md) - shop sequence from reeds-first
  testing through final maintenance.
- [`risks.md`](risks.md) - acoustic, structural, ergonomic, supply, and
  fit/finish risk tests.
- [`drawings/`](drawings/) - first-pass dimensioned SVG sheets.
- [`cad/`](cad/) - parametric OpenSCAD master starter.
- [`site/`](site/) - static build-log site generated from the packet.

## System Architecture

| Subsystem | Function | First Prototype Decision |
| --- | --- | --- |
| Chanter | Conical double-reed melody pipe | Use the workbook's 14.5 in full-chanter length and tune holes from undersize with a commercial reed. |
| Tenor drones | Two stopped cylindrical A3 reference pipes | Build both identically; validate one tenor before copying the second. |
| Bass drone | Stopped cylindrical A2 reference pipe | Build in bottom/middle/top sections with long tuning overlap. |
| Reeds | Oscillating valves and pitch drivers | Buy commercial chanter and drone reeds for prototype stability. |
| Bag | Pressure reservoir | Buy synthetic zipper bag for repeatable airtightness. |
| Stocks and blowpipe | Airtight mechanical interfaces | Turn as separate service parts with hemped or tied-in seals. |
| Maintenance | Keeps the system stable | Add leakage, hemp, moisture, and reed checks to every validation pass. |

## Build Order

1. Buy reeds and bag first, because the acoustic system cannot be validated
   without real pressure and real reed behavior.
2. Turn a practice/prototype chanter in cherry, walnut, Delrin, or ipe before
   committing African blackwood.
3. Validate the chanter bore and note holes using tape and incremental
   enlargement.
4. Build one tenor drone, tune its reed seat and slide behavior, then duplicate
   it.
5. Build the bass drone after tenor tuning and leakage are stable.
6. Turn stocks and blowpipe, tie into the bag, and run full pressure tests.

## Status

| Area | Status |
| --- | --- |
| Workbook | Existing `great-highland-bagpipe-design-table.xlsx` inspected and promoted into packet files |
| Acoustic model | First-order conical chanter plus stopped cylindrical drones documented |
| Manufacturing plan | Lathe/CNC workflow and cut list drafted |
| Sourcing | Prototype and final-material sourcing tracker drafted |
| Validation | Tuning, pressure, leakage, fit, maintenance, reed onset/cutoff, and pressure-response checks drafted |
| Drawings | First-pass subsystem SVG drawings included |
| Site/deck/print packet | Generated artifacts live at repo root and `site/` |

## License

[CC BY 4.0](LICENSE) - see LICENSE for details.
