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

		// index controller (inject $state)
		.controller('IndexCtrl', ['$state', IndexCtrl])

		// wedding images controller
		.controller('GalleryCtrl', [GalleryCtrl]);


// controllers
// or inject like this: IndexCtrl.$inject = ['$state'];
function IndexCtrl($state) {
	var self = this;
	this.changeState = function (genre) {
		$state.go(genre);
	};
}

function GalleryCtrl() {
	var self = this;
	var all_images = [
		'Image_0', 
		'Image_1', 
		'Image_2', 
		'Image_3'
		];
	var total_image_count = all_images.length;
	var current_index = 0;
	
	this.current_image = all_images[current_index];

	this.next_image = function() {
		current_index++;
		if ( current_index >= total_image_count ) {	current_index = 0; };
		this.current_image = all_images[current_index];
	};

	this.prev_image = function() {
		current_index--;
		if ( current_index < 0 ) { current_index = total_image_count - 1; };
		this.current_image = all_images[current_index];
	};


};


