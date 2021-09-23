[@@@js.stop]

val available : unit -> bool

[@@@js.start]

[@@@js.implem
let available () =
  Js_of_ocaml.Js.Optdef.test Js_of_ocaml.Js.Unsafe.global##.chooser]

type file_data

val data : file_data -> string [@@js.get]

val data_uri : file_data -> string [@@js.get "dataURI"]

val media_type : file_data -> string [@@js.get "mediaType"]

val name : file_data -> string [@@js.get]

val uri : file_data -> string [@@js.get]

module GetFile : sig
  type t

  type then_t

  val get_file : ?accept:string -> unit -> t [@@js.global "chooser.getFile"]

  val then_ : t -> callback:(file_data option -> unit) -> then_t [@@js.call]

  val catch : then_t -> (Ojs.t -> unit) -> unit [@@js.call]
end

module GetFileMetadata : sig
  type t

  type then_t

  val get_file_metadata : ?accept:string -> unit -> t
    [@@js.global "chooser.getFileMetadata"]

  val then_ : t -> callback:(file_data option -> unit) -> then_t [@@js.call]

  val catch : then_t -> (Ojs.t -> unit) -> unit [@@js.call]
end
