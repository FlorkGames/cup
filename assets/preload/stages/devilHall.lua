function onCreate()
    makeAnimatedLuaSprite('dodgebutton', 'Notmobilegameanymore',  -30, 300);
	setProperty('dodgebutton.scale.x', 0.4)
	setProperty('dodgebutton.scale.y', 0.4)
	setObjectCamera('dodgebutton', 'hud')
	addAnimationByPrefix('dodgebutton', 'dodge', 'Dodge instance 1', 24, false);
	addAnimationByPrefix('dodgebutton', 'dodgeclick', 'Dodge click instance 1', 24, false);
	addLuaSprite('dodgebutton', true)

	makeAnimatedLuaSprite('attackbutton', 'Notmobilegameanymore',  -30, getProperty('dodgebutton.y') - 50);
	setProperty('attackbutton.scale.x', 0.4)
	setProperty('attackbutton.scale.y', 0.4)
	setObjectCamera('attackbutton', 'hud')
	addAnimationByPrefix('attackbutton', 'attack', 'Attack instance 1', 24, false);
	addAnimationByPrefix('attackbutton', 'attackclick', 'Attack Click instance 1', 24, false);
	objectPlayAnimation('attackbutton', 'attack')
	addLuaSprite('attackbutton', true)

	setProperty('attackbutton.alpha', 0.5)
	setProperty('dodgebutton.alpha', 0.5)


    makeLuaSprite('bg', 'devil/nightmarecupbg', -900, 0)
    setProperty('bg.scale.x', 2.4)
    setProperty('bg.scale.y', 2.4)
    addLuaSprite('bg', false)

    if songName == 'Devils-Gambit-Nm' then
        makeLuaSprite('r', 'devil/NMClightBF', -100, 300)
        setProperty('r.scale.x', 0.8)
        setProperty('r.scale.y', 0.8)
        addLuaSprite('r', false)
    end

    makeAnimatedLuaSprite('g', 'devil/NMClight', getProperty('dad.x'), getProperty('dad.y'))
    setProperty('g.offset.x', 1100)
    setProperty('g.offset.y', -400)
    addAnimationByPrefix('g', 'g', 'rgrrr', 24, true)
    addLuaSprite('g', false)

    makeAnimatedLuaSprite('oldshit', 'cup/CUpheqdshid', 0, 0)
    addAnimationByPrefix('oldshit', 'oldshit', 'Cupheadshit_gif', 24, true)
    setScrollFactor('oldshit', 0, 0)
    setObjectCamera('oldshit', 'other')
    setProperty('oldshit.alpha', 0.6)
    addLuaSprite('oldshit', true)

    makeAnimatedLuaSprite('stt', 'Grainshit', 0, 0)
    addAnimationByPrefix('stt', 'stt', 'Geain', 24, true)
    screenCenter('stt')
    setScrollFactor('stt', 0, 0)
    setObjectCamera('stt', 'other')
    setProperty('stt.alpha', 0.6)
    addLuaSprite('stt', true)

    makeLuaSprite('shader', 'empty', -305, 15)
    makeGraphic('shader', 300, 100, '000000')
    setProperty('shader.scale.x', 100)
    setProperty('shader.scale.y', 100)
    setProperty('shader.alpha', 0)
    setObjectCamera('shader', 'camhud')
    addLuaSprite('shader', true)
  end

function opponentNoteHit(id, noteData, noteType, isSustain)
    cameraShake('camGame', 0.01, 0.1)
    cameraShake('camHUD', 0.01, 0.1)
    cameraShake('camOther', 0.01, 0.1)
end

function onUpdate()

    if songName == 'Devils-Gambit-Nm' then
        setProperty('iconP1.alpha', 0)
    end
    if getProperty('shader.alpha') == 0 then
        doTweenAlpha('loop', 'shader', 0.5, 5, 'quadInOut')
    end

    if getProperty('shader.alpha') == 0.5 then
        doTweenAlpha('loop', 'shader', 0, 5, 'quadInOut')
    end
end

function onUpdatePost()
    if getProperty('attackbutton.animation.curAnim.name') == 'attackclick' then
        if getProperty('attackbutton.animation.curAnim.finished') then
        objectPlayAnimation('attackbutton', 'attack')
        end
    end

    if getProperty('dodgebutton.animation.curAnim.name') == 'dodgeclick' then
        if getProperty('dodgebutton.animation.curAnim.finished') then
        objectPlayAnimation('dodgebutton', 'dodge')
        end
    end
end

function onCreatePost()
    makeLuaSprite('cupbar', 'healthbars/cuphealthbar', getProperty('healthBar.x')-20 ,getProperty('healthBar.y')-20)
	setObjectCamera('cupbar', 'hud')
    setScrollFactor('cupbar', 0, 0)
	addLuaSprite('cupbar', true)
    setProperty('healthBar.scale.y', 2.4)
    setObjectCamera('iconP1', 'other')
    setObjectCamera('iconP2', 'other')
    setObjectOrder('iconP1', 95)
    setObjectOrder('iconP2', 94)
    setObjectOrder('healthBarBG', 19)
    setObjectOrder('healthBar', 20)
	setObjectOrder('cupbar', 21)
end