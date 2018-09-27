let process args ~input =
  let ic = open_in input in
  let oc = stdout in
  Printf.fprintf oc "Sys.argv: %s\n" (String.concat " " (Array.to_list args));
  try
    while true do
      let line = input_line ic in
      Printf.fprintf oc "refmt was called on: %s" line
    done
  with End_of_file -> ();
  close_in ic

let () =
  match Sys.argv with
  | [| _ ; input|] -> process Sys.argv ~input
  | _ -> assert false
