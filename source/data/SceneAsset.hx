package data;

enum abstract SceneAssetType(String) from String to String {
	var Sprite = "sprite";
	var Sound = "sound";
}

typedef SceneAsset = {
    var id:String;
	var params:Array<Dynamic>;
    var filepath:String;
    var filetype:SceneAssetType;
}