package data;

import dialogue.data.Branches;

typedef Scene = {
    var dialogue:Branches;
    var startBranch:String;
    var startBG:String;
    var startBGM:String;
    var initAssets:Array<SceneAsset>;
}