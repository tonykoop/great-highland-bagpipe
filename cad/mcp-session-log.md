# MCP Session Log

V5 provenance — aligned with `tonykoop/instrument-maker` V5 build-packet standard.

No Claude Desktop MCP session was run for this packet. The OpenSCAD master
starter was hand-authored from the committed design-table and workbook references.
No fabrication authority has been claimed for any output.

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-05-29-ghb-master-scad-v1 | openscad | great-highland-bagpipe-design-table.xlsx; family-spec.csv | cad/great-highland-bagpipe-master.scad | cad_authoring | pending_measurement | unreviewed | Master starter scaffold; chanter and drone geometry from design-table seed values; NOT fabrication authority. All bore and hole positions require physical reed and bore measurement before any CAD/DXF authority is claimed. |
| 2026-05-29-svg-drawings-v1 | illustrator_manual | great-highland-bagpipe-design-table.xlsx | drawings/ghb-chanter-front.svg; drawings/ghb-drone-set.svg; drawings/ghb-pressure-interface.svg; drawings/ghb-system-validation.svg | drawing_cleanup | derived_preview | unreviewed | First-pass SVG layout drawings; review previews only; not CNC toolpath or inspection authority. |

## Current Boundary

No MCP-connected CAD tool, image-generation tool, Wolfram runtime, or
external session has produced fabrication authority for this packet. All
CAD and drawing outputs carry `pending_measurement` or `derived_preview`
authority and must not be used as shop-floor fabrication geometry.
