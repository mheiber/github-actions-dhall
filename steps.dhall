{ run =
    ./steps/run.dhall 
, echo =
    ./steps/echo.dhall 
, actions/checkout =
    ./steps/actions/checkout.dhall 
, actions/cache =
    ./steps/actions/cache.dhall 
, actions/helloWorld =
    ./steps/actions/helloWorld.dhall 
, actions/setup-haskell =
    ./steps/actions/setup-haskell.dhall 
, actions/setup-java =
    ./steps/actions/setup-java.dhall 
, cachix/cachix =
    ./steps/cachix/cachix.dhall 
, cachix/install-nix =
    ./steps/cachix/install-nix.dhall 
, elastic/elasticsearch =
    ./steps/elastic/elasticsearch.dhall 
, JamesIves/ghpages-deploy =
    ./steps/JamesIves/ghpages-deploy.dhall 
, olafurpg/sbt-ci-release =
    ./steps/olafurpg/sbt-ci-release.dhall 
, olafurpg/setup-java =
    ./steps/olafurpg/setup-java.dhall 
, olafurpg/setup-gpg =
    ./steps/olafurpg/setup-gpg.dhall 
}
