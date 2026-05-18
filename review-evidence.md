# Review Evidence

Refs #1.

## Round 3 Scope

- Re-validated the existing root-mode packet as part of the wind build-packet
  sweep.
- Existing packet already includes Great Highland Bagpipe specifics: chanter
  scale centered around modern A, stopped-pipe drone model, drone tuning,
  reed selection, pressure/leak validation, and subsystem build order.
- This packet remains an L2/L3-candidate system packet, not a measured build.

## Gates Before Close

- Buy or select real chanter and drone reeds before finalizing bores.
- Record bag pressure, leakage, drone lock, chanter scale, reed response, and
  maintenance checks in `validation.csv`.
- Confirm public-facing language and sourcing before release.

## Round 33C/D Reed And Pressure Slice

- Added `reed-pressure-validation.csv` as a focused measurement ledger for
  chanter/drone reed source roles, onset pressure, normal-play pressure
  response, cutoff/choke behavior, full-set coupling, and pressure-system
  control checks.
- Added acoustic-law, end-condition, dimension-provenance, reed-source-role,
  pressure-dependency, and pressure-validation-status columns to
  `family-spec.csv`.
- Preserved authority boundaries: pressure and reed behavior remain
  `measurement_required` until repo-local manometer, tuner, reed-setting, and
  leak-test evidence exists.
