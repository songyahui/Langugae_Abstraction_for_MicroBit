{--
input.onButtonPressed(Button.A, function () {
    radio.setGroup(1)
    radio.sendString("Yo")
})
radio.onReceivedString(function (receivedString) {
    radio.setGroup(1)
    basic.showString(receivedString)
})
basic.forever(function () {
	
})
--}
import MicroBit

data Model = Model {message :: String}

inite :: Model
inite = Model ""

data Msg = ReceivedString String | None

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        ReceivedString str -> model <^> [message@> str]
 
view :: Model -> MicroBit
view model = 
    microbit [
        buttonA [onPressed None] [
            setGroup 1, 
            sendString "Yo"
            ],
        radio [onReceivedString ReceivedString] [
            setGroup 1, 
            showstring (model # message)
            ]
    ]

main = ivu_FrameWork inite view update

 





