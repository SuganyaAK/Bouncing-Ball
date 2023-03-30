
module Animation.Animate (animate) where

import Animation.Types
import Animation.State
import Animation.Draw
import Control.Concurrent (threadDelay)
import Control.Monad.State


-- Animation
animate :: BallState -> IO ()
animate (BallState env pos vel)= do
  clearScreen         -- clears the screen so that the animation happens in one frame
  putStr (draw (BallState env pos vel))  -- draws the frame
  print (BallState env pos vel)          -- prints the value of the current state
  threadDelay (3 * 1000000)
  animate $ execState transition $ BallState env pos vel  -- execstate is used here to discard the computation's result as i have give () for a in State s a

-- 
clearScreen :: IO ()
clearScreen = putStr "\ESC[2J"