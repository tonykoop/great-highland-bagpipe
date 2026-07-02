(* instrument-maker-v4.2 Wolfram packet source *)
ClearAll["Global`*"];

packetDir = "/mnt/c/Users/Tony/Documents/GitHub/instruments/woodwind/great-highland-bagpipe";
metadata = <|
  "PacketName" -> "Great Highland Bagpipe Build Packet",
  "PacketPath" -> ".",
  "GeneratedOn" -> "2026-07-01",
  "Model" -> "StoppedPipe",
  "HasFamilySpec" -> True,
  "HasValidation" -> True,
  "HasCncPlan" -> False
|>;

familySpecPath = FileNameJoin[{packetDir, "family-spec.csv"}];
validationPath = FileNameJoin[{packetDir, "validation.csv"}];
cncPlanPath = FileNameJoin[{packetDir, "cnc", "cnc-plan.json"}];

familySpec = If[FileExistsQ[familySpecPath],
  Import[familySpecPath, "Dataset"],
  Dataset[ImportString["[{\"member_id\": \"GHB-CHANTER\", \"subsystem\": \"chanter\", \"target_note\": \"Low A\", \"target_hz\": \"480\", \"predicted_length_in\": \"14.5\", \"bore_in\": \"0.157-0.800 conical\", \"acoustic_law\": \"open_open\", \"end_condition\": \"both_ends_open\", \"dimension_provenance\": \"empirically_seeded\", \"reed_source_role\": \"commercial double chanter reed required before final tuning\", \"pressure_dependency\": \"High; chanter pitch and stability must be logged at onset normal-play and cutoff pressure\", \"pressure_validation_status\": \"measurement_required\", \"role\": \"melody pipe\", \"prototype_priority\": \"1\"}, {\"member_id\": \"GHB-TENOR-1\", \"subsystem\": \"drone\", \"target_note\": \"A3\", \"target_hz\": \"240\", \"predicted_length_in\": \"17.0\", \"bore_in\": \"0.344/0.563 stepped\", \"acoustic_law\": \"stopped_pipe\", \"end_condition\": \"one_end_closed_reed\", \"dimension_provenance\": \"empirically_seeded\", \"reed_source_role\": \"synthetic tenor drone reed required before reed-seat lock\", \"pressure_dependency\": \"High; starts and restarts must be measured against bag pressure before duplicating tenor\", \"pressure_validation_status\": \"measurement_required\", \"role\": \"tenor drone reference\", \"prototype_priority\": \"2\"}, {\"member_id\": \"GHB-TENOR-2\", \"subsystem\": \"drone\", \"target_note\": \"A3\", \"target_hz\": \"240\", \"predicted_length_in\": \"17.0\", \"bore_in\": \"0.344/0.563 stepped\", \"acoustic_law\": \"stopped_pipe\", \"end_condition\": \"one_end_closed_reed\", \"dimension_provenance\": \"measurement_required\", \"reed_source_role\": \"copy only after GHB-TENOR-1 reed and slide behavior are measured\", \"pressure_dependency\": \"High; unison pressure response must match the validated reference tenor\", \"pressure_validation_status\": \"measurement_required\", \"role\": \"second tenor unison\", \"prototype_priority\": \"3\"}, {\"member_id\": \"GHB-BASS\", \"subsystem\": \"drone\", \"target_note\": \"A2\", \"target_hz\": \"120\", \"predicted_length_in\": \"32.0\", \"bore_in\": \"0.375/0.438/0.625 stepped\", \"acoustic_law\": \"stopped_pipe\", \"end_condition\": \"one_end_closed_reed\", \"dimension_provenance\": \"empirically_seeded\", \"reed_source_role\": \"synthetic bass drone reed required before bass slide lock\", \"pressure_dependency\": \"High; bass onset cutoff and drift must be measured after tenor stability\", \"pressure_validation_status\": \"measurement_required\", \"role\": \"bass drone reference\", \"prototype_priority\": \"4\"}, {\"member_id\": \"GHB-BLOWPIPE\", \"subsystem\": \"pressure\", \"target_note\": \"pressure supply\", \"target_hz\": \"\", \"predicted_length_in\": \"12.0\", \"bore_in\": \"0.500\", \"acoustic_law\": \"empirical_only\", \"end_condition\": \"n_a_empirical\", \"dimension_provenance\": \"measurement_required\", \"reed_source_role\": \"no reed; pressure source and one-way valve only\", \"pressure_dependency\": \"Direct pressure supply; must hold pressure without reverse flow before reed tests\", \"pressure_validation_status\": \"measurement_required\", \"role\": \"air inlet and valve\", \"prototype_priority\": \"5\"}, {\"member_id\": \"GHB-STOCKS\", \"subsystem\": \"interface\", \"target_note\": \"airtight fit\", \"target_hz\": \"\", \"predicted_length_in\": \"3.0\", \"bore_in\": \"0.813 nominal\", \"acoustic_law\": \"empirical_only\", \"end_condition\": \"n_a_empirical\", \"dimension_provenance\": \"measurement_required\", \"reed_source_role\": \"no reed; bag-to-pipe interface set\", \"pressure_dependency\": \"Indirect pressure boundary; leaks invalidate reed onset and tuning rows\", \"pressure_validation_status\": \"measurement_required\", \"role\": \"bag interface set\", \"prototype_priority\": \"6\"}]", "JSON"]]
];

