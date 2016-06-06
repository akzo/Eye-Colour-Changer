local button = {}

function button.create(Label,Listener,X,Y,Width,Height)

    local widget = require("widget")
    local photoBtn = widget.newButton{
    width = Width,
    height = Height,
	left =  X,
    top = display.contentHeight - Y, --Y - display.contentCenterY,
    label = Label,
    onEvent = Listener,
    defaultFile = "Images/button.png",
    overFile = "Images/pressed_button.png",
}
end

return button