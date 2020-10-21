let List/concatMap =
      https://prelude.dhall-lang.org/v17.1.0/List/concatMap.dhall 

let Map =
      https://prelude.dhall-lang.org/v17.1.0/Map/package.dhall 

let Optional/map =
      https://prelude.dhall-lang.org/v17.1.0/Optional/map.dhall 

let Step = ../../schemas/Step.dhall

let HaskellSetup = ../../schemas/actions/HaskellSetup.dhall

let stringBool =
      Optional/map Bool Text (λ(b : Bool) → if b then "true" else "false")

let haskell-setup
    : HaskellSetup.Type → Step.Type
    = λ(args : HaskellSetup.Type) →
        Step::{
        , uses = Some "actions/setup-haskell@v1"
        , `with` = Some
            ( List/concatMap
                (Map.Entry Text (Optional Text))
                (Map.Entry Text Text)
                ( λ(e : Map.Entry Text (Optional Text)) →
                    merge
                      { None = [] : Map.Type Text Text
                      , Some = λ(v : Text) → [ Map.keyText e.mapKey v ]
                      }
                      e.mapValue
                )
                ( toMap
                    { ghc-version = args.ghc-version
                    , cabal-version = args.cabal-version
                    , stack-version = args.stack-version
                    , enable-stack = stringBool args.enable-stack
                    , stack-no-global = stringBool args.stack-no-global
                    , stack-setup-ghc = stringBool args.stack-setup-ghc
                    }
                )
            )
        }

in  haskell-setup
