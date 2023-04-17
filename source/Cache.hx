#if sys
package;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.system.FlxSound;
import lime.app.Application;
#if windows
import Discord.DiscordClient;
#end
import openfl.display.BitmapData;
import openfl.utils.Assets;
import haxe.Exception;
import flixel.tweens.FlxEase;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
#if cpp
import sys.FileSystem;
import sys.io.File;
#end

using StringTools;

class Cache extends MusicBeatState
{
	public static var bitmapData:Map<String,FlxGraphic>;
	public static var bitmapData2:Map<String,FlxGraphic>;

	var bg:FlxSprite;

	var comp:FlxSprite;
	var loading:FlxSprite;
	var images = [];
	var music = [];

	var shitz:FlxText;
	var checker:FlxBackdrop;

	override function create()
	{
		FlxG.mouse.visible = false;

		FlxG.worldBounds.set(0,0);

		bitmapData = new Map<String,FlxGraphic>();
		bitmapData2 = new Map<String,FlxGraphic>();

		bg = new FlxSprite().loadGraphic(Paths.image('loading/bg'));
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);
		bg.screenCenter();

		checker = new FlxBackdrop(Paths.image('bg-bs/loading')); 
        //checker.velocity.set(112, 110); 
        checker.updateHitbox(); 
        checker.scrollFactor.set(0, 0); 
        checker.alpha = 1; 
        checker.screenCenter(X);

        add(checker);

		shitz = new FlxText(12, 630, 300, "Loading...", 12);
		shitz.scrollFactor.set();
		shitz.setFormat("VCR OSD Mono", 50, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		//add(shitz);

		comp = new FlxSprite().loadGraphic(Paths.image('loading/comp'));
		comp.antialiasing = ClientPrefs.globalAntialiasing;
		comp.x = -300;
		comp.y = 300;
		add(comp);

		loading = new FlxSprite(300, 260);
		loading.scrollFactor.set(0, 0);
		loading.frames = Paths.getSparrowAtlas('loading/loading');
		loading.setGraphicSize(Std.int(loading.width * 1));
		loading.updateHitbox();
		loading.antialiasing = ClientPrefs.globalAntialiasing;
		loading.animation.addByPrefix('idle', "loading0", 24, true);
		loading.animation.play('idle');
		add(loading);

		#if cpp
		for (i in FileSystem.readDirectory(FileSystem.absolutePath("assets/shared/images/characters")))
		{
			if (!i.endsWith(".png"))
				continue;
			images.push(i);
		}

		for (i in FileSystem.readDirectory(FileSystem.absolutePath("assets/songs")))
		{
			music.push(i);
		}
		#end

		sys.thread.Thread.create(() -> {
			cache();
		});

		super.create();
	}

	override function update(elapsed:Float)
	{
		checker.x += .5*(elapsed/(1/120));
        checker.y -= 0.16 / (ClientPrefs.framerate / 60);
	}

	function cache()
	{
		#if !linux

		for (i in images)
		{
			var replaced = i.replace(".png","");
			var data:BitmapData = BitmapData.fromFile("assets/shared/images/characters/" + i);
			var graph = FlxGraphic.fromBitmapData(data);
			graph.persist = true;
			graph.destroyOnNoUse = false;
			bitmapData.set(replaced,graph);
			trace(i);
		}



		for (i in music)
		{
			trace(i);
		}


		#end
		FlxG.switchState(new TitleState());
	}

}
#end