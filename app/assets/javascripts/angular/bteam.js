// modules
angular
	.module('indexApp', ['ui.router'])

		// config
		.config(['$urlRouterProvider', '$stateProvider', function($urlRouterProvider, $stateProvider) {
			$urlRouterProvider.otherwise('/wedding');

			$stateProvider
				.state('wedding', {
					url: '/wedding',
					templateUrl: '../templates/gallery_wedding.html'
				})
				.state('children', {
					url: '/children',
					templateUrl: '../templates/gallery_children.html'
				})
		}])

		// gallery controller
		.controller('GalleryCtrl', GalleryCtrl);


// controllers
function GalleryCtrl() {
	var self = this;
	this.image_src = "http://bteamphoto.com/images/wedding/SK001.jpg"
}

function ReviewsCtrl() {
	var self = this;
	this.message = "Success!";
};