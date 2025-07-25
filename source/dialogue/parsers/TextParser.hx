package dialogue.parsers;

import dialogue.data.Branches;
import dialogue.data.DialogueBlock;
import dialogue.data.DialogueEvent;

using StringTools;


class TextParser {
    public static function read(data:String) {
        var branchesData = data.split('///');
        branchesData.shift(); // Get rid of empty string
        var branches:Branches = []; 
        for (b in branchesData) {
            var data = b.split('\n'); // split dialogue lines + branch line
            var branchName = data.shift(); // get branch name, and also remove branch line to only retain dialogue
            var dlgBlocks:Array<DialogueBlock> = [];
            for (d in data) {
                dlgBlocks.push(parseLine(d));
            }
            branches[branchName] = dlgBlocks;
        }
        return branches;
    }

    public static function parseLine(line:String):DialogueBlock {
        var text = line.substring(line.indexOf(':')+1, line.length-1); // text is after :
        //trace(text);
        var dlgDataStart = line.indexOf('[') + 1; // typing speed and events are between the []
        var dlgDataEnd = line.indexOf(']');
        var dlgDataSubstr = line.substring(dlgDataStart, dlgDataEnd);
        var name = line.substring(0, dlgDataStart - 1);
        trace(dlgDataSubstr);
        var dlgData = dlgDataSubstr.split('/'); // typing speed and events list split by /
        var evs:Array<DialogueEvent> = []; // ev = event
        var typingSpeed:Float = 1/26; // default typing speed ig
        for (i in 0...dlgData.length) {
            switch (i) {
                case 0: // typing speed
                    if (dlgData[0] != null && dlgData[0].length > 0)
                        typingSpeed = Std.parseFloat(dlgData[0]);
                    trace(typingSpeed);
                case 1: // events
                    var evData = dlgData[1].split(';'); // event1 params here;event2 params here
                    // trace(evData);
                    for (ev in evData) {
                        var evContents = ev.split(','); // params split by ,
                        var evName = evContents.shift(); // get event name and get rid of evName from params list 
                        evs.push(createEv(evName, evContents));
                    }
            }
        }

        return {
            name: name,
            text: text,
            typingSpeed: typingSpeed,
            events: evs
        };
    }

    private static inline function createEv(name:DialogueEvents, args:Array<Dynamic>):DialogueEvent {
        return {name: name, args: args};
    }
}