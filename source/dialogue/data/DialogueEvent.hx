package dialogue.data;

enum abstract DialogueEvents(String) from String to String {
    var CreateSprite = "spr"; // [sprite name, filepath] (Basic sprite = img filepath, advanced sprite = json filepath containing anim data, etc)
    var DeleteSprite = "delspr"; // [sprite name]
    var SetBG = "setbg"; // [filepath]
    var SetBGM = "setbgm"; // [filepath]
    var PlaySound = "snd"; // [filepath]
    var MoveSprite = "move"; // [sprite, x, y, speed, at start/end]
    var Choice = "choice"; // [text, branch]
}

typedef DialogueEvent = {
    var name:DialogueEvents; // Event type/name
    var args:Array<Dynamic>; // Event arguments
}