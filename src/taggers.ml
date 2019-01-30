open TracerTypes
open FullTrace

let with_result f full_trace = match full_trace.result with
  | None -> ()
  | Some res -> f res full_trace

let tag_storage' result { trace; _ } =
  let open Op in
  match trace.Trace.op with
  | Sload -> StackValue.set_tag result ~key:"storage" ~value:(`Bool true)
  | _ -> ()
let tag_storage = with_result tag_storage'