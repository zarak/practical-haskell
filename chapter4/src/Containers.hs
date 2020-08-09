module Containers
    ( 
    ) where

import qualified Data.Map as M
import Chapter2.SimpleFunctions


data ClientKind = GovOrgKind | CompanyKind | IndividualKind

classifyClients = do
    putStrLn "testing"
