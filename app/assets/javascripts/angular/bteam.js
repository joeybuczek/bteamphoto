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
	var self = this;
	var current_index = 0;
	var image_count = ImageFactory.image_count();

	self.current_image = function() {
		return ImageFactory.current_image(current_index).imageURL;
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
	var image_list = [
		{imageURL: "image_0.jpg"},
		{imageURL: "image_1.jpg"},
		{imageURL: "image_2.jpg"}
	];

	return {
		current_image: function(i) {
			return image_list[i];
		},
		image_count: function() {
			return image_list.length
		}
	};
};


