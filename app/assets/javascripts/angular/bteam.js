// modules ==================================================================
angular
	.module('indexApp', ['ui.router', 'ngResource'])

		// config
		.config(['$urlRouterProvider', '$stateProvider', '$resourceProvider', IndexConfig])

		// index controller (inject $state)
		.controller('IndexCtrl', ['$state', IndexCtrl])

		// wedding images controller
		.controller('GalleryCtrl', ['ResourceFactory', '$state', GalleryCtrl])

		// resource factory
		.factory('ResourceFactory', ['$resource', ResourceFactory]);


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
// ( or inject like this: IndexCtrl.$inject = ['$state']; <-- put on line above controller definition)
function IndexCtrl($state) {
	// template: index.html.erb
	// vars
	var self = this;

	// functions
	this.changeState = function (genre) {
		$state.go(genre);
	};
}

function GalleryCtrl(ResourceFactory, $state) {
	// template: gallery_viewer.html
	// vars, inits
	var self = this;
	var current_index = 0;
	var genre = $state.current.data.genre;

	getResources(genre, current_index);

	// functions 
	function getResources(arg_genre, iIndex) {
		ResourceFactory.all_genres(arg_genre).query(function(data) {
			// get images and count based on arg of current state's data.genre
			self.image_count = data.images.length;
			self.current_image = data.images[iIndex];
		})
	};

	self.next_image = function() {
		current_index++;
		if (current_index >= self.image_count) { current_index = 0; };
		getResources(genre, current_index);
	};

	self.prev_image = function() {
		current_index--;
		if (current_index < 0) { current_index = self.image_count - 1; };
		getResources(genre, current_index);
	};
};


// factories =============================================================
function ResourceFactory($resource) {
	return { 
		all_genres: function(genre) {
			return $resource('/gallery_images/:genre', {'genre': genre}, { 'query': { method: 'GET', isArray: false } }) || ""; 
		}
	};
};


