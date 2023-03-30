
module Animation.State where

import Animation.Types
import Control.Monad.State

-- Uses State Monad, get takes the current state of the ball and put gives the value of the new state of the ball
transition :: State BallState ()
transition = do
   BallState env vector1 vector2 <- get
   let newVector = addVector vector1 vector2
       newPos = case bounceResult' env newVector of
                Nothing -> newVector
                Just U -> mapY (\y -> 2 * frameHeightEnv env - y) newVector
                Just D -> mapY (* (-1)) newVector -- equivalent to 2 * 0 - y
                Just R -> mapX (\x -> 2 * frameWidthEnv env - x) newVector
                Just L -> mapX (* (-1)) newVector
       newVel = case bounceResult' env newVector of
                 Nothing -> vector2
                 Just U -> mapY (* (-1)) vector2
                 Just D -> mapY (* (-1)) vector2
                 Just L -> mapX (* (-1)) vector2
                 Just R -> mapX (* (-1)) vector2
   put (BallState env newPos newVel)
   return ()

bounceResult' :: Env -> Vector -> Maybe Edge
bounceResult' (Env frameWidth frameHeight) newVec
      | vectorY newVec >= frameHeight = Just U
      | vectorY newVec <= 0 = Just D
      | vectorX newVec >= frameWidth = Just R
      | vectorX newVec <= 0 = Just L
      | otherwise = Nothing
