# dhall-to-cabal change log

## Next -- [YYYY-MM-DD]

* Remove `dhall/types/CustomSetup.dhall` in favour of the identical
  `dhall/types/SetupBuildInfo.dhall`.

* `cabal-to-dhall` no longer generates bogus output for an unknown
  kind of `source-repository` stanza.

* Added `dhall/types/ForeignLibOption.dhall`, also available as
  `types.ForeignLibOption`, and `--print-type ForeignLibOption`.
  Likewise `ForeignLibType`.

## 1.3.3.0 -- 2019-05-15

* All constructors that previously took an empty record now use the
  new nullary syntax instead. This is a breaking change for user code.
  For example, instead of `types.Compiler.GHC {=}`, now you just write
  `types.Compiler.GHC`.

* Use `dhall` version 1.23.0.

* Educated `--print-type` about `Scope` and `ModuleRenaming`.

* Fix `cabal-to-dhall` output for unknown licenses using `cabal` spec
  version below `2.0`. Now it uses values of type `License.Unknown Text` 
  for them.

* Improved `--print-type` and `--print-default` output to use
  multi-binding `let`.

## 1.3.2.0 -- 2019-02-12

* Use `dhall` version 1.20.1.

* `prelude.dhall` no longer provides types (as this isn't supported in
  Dhall 1.20.1). Instead, there is now a new `types.dhall` file.

* `dhall-to-cabal` now accepts`--output-stdout`, `--output-dir-cwd
  DIR`, and `--output-dir-input DIR` flags control the destination of
  the generated `.cabal` file. `--output-dir-cwd` interprets its
  argument relative to the current working directory and
  `--output-dir-input` interprets its argument relative to the input
  file.

  The default has been changed to `--output-dir-input .`, which writes
  to the same directory as the input file; previously it corresponded
  to `--output-stdout`.

## 1.3.1.0 -- 2018-10-23

* Allow `Cabal` version 2.4.0.0. There have been consequent changes to
  the extensions, compilers and licenses recognised.

* Allow `dhall` version 1.18.

* `dhall-to-cabal` and `cabal-to-dhall` now understand the `mixins`
  field properly.

  On the Dhall side, `types.ModuleRenaming` has changed significantly:
  it is now a union.

  `prelude.types.ModuleRenaming` has been added for convenient access
  to the new constructors.

* Fix issue with alpha-normalized expressions. This was identified in issue #124
  and fixed in issue #126.


## 1.3.0.1 -- 2018-08-10

### Distribution Changes

* Include all files necessary to run tests.


## 1.3.0.0 -- 2018-07-28

### Breaking API Changes

* `DhallToCabal.dhallToCabal` now takes an `InputSettings` from
  `dhall` as its first argument.

### Functional Changes

* `dhall-to-cabal` has a new `--print-default TYPE` flag.

* When reading from a file, `dhall-to-cabal` now interprets imports as
  being relative to that file, rather than the current working
  directory. (#114)


## 1.2.0.0 -- 2018-07-05

### Breaking API Changes

* Remove orphan `Dhall.Core.Inject` instances for `[Char]` and
  `CompilerFlavor`.

* `CabalToDhall.cabalToDhall` is now a pure function that accepts a
  `GenericPackageDescription`. A new convenience function has been
  added to `CabalToDhall`, `parseGenericPackageDescriptionThrows`.

### Functional Changes

* `os` conditions where the operating system's name was not recognised
  (e.g., `os(multics)`) were crashing cabal-to-dhall. They now work as
  expected.

* `dhall-to-cabal` and `cabal-to-dhall` now respond to `--version`.

* The `dhall` subdirectory has been reorganised so that things that
  are not types are not in the `types` subdirectory. Specifically,
  `dhall/types/Version/v.dhall`, all of
  `dhall/types/VersionRange/*.dhall` and the operations (i.e., the
  enumerations `LicenseId.dhall` and `LicenseExceptionId.dhall`) from
  `dhall/types/SPDX/*.dhall` have been moved to, respectively,
  `dhall/Version/v.dhall`, `dhall/VersionRange/*.dhall`, and
  `dhall/SPDX/*.dhall`. In addition, the files have been renamed as
  appropriate to reflect the name that they are exported from the
  prelude as; in practice, this means that they have gone from
  TitleCase to camelCase.

  Code that only imports `prelude.dhall` and `types.dhall` is
  unaffected by this change.

* `prelude.defaults.Package.license` is now `AllRightsReserved`.

* `dhall-to-cabal` now maps `AllRightsReserved` to `SPDX.NONE` when
  `cabal-version` is at least 2.2.

* `cabal-to-dhall` will now generate more compact `.dhall` files by
  using defaults.

* The default `build-type` is now omission, to use Cabal 2.2's
  inference, and the default `cabal-version` has been bumped to 2.2.

* Export `prelude.types.Scopes`.

## Other Changes

* Bump upper-bounds for `base`, `containers` and `contravariant`. This project
  can build on GHC 8.6 (though will need `--allow-newer` for `Cabal` until this
  is official released).


## 1.1.0.0 -- 2018-06-03

### Breaking Changes

* The type of DhallToCabal.license has changed to
  `Dhall.Type (Either SPDX.License Cabal.License)` to accomodate Cabal 2.2.

### Other Changes

* Increase upper-bound of base to allow 4.11.

* Increase upper-bound of tasty to allow 1.1.

* Switch to Dhall 1.14.0.

* dhall-to-cabal: Fix tracking which branches are already true or false in
  conditionals. Dhall expressions with lots of conditions previously produced
  Cabal files that did not correctly match the requested conditions. See
  https://github.com/dhall-lang/dhall-to-cabal/pull/56,
  https://github.com/dhall-lang/dhall-to-cabal/issues/53 and
  https://github.com/dhall-lang/dhall-to-cabal/issues/55 for more information.

  Thank you to @jneira and @quasicomputational for helping identify and fix this
  bug.

* cabal-to-dhall: Rewrite conditional handling to avoid hangs with complicated ones.
  See https://github.com/dhall-lang/dhall-to-cabal/pull/54 and linked issues.

* Added a warning to generated `.cabal` files against hand-editing.

* `cabal-to-dhall` now pretty prints the resulting Dhall.

* The signature of `CabalToDhall.cabalToDhall` has changed: it now takes the location
  of the `prelude.dhall` and `types.dhall` to import as a parameter.

* Upgrade to Cabal 2.2. This introduces SPDX license identifiers and Dhall
  functionality to manipulate them; see <golden-tests/dhall-to-cabal/SPDX.dhall>
  for a (convoluted) demonstration.

* `prelude.defaults.Executable` has lost its `main-is` field, as it
  makes little sense to have an executable without it.

* `--print-type` now omits the lengthy definition of `Extension`, instead importing
  it from the prelude. `--self-contained` is a new switch to disable this behaviour.


## 1.0.0.1 -- 2018-03-25

Small packaging only tweaks:

* Missing README.md
* Missing author

The irony of this change is not lost on me.

## 1.0.0 -- 2018-03-25

First release!
