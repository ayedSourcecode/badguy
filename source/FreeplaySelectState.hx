package;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;
import flixel.FlxG;

class FreeplaySelectState extends MusicBeatState
{
	public static var freeplayCats:Array<String> = ['story', 'non-story', 'covers'];
	public static var curCategory:Int = 0;

	public var NameAlpha:Alphabet;

	var grpCats:FlxTypedGroup<Alphabet>;
	var curSelected:Int = 0;
	var BG:FlxSprite;
	var categoryIcon:FlxSprite;

	override function create()
	{
		BG = new FlxSprite().loadGraphic(Paths.image('menuBGBlue'));
		BG.updateHitbox();
		BG.screenCenter();
		BG.color = 0xff5900ff;
		add(BG);
		categoryIcon = new FlxSprite().loadGraphic(Paths.image('freeplay/category/na/' + freeplayCats[curSelected].toLowerCase()));
		categoryIcon.updateHitbox();
		categoryIcon.screenCenter();
		add(categoryIcon);
		NameAlpha = new Alphabet(20, (FlxG.height / 2) - 282, freeplayCats[curSelected], true);
		NameAlpha.screenCenter(X);
		Highscore.load();
		add(NameAlpha);
		changeSelection();

		if (StoryMenuState.weekCompleted.get('2weekhell'))
		{
			freeplayCats.insert(5, "secrets");
		}

		#if mobile
		addVirtualPad(LEFT_RIGHT, A_B);
		#end

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (controls.UI_LEFT_P)
			changeSelection(-1);
		if (controls.UI_RIGHT_P)
			changeSelection(1);
		if (controls.BACK)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		if (controls.ACCEPT)
		{
			MusicBeatState.switchState(new FreeplayState());
		}

		curCategory = curSelected;

		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		curSelected += change;
		if (curSelected < 0)
			curSelected = freeplayCats.length - 1;
		if (curSelected >= freeplayCats.length)
			curSelected = 0;

		var bullShit:Int = 0;

		NameAlpha.destroy();
		NameAlpha = new Alphabet(20, (FlxG.height / 2) - 282, freeplayCats[curSelected], true);
		NameAlpha.screenCenter(X);
		add(NameAlpha);
		categoryIcon.loadGraphic(Paths.image('freeplay/category/na/' + (freeplayCats[curSelected].toLowerCase())));
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}
}
