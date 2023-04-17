package;

import flixel.addons.display.FlxBackdrop;
#if DISCORD
import Discord.DiscordClient;
#end
import editors.ChartingState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import lime.utils.Assets;
import flixel.system.FlxSound;
import openfl.utils.Assets as OpenFlAssets;
import WeekData;
#if MODS_ALLOWED
import sys.FileSystem;
#end

using StringTools;

class Test extends MusicBeatState
{
	override function create()
	{
		PlayState.isStoryMode = false;
	}

	override function update(elapsed:Float)
	{
		PlayState.SONG = Song.loadFromJson('Gallery', 'Gallery');
		PlayState.isStoryMode = false;
		PlayState.storyDifficulty = 1;
		LoadingState.loadAndSwitchState(new PlayState());
	}
}
