package managers;

import data.Scene;
import dialogue.parsers.TextParser;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.sound.FlxSound;
import openfl.Assets;

class SceneManager
{
	public static var curScene:Scene;

	public static inline function setScene(scene:Scene)
	{
		curScene = scene;
	}

	public static function loadScene(state:PlayState)
	{
        if (!state.members.contains(state.bg)) {
            state.bg = new FlxSprite('assets/images/${curScene.startBG}');
            state.add(state.bg);
        } else {
            state.bg.loadGraphic('assets/images/${curScene.startBG}');
        }
        if (!state.members.contains(state.sprites)) {
            state.sprites = new FlxTypedGroup<FlxSprite>();
            state.add(state.sprites);
        } else {
            for (s in state.sprites.members) {
                s.kill();
                s.destroy();
            }
            state.sprites.clear();
        }
        if (curScene.startBGM != "none")
		    FlxG.sound.playMusic('assets/music/${curScene.startBGM}');
		for (i in 0...curScene.startAssets.length)
		{
			var asset = curScene.startAssets[i];
			switch (asset.filetype)
			{
				case Sprite:
					var sprite = new FlxSprite(asset.params[0], asset.params[1], 'assets/images/${asset.filepath}');
					state.sprites.add(sprite);
				case Sound:
					var sound = new FlxSound().loadEmbedded('assets/sounds/${asset.filepath}');
					sound.play();
			}
		}

		trace(Assets.getText('assets/data/${curScene.dialogue}'));
		state.dialogue = TextParser.read(Assets.getText('assets/data/${curScene.dialogue}'));
	}
}