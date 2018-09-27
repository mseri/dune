let process args ~input ~output =
  let ic = open_in input in
  let oc = open_out output in
  Printf.fprintf oc "Sys.argv: %s\n" (String.concat " " (Array.to_list args));
  try
    while true do
      let line = input_line ic in
      Printf.fprintf oc "ocamlformat was called on: %s" line
    done
  with End_of_file -> ();
  close_out oc;
  close_in ic

let () =
  match Sys.argv with
  | [| _ ; _; input; "-o"; output|] -> process Sys.argv ~input ~output
  | _ -> assert false
