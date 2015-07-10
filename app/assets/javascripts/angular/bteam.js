// modules
angular
	.module('indexApp', ['ui.router'])

		// config
		.config(['$urlRouterProvider', '$stateProvider', function($urlRouterProvider, $stateProvider) {

			$urlRouterProvider.otherwise('/wedding');

			$stateProvider

				// wedding photography
				.state('wedding', {
					url: '/wedding',
					views: {
						'gallery': { templateUrl: '../templates/gallery_wedding.html' },
						'genre_info': { templateUrl: '../templates/wedding_info.html' },
						'about': { templateUrl: '../templates/wedding_about.html' }
					}
				})

				// children photography
				.state('children', {
					url: '/children',
					views: {
						'gallery': { templateUrl: '../templates/gallery_children.html' },
						'genre_info': { templateUrl: '../templates/children_info.html' },
						'about': { templateUrl: '../templates/children_about.html' }
					}
				})
				
		}])

		// gallery controller
		.controller('IndexCtrl', IndexCtrl);


// controllers
function IndexCtrl() {
	var self = this;
	this.image_src = "http://bteamphoto.com/images/wedding/SK001.jpg"
}

function ReviewsCtrl() {
	var self = this;
	this.message = "Success!";
};