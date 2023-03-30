module Main where

import Animation.CLI
import Animation.Animate

main :: IO ()
main = do
  initialState <- cli
  animate initialState
