{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE OverloadedLists #-}

module Config.ForcedExecutables ( forcedExectableNames ) where

import MyCabal

import Data.Set ( Set )

forcedExectableNames :: Set PackageName
forcedExectableNames =
  [ "Agda"
  , "alex"
  , "apply-refact"
  , "asciidiagram"
  , "BlogLiterately"
  , "BNFC"
  , "bustle"
  , "c2hs"
  , "cab"
  , "cabal-install"
  , "cabal-plan"
  , "cabal-rpm"
  , "cabal2nix"
  , "cabal2spec"
  , "clash-ghc"
  , "codex"
  , "cpphs"
  , "cryptol"
  , "darcs"
  , "derive"
  , "dhall-json"
  , "dhall-yaml"
  , "diagrams-haddock"
  , "dixi"
  , "doctest"
  , "doctest-discover"
  , "find-clumpiness"
  , "ghc-imported-from"
  , "ghc-mod"
  , "ghcid"
  , "git-annex"
  , "gtk2hs-buildtools"
  , "hackage-mirror"
  , "hackmanager"
  , "handwriting"
  , "hapistrano"
  , "happy"
  , "HaRe"
  , "haskintex"
  , "HaXml"
  , "hdevtools"
  , "hdocs"
  , "highlighting-kate"
  , "hindent"
  , "hledger"
  , "hledger-web"
  , "hlint"
  , "holy-project"
  , "hoogle"
  , "hpack"
  , "hpc-coveralls"
  , "hscolour"
  , "hsdev"
  , "hspec-discover"
  , "hspec-setup"
  , "ide-backend"
  , "idris"
  , "keter"
  , "leksah-server"
  , "lhs2tex"
  , "liquidhaskell"
  , "markdown-unlit"
  , "microformats2-parser"
  , "misfortune"
  , "modify-fasta"
  , "msi-kb-backlit"
  , "omnifmt"
  , "osdkeys"
  , "pointfree"
  , "pointful"
  , "postgresql-schema"
  , "purescript"
  , "quickbench"
  , "shake"
  , "ShellCheck"
  , "stack"
  , "stack-run-auto"
  , "stackage-curator"
  , "stylish-cabal"
  , "stylish-haskell"
  , "texmath"
  , "titlecase"
  , "werewolf"
  , "wordpass"
  , "xmobar"
  , "xmonad"
  , "yi"
  ]
