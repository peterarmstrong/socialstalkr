package com.socialstalkr.components {
  import com.yahoo.maps.api.markers.Marker;
  
  import flash.display.Loader;
  import flash.display.Shape;
  import flash.events.Event;
  import flash.net.URLRequest;
  import flash.system.LoaderContext;
  import flash.text.TextField;
  import flash.text.TextFormat;

  public class TwitterMarker extends Marker {
    private var _shape:Shape;
    private var _loader:Loader;
    private var _url:String;
    private var _textField:TextField;
    private var _text:String;

    public function TwitterMarker(url:String, text:String) {
      super();
      _url = url;
      _text = text;
      _shape = new Shape();
      _shape.graphics.lineStyle(1,0x666666);
      _shape.graphics.beginFill(0xFFFFFF,1);
      _shape.graphics.drawRoundRect(5, 5, 150, 51, 0, 0);
      _shape.graphics.endFill();
      addChild(_shape);

      _loader = new Loader;
      _loader.contentLoaderInfo.addEventListener(Event.COMPLETE,
        onLoadComplete);
      _loader.load(new URLRequest(url), new LoaderContext(true));
      addChild(_loader);
      
      _textField = new TextField;
      _textField.text = text;
      _textField.cacheAsBitmap = true;
      _textField.defaultTextFormat =
        new TextFormat("Arial", 11, 0x000000, true);
      _textField.wordWrap = true;
      addChild(_textField);
    }
    
    private function onLoadComplete(event:Event):void {
      _loader.x = 7;
      _loader.y = 7;
      _loader.height = 48;
      _loader.width = 48;
      _textField.x = 57;
      _textField.y = 7;
    }
  }
}