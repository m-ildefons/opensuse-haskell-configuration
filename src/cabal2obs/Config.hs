{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

module Config ( knownPackageSets, addConfigOracle ) where

import Config.Ghc810x
import Config.Ghc90x
import Config.Ghc92x
import Config.Ghc94x
import Types

import Data.Map.Strict ( Map, findWithDefault, keysSet )
import Data.Set ( Set )
import Development.Shake

type instance RuleResult PackageSetId = PackageSetConfig

addConfigOracle :: Rules (PackageSetId -> Action PackageSetConfig)
addConfigOracle = addOracle getPackageSet

packageSets :: Map PackageSetId (Action PackageSetConfig)
packageSets = [ ("ghc-8.10.x", ghc810x)
              , ("ghc-9.0.x", ghc90x)
              , ("ghc-9.2.x", ghc92x)
              , ("ghc-9.4.x", ghc94x)
              ]

knownPackageSets :: Set PackageSetId
knownPackageSets = keysSet packageSets

getPackageSet :: PackageSetId -> Action PackageSetConfig
getPackageSet psid = findWithDefault err psid packageSets
  where
    err = fail ("unknown package set " ++ show (unPackageSetId psid))
