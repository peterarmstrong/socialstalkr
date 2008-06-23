﻿package twitter.api.data{
  import mx.collections.ArrayCollection;
  	/**		* Object that contains information about a Twitter user		*/	[Bindable]	public class TwitterUser {		/**		* ID of the Twitter user		*/		public var id:Number;		/**		* String containing the name of the Twitter status 		*/		public var name:String;		/**		* String containing the name of the Twitter user		*/		public var screenName:String;		/**		* String containing the geographic location of the Twitter user		*/		public var location:String;		/**		* String containing a description of the Twitter user		*/		public var description:String;		/**		* String containing the URL to the Twitter user's profile image		*/		public var profileImageUrl:String;		/**		* String containing the URL to the Twitter user's home page, blog, etc.		*/		public var url:String;				/**		 * The user's latest status		 */		public var status:TwitterStatus;			public var tweets:ArrayCollection = new ArrayCollection();				public function TwitterUser(user:Object = null) {
		  if (user == null) return;			id = user.id;			name = user.name;			screenName = user.screen_name;			location = user.location;			description = user.description;			profileImageUrl = user.profile_image_url;			url = user.url;			if (user.status.text) {				this.status = new TwitterStatus(user.status,this);			}		}		//		public function get id():Number { return ID; }//		public function get url():String { return URL; }		public function get screen_name():String {
      return screenName;
    }		public function get profile_image_url():String {
		  return profileImageUrl;
		}	}}