validationData = If[FileExistsQ[validationPath],
  Import[validationPath, "Dataset"],
  Dataset[ImportString["[{\"check_id\": \"VAL-001\", \"subsystem\": \"Reference\", \"target\": \"A4 sanity check\", \"formula_or_spec\": \"440*2^((69-69)/12)\", \"predicted\": \"440\", \"measured\": \"\", \"units\": \"Hz\", \"tolerance\": \"0\", \"environment\": \"room\", \"result\": \"Pending\", \"action\": \"Confirms frequency formula implementation\"}, {\"check_id\": \"VAL-002\", \"subsystem\": \"Chanter Low A\", \"target\": \"480 Hz at stable pressure\", \"formula_or_spec\": \"c/(2*L_eff)\", \"predicted\": \"480\", \"measured\": \"\", \"units\": \"Hz\", \"tolerance\": \"+/-10 cents at prototype stage\", \"environment\": \"record temp humidity pressure\", \"result\": \"Pending\", \"action\": \"Set reed and pressure before hole tuning\"}, {\"check_id\": \"VAL-003\", \"subsystem\": \"Chanter Low A effective length\", \"target\": \"c/(2*480)\", \"formula_or_spec\": \"14.073\", \"predicted\": \"\", \"measured\": \"in\", \"units\": \"+/-0.25 in first-order estimate\", \"tolerance\": \"room\", \"environment\": \"Pending\", \"result\": \"Compare with physical 14.5 in body and reed behavior\", \"action\": null}, {\"check_id\": \"VAL-004\", \"subsystem\": \"Chanter scale all notes\", \"target\": \"Just ratios from design.md\", \"formula_or_spec\": \"c/(2*f_note)\", \"predicted\": \"see design.md\", \"measured\": \"\", \"units\": \"cents\", \"tolerance\": \"+/-15 cents prototype; +/-5 cents final\", \"environment\": \"record pressure and reed\", \"result\": \"Pending\", \"action\": \"Tune from undersize with tape/enlargement\"}, {\"check_id\": \"VAL-005\", \"subsystem\": \"Tenor drone A3\", \"target\": \"240 Hz\", \"formula_or_spec\": \"c/(4*240)\", \"predicted\": \"14.073\", \"measured\": \"\", \"units\": \"in effective\", \"tolerance\": \"+/-0.5 in before slide tuning\", \"environment\": \"room\", \"result\": \"Pending\", \"action\": \"Check slide range before duplicate tenor\"}, {\"check_id\": \"VAL-006\", \"subsystem\": \"Tenor drone frequency\", \"target\": \"240 Hz with chosen reed\", \"formula_or_spec\": \"stopped pipe plus reed/slide\", \"predicted\": \"240\", \"measured\": \"\", \"units\": \"Hz\", \"tolerance\": \"+/-5 cents against chanter Low A\", \"environment\": \"record pressure and reed\", \"result\": \"Pending\", \"action\": \"Adjust reed bridle/screw then slide\"}, {\"check_id\": \"VAL-007\", \"subsystem\": \"Bass drone A2\", \"target\": \"120 Hz\", \"formula_or_spec\": \"c/(4*120)\", \"predicted\": \"28.146\", \"measured\": \"\", \"units\": \"in effective\", \"tolerance\": \"+/-1.0 in before slide tuning\", \"environment\": \"room\", \"result\": \"Pending\", \"action\": \"Confirm bass slide travel and reed stability\"}, {\"check_id\": \"VAL-008\", \"subsystem\": \"Bag pressure\", \"target\": \"18-25 inH2O planned normal-play window\", \"formula_or_spec\": \"manometer reading\", \"predicted\": \"18-25 planned\", \"measured\": \"\", \"units\": \"inH2O\", \"tolerance\": \"measurement_required\", \"environment\": \"player test\", \"result\": \"Pending\", \"action\": \"Log measured start normal-play and cutoff pressure before treating the range as evidence\"}]", "JSON"]]
];

