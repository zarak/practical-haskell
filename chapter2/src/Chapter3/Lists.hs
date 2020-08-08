{-# LANGUAGE TransformListComp #-}
{-# LANGUAGE ParallelListComp #-}
module Chapter3.Lists
    ( 
    ) where
        
import GHC.Exts

data InfNumber a = MinusInfinity
                 | Number a
                 | PlusInfinity
                 deriving Show

infMax MinusInfinity x = x
infMax x MinusInfinity = x
infMax PlusInfinity _ = PlusInfinity
infMax _ PlusInfinity = PlusInfinity
infMax (Number a) (Number b) = Number (max a b)

withPositions :: [a] -> [(Int, a)]
withPositions = zip [1..]

listComp :: Num a => [a]
listComp = [x*y | x <- [-1, 1, -2], y <- [1, 2, 3], then reverse]

exts = [x*y | x <- [-1, 0, 1, -2], y <- [1,2,3], then sortWith by x]

grouped = [ (the p, m) | x <- [-1, 1, -2]
           , y <- [1, 2, 3]
           , let m = x * y
           , let p = m > 0
           , then group by p using groupWith ]

parallelComp = [ x*y | x <- [1..3] | y <- [1..3] ]
