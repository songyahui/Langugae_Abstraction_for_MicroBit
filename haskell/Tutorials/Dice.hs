
{--
input.onGesture(Gesture.Shake, function () {
    basic.showNumber(Math.randomRange(0, 10))
})
basic.forever(function () {
	
})
--}

import MicroBit

type Model = Int

data Msg = None | GetRandomNum

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        None -> model 
        GetRandomNum -> randomRange 0 10 

view :: Model -> MicroBit Msg
view model = 
    gesture (onShake GetRandomNum) [leds None (fromInt model)]
    