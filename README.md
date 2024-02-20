# Bouncing-Ball

	BouncingBall is an animation project that displays a bouncing ball inside a specified frame. Frame size can be decided during the runtime.
This project uses state monads.

Representation
Walls : 
The walls of the frame are represented using '#' and 'X' and the ball is represented by 'o'.
Draw function explains the logic for this frame.

Transition of Ball : 
Next state of the ball to which it is transitioned to is being calculated in Transition function, State Monad typeclass has been used to show the state change.
Get function - gets current state of the ball
Put function - gives new state of ball after computation logic is executed.

Animation : 
Inside animation function, Walls are drawn and state of ball that is transitioned is displayed.
It clears the terminal before recreating the wall and showing the next transitioned state.

How to Execute
pre-reqs : 
This project is packaged with Cabal. Hence install cabal before trying to run the exe.

Execution : 
1. The file bouncingBall.cabal has the executable bouncingBall-exe and library.
2. Use cabal run bouncingBall-exe -- 10 10 3 2 1 2
   where 10 10 3 2 1 3 is the argument passed
   
Types.hs - This file has all the data types used in the project.
State.hs - This has the logic for the state transition of the ball.
Draw.hs  - Draws the frame and the current position of the ball.
Animate.hs - Clears the screen, draws the frame and calls animate recursively to show the animation in a single frame.
CLI.hs   - Gets the user input as arguments and parses into the type BallState.
Main.hs  - This file has the Main do block. 
   
Additional notes :
During some instances, you can see the ball is not displayed inside the frame, that is because the rendering of animation is very fast on 
Ball's state hence its not seen. I have hence added a 3 second delay to solve this problem.
