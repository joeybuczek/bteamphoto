// modules ==================================================================
angular
	.module('indexApp', ['ui.router'])

		// config
		.config(['$urlRouterProvider', '$stateProvider', IndexConfig])

		// index controller (inject $state)
		.controller('IndexCtrl', ['$state', IndexCtrl])

		// wedding images controller
		.controller('GalleryCtrl', ['ImageFactory', GalleryCtrl])

		// image factory
		.factory('ImageFactory', [ImageFactory]);


// module functions =========================================================

// configuration
function IndexConfig($urlRouterProvider, $stateProvider) {
	$urlRouterProvider.otherwise('/wedding');
	$stateProvider
		// wedding photography
		.state('wedding', {
			url: '/wedding',
			views: {
				'gallery': { templateUrl: '../templates/gallery_viewer.html' },
				'genre_info': { templateUrl: '../templates/wedding_info.html' },
				'about': { templateUrl: '../templates/wedding_about.html' }
			}
		})
		// children photography
		.state('children', {
			url: '/children',
			views: {
				'gallery': { templateUrl: '../templates/gallery_viewer.html' },
				'genre_info': { templateUrl: '../templates/children_info.html' },
				'about': { templateUrl: '../templates/children_about.html' }
			}
		});
};

// controllers
// or inject like this: IndexCtrl.$inject = ['$state'];
function IndexCtrl($state) {
	var self = this;
	this.changeState = function (genre) {
		$state.go(genre);
	};
}

function GalleryCtrl(ImageFactory) {
	// vars, inits
	var self = this;
	var current_index = 0;
	var genre = 'wedding';
	var image_count = ImageFactory.image_count(genre);

	// functions
	self.current_image = function(state_genre) {
		// state_genre passed in from gallery_viewer.html using value of ctrl.genre
		genre = state_genre;
		image_count = ImageFactory.image_count(genre);
		return ImageFactory.current_image(genre, current_index).imageURL;
	};

	self.next_image = function() {
		current_index++;
		if (current_index >= image_count) { current_index = 0; };
		self.current_image();
	};

	self.prev_image = function() {
		current_index--;
		if (current_index < 0) { current_index = image_count - 1; };
		self.current_image();
	};
};

function ImageFactory() {
	// vars
	var image_list = {
		wedding: [
			{imageURL: "../LaBrake-1.jpg"},
			{imageURL: "../LaBrake-2.jpg"},
			{imageURL: "../LaBrake-3.jpg"},
			{imageURL: "../LaBrake-4.jpg"}
		],
		children: [
			{imageURL: "../LaBrake-2.jpg"},
			{imageURL: "../LaBrake-3.jpg"}
		]
	};

	// return functions
	return {
		current_image: function(genre, i) {
			return image_list[genre][i];
		},
		image_count: function(genre) {
			return image_list[genre].length
		}
	};
};


