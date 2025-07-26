package data;

import dialogue.data.Branches;

typedef Scene = {
	var id:String;
	var dialogue:String;
    var startBranch:String;
    var startBG:String;
    var startBGM:String;
	var startAssets:Array<SceneAsset>;
}