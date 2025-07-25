package assets;

class Paths {
    public static inline function file(path:String, ext:String) {
        return '${path}.${ext}';
    }

    public static inline function asset(path:String, ext:String) {
        return file('assets/${path}', ext);
    }

    public static inline function image(path:String) {
        return asset('images/${path}', 'png');
    }

    public static inline function data(path:String, ext:String) {
        return asset('data/${path}', ext);
    }

    public static inline function txt(path:String) {
        return data('${path}', 'txt');
    }

    public static inline function json(path:String) {
        return data('${path}', 'json');
    }

    public static inline function xml(path:String) {
        return data('${path}', 'xml');
    }

    public static inline function music(path:String) {
        return asset('music/${path}', 'mp3');
    }

    public static inline function sound(path:String) {
        return asset('sounds/${path}', 'mp3');
    }
}