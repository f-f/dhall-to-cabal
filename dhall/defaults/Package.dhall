-- This file is auto-generated by dhall-to-cabal-meta. Look but don't touch (unless you want your edits to be over-written).
let types = ./../types.dhall

in  { author =
        ""
    , flags =
        [] : List
             { default : Bool, description : Text, manual : Bool, name : Text }
    , benchmarks =
        [] : List
             { name :
                 Text
             , benchmark :
                 ∀(config : types.Config) → types.Benchmark
             }
    , bug-reports =
        ""
    , build-type =
        None types.BuildType
    , cabal-version =
        ./../Version/v.dhall "2.2"
    , category =
        ""
    , copyright =
        ""
    , data-dir =
        ""
    , data-files =
        [] : List Text
    , description =
        ""
    , executables =
        [] : List
             { name :
                 Text
             , executable :
                 ∀(config : types.Config) → types.Executable
             }
    , extra-doc-files =
        [] : List Text
    , extra-source-files =
        [] : List Text
    , extra-tmp-files =
        [] : List Text
    , foreign-libraries =
        [] : List
             { name :
                 Text
             , foreign-lib :
                 ∀(config : types.Config) → types.ForeignLibrary
             }
    , homepage =
        ""
    , library =
        None (∀(config : types.Config) → types.Library)
    , license =
        types.License.AllRightsReserved
    , license-files =
        [] : List Text
    , maintainer =
        ""
    , package-url =
        ""
    , source-repos =
        [] : List types.SourceRepo
    , stability =
        ""
    , sub-libraries =
        [] : List
             { name : Text, library : ∀(config : types.Config) → types.Library }
    , synopsis =
        ""
    , test-suites =
        [] : List
             { name :
                 Text
             , test-suite :
                 ∀(config : types.Config) → types.TestSuite
             }
    , tested-with =
        [] : List { compiler : types.Compiler, version : types.VersionRange }
    , x-fields =
        [] : List { _1 : Text, _2 : Text }
    , custom-setup =
        None types.CustomSetup
    }