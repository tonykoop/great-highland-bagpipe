(* Great Highland Bagpipe Wolfram starter *)

ClearAll["Global`*"];

cInPerSec = 13510;
lowA = 480;

justScale = <|
  "Low G" -> 8/9,
  "Low A" -> 1,
  "B" -> 9/8,
  "C written C#" -> 5/4,
  "D" -> 4/3,
  "E" -> 3/2,
  "F written F#" -> 5/3,
  "High G" -> 7/4,
  "High A" -> 2
|>;

fChanter[lenIn_] := cInPerSec/(2 lenIn);
lChanter[f_] := cInPerSec/(2 f);
fDrone[lenIn_] := cInPerSec/(4 lenIn);
lDrone[f_] := cInPerSec/(4 f);
centsError[measured_, target_] := 1200 Log2[measured/target];

chanterTable = KeyValueMap[
  {#1, #2, N[lowA #2], N[lChanter[lowA #2]]} &,
  justScale
];

droneTargets = {
  {"Tenor A3", lowA/2, N[lDrone[lowA/2]]},
  {"Bass A2", lowA/4, N[lDrone[lowA/4]]}
};

pressureWindowInH2O = {18, 25};

Dataset[AssociationThread[
  {"Note", "Ratio", "TargetHz", "EffLengthIn"},
  #] & /@ chanterTable]

Dataset[AssociationThread[
  {"Drone", "TargetHz", "EffLengthIn"},
  #] & /@ droneTargets]

(* Suggested next cells:
   1. Import measured validation.csv rows and compute centsError.
   2. Plot chanter just-intonation targets against equal temperament.
   3. Model pressure sensitivity by fitting measured pitch vs inH2O.
   4. Use TransferFunctionModel or NDSolve for a reed-pressure toy model.
*)
