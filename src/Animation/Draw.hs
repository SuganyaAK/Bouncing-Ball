
module Animation.Draw where

import Animation.Types

-- Fucntion to draw a frame
draw :: BallState -> String
draw  (BallState (Env frameWidth frameHeight) position _) = unlines $ reverse $ map drawRow [-1 .. frameHeight + 1]
  where
    charAt :: Int -> Int -> Char
    charAt x y
      | (y > frameHeight || y < 0) && (x > frameWidth || x < 0) = ' '
      | y > frameHeight || y < 0 = '#'
      | x > frameWidth || x < 0 = 'X'
      | x == vectorX position && y == vectorY position = 'o'
      | otherwise = ' '
    drawRow :: Int -> String
    drawRow row = map (\col -> charAt col row) [-1 .. frameWidth + 1]
