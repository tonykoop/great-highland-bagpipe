# MCP Session Log

V5 provenance — aligned with `tonykoop/instrument-maker` V5 build-packet standard.

No Claude Desktop MCP session was run for this packet. The OpenSCAD master
starter was hand-authored from the committed design-table and workbook references.
No fabrication authority has been claimed for any output.

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-05-29-ghb-master-scad-v1 | openscad | great-highland-bagpipe-design-table.xlsx; family-spec.csv | cad/great-highland-bagpipe-master.scad | cad_authoring | pending_measurement | unreviewed | Master starter scaffold; chanter and drone geometry from design-table seed values; NOT fabrication authority. All bore and hole positions require physical reed and bore measurement before any CAD/DXF authority is claimed. |
| 2026-05-29-svg-drawings-v1 | illustrator_manual | great-highland-bagpipe-design-table.xlsx | drawings/ghb-chanter-front.svg; drawings/ghb-drone-set.svg; drawings/ghb-pressure-interface.svg; drawings/ghb-system-validation.svg | drawing_cleanup | derived_preview | unreviewed | First-pass SVG layout drawings; review previews only; not CNC toolpath or inspection authority. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | great-highland-bagpipe-design-table.xlsx, bom.csv, sourcing.csv, cut-list.csv, validation.csv | bom.csv, sourcing.csv, cut-list.csv, validation.csv | packet_refresh | fabrication | self_checked | V5 refresh pass: README status line format fixed (bold-colon bug); tabular packet data reviewed against design-table baseline, no dimension changes made. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) + OpenSCAD CLI | great-highland-bagpipe-design-table.xlsx | cad/great-highland-bagpipe-master.scad | cad_authoring | pending_measurement | self_checked | Existing master kept as-is (no rewrite). openscad render check: pass (openscad -o STL, exit 0). |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) + generate_wolfram_packet.py | great-highland-bagpipe-design-table.xlsx, family-spec.csv, validation.csv | wolfram/great-highland-bagpipe-wolfram-model.wl | analysis_source | derived_preview | unreviewed | Generated via $SKILL/generate_wolfram_packet.py (not executed — no --execute passed); renamed from instrument-model.wl; source-only L2 evidence. |

## Current Boundary

No MCP-connected CAD tool, image-generation tool, Wolfram runtime, or
external session has produced fabrication authority for this packet. All
CAD and drawing outputs carry `pending_measurement` or `derived_preview`
authority and must not be used as shop-floor fabrication geometry.
