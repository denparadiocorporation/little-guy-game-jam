package;

import dialogue.data.Branches;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import haxe.Json;
import managers.SceneManager;
import openfl.Assets;

class PlayState extends FlxState
{
	public var bg:FlxSprite;
	public var sprites:FlxTypedGroup<FlxSprite>;
	public var dialogue:Branches;

	override public function create()
	{
		SceneManager.setScene(cast Json.parse(Assets.getText('assets/data/test/test_scene.json')));
		trace(SceneManager.curScene);
		SceneManager.loadScene(this);
		trace(dialogue);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
