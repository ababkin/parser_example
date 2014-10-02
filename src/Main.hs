{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Data.Text as T
import  Data.Attoparsec.Text (Parser (..), char, endOfLine,
                                       isEndOfLine, skipWhile, string, takeTill, parse, takeWhile)

import qualified Data.Attoparsec.Text as AP

main = do
  putStrLn $ show $ parse intParser "hello there"

intParser :: Parser [T.Text]
intParser = do
  firstString <- takeTill (\c -> (c==' '))
  char ' '
  secondString <- AP.take 3
  return [firstString, secondString]


