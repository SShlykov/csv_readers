{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import qualified Data.Vector as V
import qualified Data.ByteString.Lazy as BL
import Data.Csv
import GHC.Generics (Generic)

data Vals =
    Vals Int Int Int
    deriving (Generic)

instance FromRecord Vals
instance ToRecord Vals

main :: IO ()
main = do
    f <- BL.readFile "./test.csv"
    case decode NoHeader f of
        Left err -> putStrLn err
        Right (_, k, x) -> print k
