{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE RecordWildCards #-}
    {-# LANGUAGE ParallelListComp #-}
module Chapter2.SimpleFunctions where

import Data.Char


firstOrEmpty :: [String] -> String
firstOrEmpty lst = if not (null lst) then head lst else "empty"


(+++) :: [a] -> [a] -> [a]
lst1 +++ lst2 = if null lst1
                   then lst2
                   else (head lst1) : (tail lst1 +++ lst2)


reverse2 :: [String] -> [String]
reverse2 list = if null list
                then []
                else reverse2 (tail list) +++ [head list]


maxmin :: Ord a => [a] -> (a, a)
maxmin list = let h = head list
              in if null (tail list)
                 then (h, h)
                 else ( if h > t_max then h else t_max
                      , if h < t_min then h else t_min )
                      where t = maxmin (tail list)
                            t_max = fst t
                            t_min = snd t



-- View Patterns examples
data Client = GovOrg String 
  | Company     String Integer Person String 
  | Individual  Person Bool
  deriving Show

data Person = String String
    deriving Show

--clientName :: Client -> String
--clientName client =
    --case client of
      --GovOrg name -> name
      --Company name _ _ _ -> name
      --Individual (Person first last) 


data ClientR = GovOrgR { clientRName :: String }
             | CompanyR { clientRName :: String 
                        , companyId :: Integer 
                        , person :: PersonR 
                        , duty :: String }
             | IndividualR { person :: PersonR }
             deriving Show

data PersonR = PersonR { firstName :: String
                       , lastName :: String
                       } deriving Show


greet :: ClientR -> String
--greet IndividualR { person = PersonR { firstName = fn } } = "Hi, " ++ fn
--greet CompanyR { clientRName = c } = "Hi, " ++ c
--greet GovOrgR { } = "Welcome"
--
-- WITH NamedFieldPuns ENABLED:
greet IndividualR { person = PersonR { firstName } } = "Hi, " ++ firstName
greet CompanyR { clientRName } = "Hi, " ++ clientRName
greet GovOrgR { } = "Welcome"

greet IndividualR { person = PersonR { .. } } = "Hi, " ++ firstName ++ " " ++ lastName
greet CompanyR { .. } = "Hi, " ++ clientRName
greet GovOrgR {} = "Welcome"

nameInCapitals :: PersonR -> PersonR
nameInCapitals p@(PersonR { firstName = initial:rest }) =
    let newName = (toUpper initial):rest
        in p { firstName = newName }
nameInCapitals p@(PersonR { firstName = "" }) = p
