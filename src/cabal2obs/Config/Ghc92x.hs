{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module Config.Ghc92x ( ghc92x ) where

import Config.ForcedExecutables
import Oracle.Hackage ( )
import Types
import MyCabal

import Control.Monad
import qualified Data.List as List
import qualified Data.Map as Map
import Data.Map.Strict ( fromList, toList )
import Data.Maybe
import qualified Data.Set as Set
import Development.Shake

ghc92x :: Action PackageSetConfig
ghc92x = do
  let compiler = "ghc-9.2.0"
      flagAssignments = fromList (readFlagAssignents flagList)
      forcedExectables = forcedExectableNames
      corePackages = ghcCorePackages
  packageSet <- fromList <$>
                  forM (toList constraintList) (\(pn,vr) ->
                    (,) pn <$> askOracle (PackageVersionConstraint pn vr))
  checkConsistency (PackageSetConfig {..})

{-
targetPackages :: ConstraintSet
targetPackages   = [ "alex >=3.2.5"
                   , "cabal-install ==3.2.*"
                   , "cabal2spec >=2.6"
                   , "cabal-plan"
                   , "distribution-opensuse >= 1.1.1"
                   , "git-annex"
                   , "happy >=1.19.12"
                   , "hledger", "hledger-ui", "hledger-interest"
                   , "hlint"
                   , "ghcid"
                   , "pandoc >=2.9.2.1"
                   , "citeproc >=0.17"
                   , "postgresql-simple"    -- needed by emu-incident-report
                   , "SDL >=0.6.6.0"        -- Dmitriy Perlow <dap.darkness@gmail.com> needs the
                   , "SDL-image >=0.6.2.0"  -- SDL packages for games/raincat.
                   , "SDL-mixer >=0.6.3.0"
                   , "shake"
                   , "ShellCheck >=0.7.1"
                   , "weeder"
                   , "xmobar >= 0.33"
                   , "xmonad >= 0.15"
                   , "xmonad-contrib >= 0.16"
                   ]

resolveConstraints :: String
resolveConstraints = unwords ["cabal", "install", "--dry-run", "--minimize-conflict-set", constraints, flags, pkgs]
  where
    pkgs = intercalate " " (display <$> keys targetPackages)
    constraints = "--constraint=" <> intercalate " --constraint=" (show <$> environment)
    environment = display . (\(n,v) -> PackageVersionConstraint n v) <$> toList (corePackages `union` targetPackages)
    flags = unwords [ "--constraint=" <> show (unwords [unPackageName pn, flags'])
                    | pn <- keys targetPackages
                    , Just flags' <- [lookup (unPackageName pn) flagList]
                    ]
 -}

constraintList :: ConstraintSet
constraintList = [ "abstract-deque"
                 , "abstract-par"
                 , "adjunctions"
                 , "aeson"
                 , "aeson-pretty"
                 , "aeson-yaml"
                 , "alex"
                 , "algebraic-graphs"
                 , "alsa-core"
                 , "alsa-mixer"
                 , "annotated-wl-pprint"
                 , "ansi-terminal"
                 , "ansi-wl-pprint"
                 , "ap-normalize"
                 , "appar"
                 , "ascii-progress"
                 , "asn1-encoding"
                 , "asn1-parse"
                 , "asn1-types"
                 , "assoc"
                 , "async"
                 , "async-timer"
                 , "atomic-primops"
                 , "atomic-write"
                 , "attoparsec"
                 , "attoparsec-iso8601"
                 , "authenticate-oauth"
                 , "auto-update"
                 , "aws"
                 , "base-compat"
                 , "base-compat-batteries"
                 , "base-noprelude"
                 , "base-orphans"
                 , "base-prelude"
                 , "base16-bytestring"
                 , "base58-bytestring"
                 , "base64"
                 , "base64-bytestring"
                 , "base64-bytestring-type"
                 , "basement"
                 , "bech32"
                 , "bech32-th"
                 , "bencode"
                 , "bifunctors"
                 , "bimap"
                 , "binary-orphans"
                 , "bindings-DSL"
                 , "bindings-uname"
                 , "bitarray"
                 , "blaze-builder"
                 , "blaze-html"
                 , "blaze-markup"
                 , "bloomfilter"
                 , "boring"
                 , "boxes"
                 , "brick"
                 , "bsb-http-chunked"
                 , "byteable"
                 , "byteorder"
                 , "bytestring-builder"
                 , "bzlib-conduit"
                 , "c2hs"
                 , "cabal-doctest"
                 , "cabal-install"
                 , "cabal-plan"
                 , "cabal2spec"
                 , "call-stack"
                 , "canonical-json"
                 , "case-insensitive"
                 , "casing"
                 , "cassava"
                 , "cassava-megaparsec"
                 , "cborg"
                 , "cborg-json"
                 , "cereal"
                 , "charset"
                 , "cipher-aes"
                 , "citeproc"
                 , "clay"
                 , "clientsession"
                 , "clock"
                 , "cmark-gfm"
                 , "cmdargs"
                 , "code-page"
                 , "colour"
                 , "commonmark"
                 , "commonmark-extensions"
                 , "commonmark-pandoc"
                 , "comonad"
                 , "concurrency"
                 , "concurrent-output"
                 , "conduit"
                 , "conduit-combinators"
                 , "conduit-extra"
                 , "conduit-zstd"
                 , "config-ini"
                 , "connection"
                 , "constraints"
                 , "contravariant"
                 , "control-monad-free"
                 , "cookie"
                 , "cpphs"
                 , "cprng-aes"
                 , "criterion"
                 , "criterion-measurement"
                 , "crypto-api"
                 , "crypto-cipher-types"
                 , "crypto-pubkey-types"
                 , "crypto-random"
                 , "cryptohash"
                 , "cryptohash-conduit"
                 , "cryptohash-md5"
                 , "cryptohash-sha1"
                 , "cryptohash-sha256"
                 , "cryptonite"
                 , "cryptonite-conduit"
                 , "css-text"
                 , "csv"
                 , "data-clist"
                 , "data-default"
                 , "data-default-class"
                 , "data-default-instances-containers"
                 , "data-default-instances-dlist"
                 , "data-default-instances-old-locale"
                 , "data-fix"
                 , "DAV"
                 , "dbus"
                 , "dec"
                 , "Decimal"
                 , "dense-linear-algebra"
                 , "dhall"
                 , "dhall-json"
                 , "dhall-yaml"
                 , "Diff"
                 , "digest"
                 , "disk-free-space"
                 , "distribution-opensuse"
                 , "distributive"
                 , "dlist"
                 , "doclayout"
                 , "doctemplates"
                 , "dotgen"
                 , "double-conversion"
                 , "easy-file"
                 , "echo"
                 , "ed25519"
                 , "edit-distance"
                 , "either"
                 , "ekg"
                 , "ekg-core"
                 , "ekg-json"
                 , "email-validate"
                 , "emojis"
                 , "enclosed-exceptions"
                 , "entropy"
                 , "erf"
                 , "errors"
                 , "extensible-exceptions"
                 , "extra"
                 , "fail"
                 , "fast-logger"
                 , "fdo-notify"
                 , "feed"
                 , "fgl"
                 , "file-embed"
                 , "filelock"
                 , "filemanip"
                 , "filepath-bytestring"
                 , "filepattern"
                 , "filtrable"
                 , "fingertree"
                 , "fmlist"
                 , "fmt"
                 , "foldl"
                 , "formatting"
                 , "foundation"
                 , "free"
                 , "fsnotify"
                 , "generic-data"
                 , "generic-deriving"
                 , "generic-monoid"
                 , "generic-random"
                 , "generic-lens"
                 , "generic-lens-core"
                 , "ghc-bignum-orphans"
                 , "ghc-byteorder"
                 , "ghc-lib-parser == 9.0.*"   -- drop this package ASAP
                 , "ghc-lib-parser-ex"
                 , "ghc-paths"
                 , "ghcid"
                 , "git-annex"
                 , "git-lfs"
                 , "githash"
                 , "gitrev"
                 , "Glob"
                 , "gray-code"
                 , "groups"
                 , "hackage-security"
                 , "haddock-library <1.11"
                 , "half"
                 , "happy"
                 , "hashable"
                 , "hashtables"
                 , "haskell-lexer"
                 , "heaps"
                 , "hedgehog"
                 , "hedgehog-corpus"
                 , "hedgehog-quickcheck"
                 , "hi-file-parser"
                 , "hinotify"
                 , "hjsmin"
                 , "hledger"
                 , "hledger-interest"
                 , "hledger-lib"
                 , "hledger-ui"
                 , "hlint"
                 , "hostname"
                 , "hourglass"
                 , "hpack"
                 , "hs-bibutils"
                 , "hscolour"
                 , "hsemail"
                 , "hslogger"
                 , "hslua"
                 , "hslua-classes"
                 , "hslua-core"
                 , "hslua-marshalling"
                 , "hslua-module-path"
                 , "hslua-module-system"
                 , "hslua-module-text"
                 , "hslua-module-version"
                 , "hslua-objectorientation"
                 , "hslua-packaging"
                 , "hspec"
                 , "hspec-core"
                 , "hspec-discover"
                 , "hspec-expectations"
                 , "hspec-golden-aeson"
                 , "hspec-smallcheck"
                 , "HsYAML"
                 , "HsYAML-aeson"
                 , "hsyslog"
                 , "html"
                 , "HTTP"
                 , "http-api-data"
                 , "http-client"
                 , "http-client-restricted"
                 , "http-client-tls"
                 , "http-conduit"
                 , "http-date"
                 , "http-media"
                 , "http-types"
                 , "http2"
                 , "HUnit"
                 , "hxt"
                 , "hxt-charproperties"
                 , "hxt-regex-xmlschema"
                 , "hxt-unicode"
                 , "IfElse"
                 , "indexed-profunctors"
                 , "indexed-traversable"
                 , "indexed-traversable-instances"
                 , "infer-license"
                 , "integer-logarithms"
                 , "intern"
                 , "invariant"
                 , "io-streams"
                 , "io-streams-haproxy"
                 , "iproute"
                 , "ipynb"
                 , "iso8601-time"
                 , "iwlib"
                 , "jira-wiki-markup"
                 , "js-chart"
                 , "js-dgtable"
                 , "js-flot"
                 , "js-jquery"
                 , "JuicyPixels"
                 , "kan-extensions"
                 , "katip"
                 , "language-c"
                 , "language-javascript"
                 , "lens"
                 , "lens-aeson"
                 , "lens-family-core"
                 , "libmpd"
                 , "libsystemd-journal"
                 , "libxml-sax"
                 , "libyaml"
                 , "lift-type"
                 , "lifted-async"
                 , "lifted-base"
                 , "ListLike"
                 , "logict"
                 , "lua"
                 , "lucid"
                 , "lukko"
                 , "magic"
                 , "managed"
                 , "math-functions"
                 , "megaparsec"
                 , "memory"
                 , "mersenne-random-pure64"
                 , "microlens"
                 , "microlens-ghc"
                 , "microlens-mtl"
                 , "microlens-platform"
                 , "microlens-th"
                 , "microstache"
                 , "mime-mail"
                 , "mime-types"
                 , "mintty"
                 , "mmorph"
                 , "monad-control"
                 , "monad-logger"
                 , "monad-loops"
                 , "monad-par"
                 , "monad-par-extras"
                 , "MonadRandom"
                 , "mono-traversable"
                 , "moo"
                 , "mountpoints"
                 , "mtl-compat"
                 , "mustache"
                 , "mwc-random"
                 , "neat-interpolation"
                 , "netlink"
                 , "network"
                 , "network-bsd"
                 , "network-byte-order"
                 , "network-info"
                 , "network-multicast"
                 , "network-uri < 2.7.0.0 || > 2.7.0.0"
                 , "nothunks"
                 , "OddWord"
                 , "old-locale"
                 , "old-time"
                 , "Only"
                 , "OneTuple"
                 , "open-browser"
                 , "optics"
                 , "optics-core"
                 , "optics-extra"
                 , "optics-th"
                 , "optional-args"
                 , "optparse-applicative"
                 , "optparse-generic"
                 , "optparse-simple"
                 , "optparse-generic"
                 , "pandoc"
                 , "pandoc-types"
                 , "parallel"
                 , "parsec-class"
                 , "parsec-numbers"
                 , "parser-combinators"
                 , "parsers"
                 , "partial-order"
                 , "path"
                 , "path-io"
                 , "path-pieces"
                 , "pem"
                 , "persistent < 2.12.0.0 || > 2.12.0.0" -- buggy release
                 , "persistent-sqlite"
                 , "persistent-template"
                 , "pipes"
                 , "pipes-safe"
                 , "polyparse"
                 , "postgresql-libpq"
                 , "postgresql-simple"
                 , "pretty-hex"
                 , "pretty-show"
                 , "pretty-simple"
                 , "prettyprinter"
                 , "prettyprinter-ansi-terminal"
                 , "primitive"
                 , "process-extras"
                 , "profunctors"
                 , "prometheus"
                 , "protolude"
                 , "psqueues"
                 , "QuickCheck"
                 , "quickcheck-arbitrary-adt"
                 , "quickcheck-instances"
                 , "quickcheck-io"
                 , "quiet"
                 , "random"
                 , "random-shuffle"
                 , "readable"
                 , "recursion-schemes"
                 , "reducers"
                 , "refact"
                 , "reflection"
                 , "regex-applicative"
                 , "regex-applicative-text"
                 , "regex-base"
                 , "regex-compat"
                 , "regex-pcre-builtin"
                 , "regex-posix"
                 , "regex-tdfa"
                 , "repline"
                 , "resolv"
                 , "resource-pool"
                 , "resourcet"
                 , "retry"
                 , "rfc5051"
                 , "rio"
                 , "rio-orphans"
                 , "rio-prettyprint"
                 , "RSA"
                 , "safe"
                 , "safe-exceptions"
                 , "SafeSemaphore"
                 , "sandi"
                 , "scientific"
                 , "scrypt"
                 , "SDL"
                 , "SDL-image"
                 , "SDL-mixer"
                 , "securemem"
                 , "semialign"
                 , "semigroupoids"
                 , "semigroups"
                 , "serialise"
                 , "servant"
                 , "servant-client"
                 , "servant-client-core"
                 , "servant-server"
                 , "setenv"
                 , "setlocale"
                 , "SHA"
                 , "shake"
                 , "shakespeare"
                 , "ShellCheck"
                 , "shelltestrunner"
                 , "shelly"
                 , "show-combinators"
                 , "silently"
                 , "simple-sendfile"
                 , "singleton-bool"
                 , "skein"
                 , "skylighting"
                 , "skylighting-core"
                 , "smallcheck"
                 , "smtp-mail"
                 , "snap-core"
                 , "snap-server"
                 , "socks"
                 , "some"
                 , "sop-core"
                 , "split"
                 , "splitmix"
                 , "StateVar"
                 , "statistics"
                 , "statistics-linreg"
                 , "stm-chans"
                 , "store-core"
                 , "streaming"
                 , "streaming-binary"
                 , "streaming-bytestring"
                 , "streaming-commons"
                 , "strict"
                 , "strict-concurrency"
                 , "string-conv"
                 , "string-conversions"
                 , "string-qq"
                 , "syb"
                 , "system-fileio"
                 , "system-filepath"
                 , "systemd"
                 , "tabular"
                 , "tagged"
                 , "tagsoup"
                 , "tar"
                 , "tar-conduit"
                 , "tasty"
                 , "tasty-hedgehog"
                 , "tasty-hunit"
                 , "tasty-quickcheck"
                 , "tasty-rerun"
                 , "tdigest"
                 , "temporary"
                 , "terminal-size"
                 , "test-framework"
                 , "test-framework-hunit"
                 , "texmath"
                 , "text-conversions"
                 , "text-format"
                 , "text-icu"
                 , "text-manipulate"
                 , "text-metrics"
                 , "text-short"
                 , "text-zipper"
                 , "tf-random"
                 , "th-abstraction"
                 , "th-compat"
                 , "th-expand-syns"
                 , "th-lift"
                 , "th-lift-instances"
                 , "th-orphans"
                 , "th-reify-many"
                 , "th-utilities"
                 , "these"
                 , "threepenny-gui"
                 , "time-compat"
                 , "time-locale-compat"
                 , "time-manager"
                 , "time-units"
                 , "timeit"
                 , "timezone-olson"
                 , "timezone-series"
                 , "tls"
                 , "tls-session-manager"
                 , "topograph"
                 , "torrent"
                 , "transformers-base"
                 , "transformers-compat"
                 , "transformers-except"
                 , "tree-diff"
                 , "turtle"
                 , "type-equality"
                 , "typed-process"
                 , "typerep-map"
                 , "uglymemo"
                 , "unbounded-delays"
                 , "unicode-collation"
                 , "unicode-data"
                 , "unicode-transforms"
                 , "uniplate"
                 , "Unique"
                 , "unix-bytestring"
                 , "unix-compat"
                 , "unix-time"
                 , "unliftio"
                 , "unliftio-core"
                 , "unordered-containers"
                 , "uri-encode"
                 , "utf8-string"
                 , "utility-ht"
                 , "uuid"
                 , "uuid-types"
                 , "vault"
                 , "vector"
                 , "vector-algorithms"
                 , "vector-binary-instances"
                 , "vector-builder"
                 , "vector-th-unbox"
                 , "void"
                 , "vty"
                 , "wai"
                 , "wai-app-static"
                 , "wai-extra"
                 , "wai-logger"
                 , "warp"
                 , "warp-tls"
                 , "wcwidth"
                 , "websockets"
                 , "websockets-snap"
                 , "weeder"
                 , "witherable"
                 , "wizards"
                 , "wl-pprint-annotated"
                 , "wl-pprint-text"
                 , "word-wrap"
                 , "word8"
                 , "wreq"
                 , "X11"
                 , "X11-xft"
                 , "x509"
                 , "x509-store"
                 , "x509-system"
                 , "x509-validation"
                 , "xml"
                 , "xml-conduit"
                 , "xml-hamlet"
                 , "xml-types"
                 , "xmobar"
                 , "xmonad"
                 , "xmonad-contrib"
                 , "xss-sanitize"
                 , "yaml"
                 , "yesod"
                 , "yesod-core"
                 , "yesod-form"
                 , "yesod-persistent"
                 , "yesod-static"
                 , "zip"
                 , "zip-archive"
                 , "zlib"
                 , "zlib-bindings"
                 , "zstd"
                 ]

flagList :: [(String,String)]
flagList =
  [ ("cabal-plan",                     "exe")

    -- Don't build hardware-specific optimizations into the binary based on what the
    -- build machine supports or doesn't support.
  , ("cryptonite",                     "-support_aesni -support_rdrand -support_blake2_sse")

    -- Don't use the bundled sqlite3 library.
  , ("direct-sqlite",                  "systemlib")


    -- dont optimize happy with happy ( dep on same package ..)
  , ("happy",                          "-bootstrap")

    -- Build the standalone executable and prefer pcre-light, which uses the system
    -- library rather than a bundled copy.
  , ("highlighting-kate",              "executable pcre-light")

    -- Don't use the bundled sass library.
  , ("hlibsass",                       "externalLibsass")

    -- Use the bundled lua library. People expect this package to provide LUA
    -- 5.3, but we don't have that yet in openSUSE.
  , ("hslua",                          "-system-lua")

    -- Allow compilation without having Nix installed.
  , ("nix-paths",                      "allow-relative-paths")

    -- Build the standalone executable.
  , ("texmath",                        "executable")

    -- Enable almost all extensions.
  , ("xmobar",                         "all_extensions")

    -- Enable additional features
  , ("idris",                          "ffi gmp")

    -- Disable dependencies we don't have.
  , ("invertible",                     "-hlist -piso")

    -- Use the system sqlite library rather than the bundled one.
  , ("persistent-sqlite",              "systemlib")

    -- Make sure we're building with the test suite enabled.
  , ("git-annex",                      "testsuite")

    -- Compile against the system library, not the one bundled in the Haskell
    -- source tarball.
  , ("cmark",                          "pkgconfig")

    -- Fix build with modern compilers.
  , ("cassava",                        "-bytestring--lt-0_10_4")

    -- Prefer the system's library over the bundled one.
  , ("libyaml",                        "system-libyaml")

    -- Configure a production-like build environment.
  , ("stack",                          "hide-dependency-versions disable-git-info supported-build")

    -- The command-line utility pulls in other dependencies.
  , ("aeson-pretty",                   "lib-only")

    -- Build the standalone executable for skylighting.
  , ("skylighting",                    "executable")

    -- Compile against system zstd library
  , ("zstd",                           "-standalone")
  ]

readFlagAssignents :: [(String,String)] -> [(PackageName,FlagAssignment)]
readFlagAssignents xs = [ (fromJust (simpleParse name), readFlagList (words assignments)) | (name,assignments) <- xs ]

readFlagList :: [String] -> FlagAssignment
readFlagList = mkFlagAssignment . map (tagWithValue . noMinusF)
  where
    tagWithValue ('-':fname) = (mkFlagName (lowercase fname), False)
    tagWithValue fname       = (mkFlagName (lowercase fname), True)

    noMinusF :: String -> String
    noMinusF ('-':'f':_) = error "don't use '-f' in flag assignments; just use the flag's name"
    noMinusF x           = x

ghcCorePackages :: PackageSet
ghcCorePackages = [ "array-0.5.4.0"
                  , "base-4.16.0.0"
                  , "binary-0.8.8.0"
                  , "bytestring-0.11.1.0"
                  , "Cabal-3.5.0.0"
                  , "containers-0.6.4.1"
                  , "deepseq-1.4.6.0"
                  , "directory-1.3.6.1"
                  , "exceptions-0.10.4"
                  , "filepath-1.4.2.1"
                  , "ghc-9.0.0.20200925"
                  , "ghc-bignum-1.0"
                  , "ghc-boot-9.0.0.20200925"
                  , "ghc-boot-th-9.0.0.20200925"
                  , "ghc-compact-0.1.0.0"
                  , "ghc-heap-9.0.0.20200925"
                  , "ghc-prim-0.7.0"
                  , "ghci-9.0.0.20200925"
                  , "haskeline-0.8.1.0"
                  , "hpc-0.6.1.0"
                  , "integer-gmp"             -- backward compactibility record, not built anymore 
                  , "libiserv-9.0.0.20200925"
                  , "mtl-2.2.2"
                  , "parsec-3.1.14.0"
                  , "pretty-1.1.3.6"
                  , "process-1.6.11.0"
                  , "rts-1.0"
                  , "stm-2.5.0.0"
                  , "template-haskell-2.18.0.0"
                  , "terminfo-0.4.1.4"
                  , "text-1.2.4.2"
                  , "time-1.11.1.1"
                  , "transformers-0.5.6.2"
                  , "unix-2.7.2.2"
                  , "xhtml-3000.2.2.1"
                  ]

checkConsistency :: MonadFail m => PackageSetConfig -> m PackageSetConfig
checkConsistency pset@PackageSetConfig {..} = do
  let corePackagesInPackageSet = Map.keysSet packageSet `Set.intersection` Map.keysSet corePackages
  unless (Set.null corePackagesInPackageSet) $
    fail ("core packages listed in package set: " <> List.intercalate ", " (unPackageName <$> Set.toList corePackagesInPackageSet))
  pure pset