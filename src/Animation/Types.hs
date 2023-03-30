
module Animation.Types where

-- Vector Int Int represents Vector x y in a graph
data Vector = Vector Int Int
  deriving (Show)

-- This function gives only the x coordinate of a vector
vectorX :: Vector -> Int
vectorX (Vector x _) = x

-- This function gives only the y coordinate of a vector
vectorY :: Vector -> Int
vectorY (Vector _ y) = y

-- This function maps a given function to the x coordinate keeping the y coordinate unchanged
mapX :: (Int -> Int) -> Vector -> Vector
mapX f (Vector x y) = Vector (f x) y

-- This function maps a given function to the y coordinate keeping the x coordinate unchanged
mapY :: (Int -> Int) -> Vector -> Vector
mapY f (Vector x y) = Vector x (f y)

-- takes two vectors and add the respective x and y coordinates
addVector :: Vector -> Vector -> Vector
addVector (Vector x1 y1) (Vector x2 y2) = Vector (x1 + x2) (y1 + y2)

-- BallState is a type which takes the Environment ,position of the current state of the ball and velocity of the current state of the ball
data BallState = BallState Env Vector Vector
  deriving (Show)

-- Env takes frameWidth and FrameHeight as its arguments 
data Env = Env Int Int
  deriving Show

-- this gives the Width from Env
frameWidthEnv :: Env -> Int
frameWidthEnv (Env width _) = width

-- This gives the height from Env
frameHeightEnv :: Env -> Int
frameHeightEnv (Env _ height) = height

-- Edge has 4 constructors representing the position of the boundary , U- Up ,D-Down, L- Left , R- Right  
data Edge = U | D | L | R
 deriving Show
