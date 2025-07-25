package data;

enum abstract SceneAssetType(String) from String to String {
    var Sprite;
    var Sound;
}

typedef SceneAsset = {
    var id:String;
    var filepath:String;
    var filetype:SceneAssetType;
}