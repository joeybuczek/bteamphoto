// modules ==================================================================
angular
	.module('IndexApp', ['ui.router', 'ngResource'])

		// config
		.config(['$urlRouterProvider', '$stateProvider', '$resourceProvider', IndexConfig])

		// index controller (inject $state)
		.controller('IndexCtrl', ['$state', IndexCtrl])

		// wedding images controller
		.controller('GalleryCtrl', ['ImageFactory', '$state', GalleryCtrl])

		// resource factory
		.factory('ImageFactory', ['$resource', ImageFactory]);


// configuration ============================================================
function IndexConfig($urlRouterProvider, $stateProvider, $resourceProvider) {
	$resourceProvider.defaults.stripTrailingSlashes = false;
	$urlRouterProvider.otherwise('/wedding');
	$stateProvider
		// wedding photography
		.state('wedding', {
			url: '/wedding',
			views: {
				'gallery': { templateUrl: '../templates/gallery_viewer.html' },
				'genre_info': { templateUrl: '../templates/wedding_info.html' },
				'about': { templateUrl: '../templates/wedding_about.html' }
			},
			data: { genre: 'wedding' }
		})
		// children photography
		.state('children', {
			url: '/children',
			views: {
				'gallery': { templateUrl: '../templates/gallery_viewer.html' },
				'genre_info': { templateUrl: '../templates/children_info.html' },
				'about': { templateUrl: '../templates/children_about.html' }
			},
			data: { genre: 'children' }
		});
};


// controllers =============================================================
// (or inject like this: IndexCtrl.$inject = ['$state']; <-- put on line above controller definition)
function IndexCtrl($state) {
	// template: index.html.erb
	// vars
	var self = this;

	// functions
	self.changeState = function (genre) {
		$state.go(genre);
	};
}

function GalleryCtrl(ImageFactory, $state) {
	// template: gallery_viewer.html
	// vars, inits
	var self = this;
	var current_index = 0;
	var genre = $state.current.data.genre;
	
	self.images = [];
	getImages(genre, current_index);

	// functions 
	function getImages(arg_genre, iIndex) {
		ImageFactory.query({ genre: arg_genre }, function(data) {
			// get images and count based on arg of current state's data.genre
			self.images = data.images;
			self.image_count = data.images.length;
			self.current_image = data.images[iIndex];
		})
	};

	self.next_image = function() {
		current_index++;
		if (current_index >= self.image_count) { current_index = 0; };
		self.current_image = self.images[current_index];
	};

	self.prev_image = function() {
		current_index--;
		if (current_index < 0) { current_index = self.image_count - 1; };
		self.current_image = self.images[current_index];
	};
};


// factories =============================================================
function ImageFactory($resource) {
	var images = $resource('/gallery_images/:genre', { genre: '@genre' }, { 'query': { method: 'GET', isArray: false } });

	return images;
};