frequencyFromMidi[midi_, a4_: 440] := a4*2^((midi - 69)/12);
centsError[measured_, target_] := 1200*Log[2, measured/target];
openPipeLengthIn[freq_, c_: 13552, radius_: 0] := c/(2*freq) - 2*0.6*radius;
stoppedPipeLengthIn[freq_, c_: 13552, radius_: 0] := c/(4*freq) - 0.6*radius;
helmholtzFrequency[area_, volume_, leff_, c_: 13552] :=
  (c/(2*Pi))*Sqrt[area/(volume*leff)];
cantileverFrequency[k_, thickness_, length_] := k*thickness/length^2;
stringFrequency[length_, tension_, linearDensity_] :=
  1/(2*length)*Sqrt[tension/linearDensity];

modelExplorer = Switch[metadata["Model"],
  "Helmholtz",
    Manipulate[
      helmholtzFrequency[portArea, chamberVolume, effectiveLength],
      {{portArea, 0.4, "port area (in^2)"}, 0.05, 4},
      {{chamberVolume, 40, "volume (in^3)"}, 5, 400},
      {{effectiveLength, 0.6, "effective length (in)"}, 0.05, 3}
    ],
  "OpenPipe",
    Manipulate[
      openPipeLengthIn[f, 13552, radius],
      {{f, 440, "target Hz"}, 80, 1200},
      {{radius, 0.375, "bore radius (in)"}, 0, 1.5}
    ],
  "StoppedPipe",
    Manipulate[
      stoppedPipeLengthIn[f, 13552, radius],
      {{f, 220, "target Hz"}, 40, 1000},
      {{radius, 0.375, "bore radius (in)"}, 0, 1.5}
    ],
  "CantileverBeam",
    Manipulate[
      cantileverFrequency[k, thickness, length],
      {{k, 24000, "K constant"}, 1000, 80000},
      {{thickness, 0.25, "thickness (in)"}, 0.05, 1},
      {{length, 4.5, "length (in)"}, 0.5, 24}
    ],
  _,
    Manipulate[
      frequencyFromMidi[midi],
      {{midi, 69, "MIDI note"}, 24, 96, 1}
    ]
];

audioPreview[f_: 440, seconds_: 1.5] :=
  AudioNormalize[
    AudioAdd[
      AudioGenerator[{"Sin", f}, seconds],
      .35 AudioGenerator[{"Sin", 2 f}, seconds],
      .18 AudioGenerator[{"Sin", 3 f}, seconds]
    ]
  ];

validationRows = Normal[validationData];
validationPlot = Quiet@Check[
  ListPlot[
    DeleteMissing[
      ToExpression /@ Lookup[validationRows, "Cents Error", Missing[]]
    ],
    PlotTheme -> "Scientific",
    Frame -> True,
    FrameLabel -> {{"Cents error", None}, {"Measurement row", metadata["PacketName"]}}
  ],
  "No numeric validation cents-error values yet."
];

packetNotebook[] := CreateDocument[
  {
    TextCell[metadata["PacketName"], "Title"],
    TextCell["instrument-maker v4.2 computational packet", "Subtitle"],
    TextCell["Metadata", "Section"],
    ExpressionCell[metadata, "Input"],
    TextCell["Family/design data", "Section"],
    ExpressionCell[familySpec, "Input"],
    TextCell["Model explorer", "Section"],
    ExpressionCell[modelExplorer, "Input"],
    TextCell["Audio preview", "Section"],
    ExpressionCell[audioPreview[440], "Input"],
    TextCell["Validation", "Section"],
    ExpressionCell[validationPlot, "Input"]
  },
  WindowTitle -> metadata["PacketName"]
];

packetNotebook[];
