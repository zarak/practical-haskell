module Chapter2.DefaultValues (
) where

data ConnType = TCP | UDP
data UseProxy = NoProxy | Proxy String
data TimeOut = NoTimeOut | TimeOut Integer

data Connection = DummyConnection deriving Show

connect :: String -> ConnType -> Integer -> UseProxy 
        -> Bool -> Bool -> TimeOut -> Connection 
connect = undefined


data ConnOptions = ConnOptions { connType :: ConnType
                               , connSpeed :: Integer
                               , connProxy :: UseProxy
                               , connCaching :: Bool
                               , connKeepAlive :: Bool
                               , connTimeout :: TimeOut
                               }
connect' :: String -> ConnOptions -> Connection
connect' url options = undefined

connDefault :: ConnOptions
connDefault = ConnOptions TCP 0 NoProxy False False NoTimeOut

