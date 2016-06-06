-----------------------------------------------------------------------------------------
--
-- Eye colour change with hypnosis
--
-----------------------------------------------------------------------------------------

--import button module
button = require("button")

--background image
local background = display.newImage("Images/background.jpeg")

--blue eye image at the top
blue_eye = display.newImage("Images/blue_eye.jpeg")
blue_eye.x = display.contentCenterX
blue_eye.y = 40
blue_eye.width = 100
blue_eye.height = 100

--text describing the application
local descript = [[Have you ever been jealous of those people 
who have beautiful and bright eyes, which 
were endowing their holder with the 
extreme charm? If, so then you are not alone.
There a lot of people who are pissed of with 
their eye colour and this is natural for 
human nature because we always want more! 
And this application will try to give you
more by using the hypnosis. We will enter 
the deepest levels of your conscious and
programme it so that it will change your 
eye pigmentation. All required from you 
is the steadfast faith and genuine 
perseverance. You need to use this
application 5 times a day for at least 
2 months to see a visible progress. 
Believe me you deserve it ;)]]
show_descript = display.newText(descript, 170, display.contentCenterY + 20 , native.systemFontBold, 15) --we basically create an image of the text
show_descript:setFillColor(0.1, 0.9, 0.1)

 --upload and set up blue eye hypnosis image
    blue_eye_hypnosis = display.newImage("Images/blue_eye_hypnosis.jpg")
    blue_eye_hypnosis.x = display.contentCenterX
    blue_eye_hypnosis.y = 200
    blue_eye_hypnosis.width = display.contentWidth + 600
    blue_eye_hypnosis.height = display.contentHeight + 100
    blue_eye_hypnosis.alpha = 0 --set visibility to zero 

    --create instructions
    instruct = [[Stare at the blue eye in the center. 
      We will tell you when to stop]]
    show_instruct = display.newText(instruct, 170, display.contentCenterY - 40 , native.systemFontBold, 20)
    show_instruct:setFillColor(0.1, 0.9, 0.1)
    show_instruct.alpha = 0

    --create final instructions
    f_instruct = 
      [[
    Well done! Turn off the
    application and return later. 
    Don't forget - you need to do it
    5 times a day!]]
    show_f_inst = display.newText(f_instruct, 155, display.contentCenterY - 40 , native.systemFontBold, 20)
    show_f_inst:setFillColor(0.1, 0.9, 0.1)
    show_f_inst.alpha = 0

    --background music
    music = audio.loadStream( "Music/background_music.wav" )



local function startHypnosis(event)
	if (event.phase == "ended") then
  
        --change visibility of some images, this is necessary if our user is crazy and press button several times
        show_descript.alpha = 0
        blue_eye.alpha = 0
        blue_eye_hypnosis.alpha = 0
        show_instruct.alpha = 1
        show_f_inst.alpha = 0
       
        --get rid of instructions and show hypnosis
        local function instructVanish(event)
        	show_instruct.alpha = 0
        	audio.play( music )

        	--show and spin hypnosis image
        	blue_eye_hypnosis.alpha = 1 
        	local function spinImage (event) --recursive function rotating image
        		transition.to( blue_eye_hypnosis, { rotation = blue_eye_hypnosis.rotation-5, time=2000, onComplete=spinImage } )
            end
            spinImage()

        	--get rid of hypnosis and ask to return later
        	local function hypVanish(event)
        		blue_eye_hypnosis.alpha = 0  
        	    show_f_inst.alpha = 1   	
            end
            timer.performWithDelay(110000, hypVanish)
        	
        end
        timer.performWithDelay(3000, instructVanish )
    
	end
end 

button = button.create("Start Hypnosis", startHypnosis, 0, 70, display.contentWidth,100)
