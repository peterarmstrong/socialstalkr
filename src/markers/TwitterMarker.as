package markers {
  import com.yahoo.maps.api.markers.Marker;
  
  import flash.display.Loader;
  import flash.display.Shape;
  import flash.events.Event;
  import flash.net.URLRequest;
  import flash.system.LoaderContext;
  import flash.text.TextField;
  import flash.text.TextFormat;

  public class TwitterMarker extends Marker {
    private var shape:Shape;
    private var loader:Loader;
    private var url:String;
    private var textField:TextField;
    private var text:String;

    public function TwitterMarker(url:String, text:String) {
      super();
      this.url = url;
      this.text = text;
      
      init();
    }
    
    private function init():void {      
      shape = new Shape();
      shape.graphics.lineStyle(1,0x666666);
      shape.graphics.beginFill(0xFFFFFF,1);
      shape.graphics.drawRoundRect(5, 5, 150, 51, 0, 0);
      shape.graphics.endFill();
      addChild(shape);

      loader = new Loader;
      loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
      loader.load(new URLRequest(url), new LoaderContext(true));
      addChild(loader);
      
      textField = new TextField;
      textField.text = text;
      textField.cacheAsBitmap = true;
      textField.defaultTextFormat = new TextFormat("Arial", 11, 0x000000, true);
      textField.wordWrap = true;
      addChild(textField);
    }
    
    private function onLoadComplete(event:Event):void {
      loader.x = 7;
      loader.y = 7;
      loader.height = 48;
      loader.width = 48;
      textField.x = 57;
      textField.y = 7;
    }
  }
}