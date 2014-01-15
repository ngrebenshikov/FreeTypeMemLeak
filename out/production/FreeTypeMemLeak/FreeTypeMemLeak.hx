package;

import flash.Lib;
import openfl.Assets;
import flash.text.TextFormat;
import flash.text.TextField;
import haxe.Timer;

/**
 * ...
 * @author ngrebenshikov
 */
class FreeTypeMemLeak {

	public static function main() {
		#if iphone
		haxe.Timer.delay(create, 10);
		#else
		create();
		#end
	}

    private static function create() {
        var test = new TextField();
        test.text = "Test";

        var format = new TextFormat();
        format.font = Assets.getFont("fonts/PTC55F.ttf");
        format.size = 50;
        test.setTextFormat(format);
        Lib.current.addChild(loading);

        var timer = new Timer("100");
        var scale = 1.0;
        var delta = 0.1;
        timer.run = function() {
            scale = scale - delta;
            if (scale <= 0) {
                scale = 0.0;
                delta *= -1;
            }

            if (scale > 1) {
                scale = 1;
                delta *= -1;
            }
            test.scaleX = scale;
            test.scaleY = scale;
        };
	}
}
