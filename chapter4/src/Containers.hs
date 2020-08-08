module Containers
    ( 
    ) where

import qualified Data.Map as M


data ClientKind = GovOrgKind | CompanyKind | IndividualKind

classifyClients 
