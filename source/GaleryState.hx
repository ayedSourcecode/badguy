package;

import flixel.addons.display.FlxBackdrop;
import haxe.io.Path;
import flixel.FlxSprite;
#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.system.FlxSound;
import flixel.util.FlxColor;
import lime.app.Application;
import flixel.input.keyboard.FlxKey;
import editors.MasterEditorMenu;
import Achievements;

using StringTools;

class GaleryState extends MusicBeatState
{
	var bg:FlxSprite;
	var art:Array<String> = ['0', '1', 'h'];
	var textList:Array<String> = ['hudojnic', 'ds', 'XD'];
	var curSelected:Int = 0;
	var arts:FlxSprite;
	var descText:FlxText;
	var checker:FlxBackdrop;

	override function create()
	{
		#if desktop
		DiscordClient.changePresence("In Gallery", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		checker = new FlxBackdrop(Paths.image('baller'), 0.2, 0.2, true, true);
		// checker.velocity.set(112, 110);
		checker.updateHitbox();
		checker.scrollFactor.set(0, 0);
		checker.alpha = 1;
		checker.screenCenter(X);
		checker.color = 0xff5f5f5f;
		add(checker);

		arts = new FlxSprite().loadGraphic(Paths.image('gallery/' + 'art_' + curSelected));
		arts.setGraphicSize(Std.int(arts.width * 0.88));
		arts.screenCenter();
		arts.y -= 45;
		add(arts);

		descText = new FlxText(50, 670, 1180, "", 32);
		descText.setFormat(Paths.font('strenuous bl.ttf'), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.screenCenter(X);
		descText.scrollFactor.set();
		descText.borderSize = 3.2;
		add(descText);

		if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic(Paths.music('offsetSong'), 0);
		}

		changeSelection();
		super.create();
	}

	override function update(elapsed:Float)
	{
		checker.x = 0;
		checker.y -= 0.16 / (ClientPrefs.framerate / 60);

		if (controls.UI_LEFT_P)
			changeSelection(-1);
		if (controls.UI_RIGHT_P)
			changeSelection(1);
		if (controls.BACK)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}

		descText.text = textList[curSelected];

		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		curSelected += change;
		if (curSelected < 0)
			curSelected = art.length - 1;
		if (curSelected >= art.length)
			curSelected = 0;
		trace(curSelected);
		remove(arts);

		arts = new FlxSprite().loadGraphic(Paths.image('gellery/' + 'art_' + curSelected));
		arts.setGraphicSize(Std.int(arts.width * 0.88));
		arts.screenCenter();
		arts.y -= 45;
		add(arts);

		FlxG.sound.play(Paths.sound('scrollMenu'));
	}
}
