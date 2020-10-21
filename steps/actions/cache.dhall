let Step = ../../schemas/Step.dhall

let Text/concatMapSep =
      https://prelude.dhall-lang.org/v17.1.0/Text/concatMapSep.dhall 

in  λ(args : { path : Text, key : Text, hashFiles : List Text }) →
      let hashFilesArg =
            Text/concatMapSep "," Text (λ(x : Text) → "'${x}'") args.hashFiles

      in  Step::{
          , id = None Text
          , name = Some "${args.path} cache"
          , uses = Some "actions/cache@v2"
          , run = None Text
          , `with` = Some
              ( toMap
                  { path = args.path
                  , key =
                      "\${{ runner.os }}-${args.key}-\${{ hashFiles('${hashFilesArg}') }}"
                  , restore-keys = args.key
                  }
              )
          }
