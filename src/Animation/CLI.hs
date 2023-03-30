
module Animation.CLI where

import Animation.Types
import System.Environment (getArgs)

-- CLI and Main

cli :: IO BallState
cli = do
  args <- getArgs
  return (parseArgs args)

--  to parse When a user gives an input
parseArgs :: [String] -> BallState
parseArgs args = case args of
  [frameWidth, frameHeight,posX, posY, velX, velY] ->
    BallState (Env (read frameWidth) (read frameHeight)) (Vector (read posX) (read posY)) (Vector (read velX) (read velY))
  _ -> error "Invalid arguments to Animation binary"