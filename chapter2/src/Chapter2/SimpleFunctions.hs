module Chapter2.SimpleFunctions where


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

clientName :: Client -> String
clientName client =
    case client of
      GovOrg name -> name
      Company name _ _ _ -> name
      Individual (Person first last) 

