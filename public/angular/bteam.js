// modules ==================================================================
angular
	.module('IndexApp', ['ui.router', 'ngResource'])

		// config
		.config(['$urlRouterProvider', '$stateProvider', '$resourceProvider', IndexConfig])

		// index controller (inject $state)
		.controller('IndexCtrl', ['$state', IndexCtrl])

		// resource factory
		.factory('ImageFactory', ['$resource', ImageFactory])

		// email address directive
		.directive('emailAddress', [EmailAddress])

		// phone number directive
		.directive('phoneNumber', [PhoneNumber])

		// image gallery directive
		.directive('imageGallery', ['ImageFactory', ImageGallery]);


// configuration ============================================================
function IndexConfig($urlRouterProvider, $stateProvider, $resourceProvider) {
	$resourceProvider.defaults.stripTrailingSlashes = false;
	$urlRouterProvider.otherwise('/wedding');
	$stateProvider
		// wedding photography
		.state('wedding', {
			url: '/wedding',
			views: {
				'gallery': { template: '<image-gallery genre="ctrl.genre"></image-gallery>' },
				'genre_info': { templateUrl: '../templates/wedding_info.html' },
				'about': { templateUrl: '../templates/wedding_about.html' }
			},
			data: { genre: 'wedding' }
		})
		// children photography
		.state('children', {
			url: '/children',
			views: {
				'gallery': { template: '<image-gallery genre="ctrl.genre"></image-gallery>' },
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


// factories =============================================================
function ImageFactory($resource) {
	var images = $resource('/gallery_images/:genre', { genre: '@genre' }, { 'query': { method: 'GET', isArray: false } });

	return images;
};


// directives ============================================================
function EmailAddress() {
	return {
		restrict: 'E',
		scope: { emailAddy: '@addy', subject: '@' },
		template: '<a href="mailto:{{emailAddy}}?subject={{subject}}">{{emailAddy}}</a>'
	};
};

function PhoneNumber() {
	return {
		restrict: 'E',
		scope: { phoneNumber: '@phone', display: '@' },
		template: '<a href="tel://{{phoneNumber}}">{{display}}</a>'
	};
};

function ImageGallery(ImageFactory) {
	return {
		restrict: 'E',
		scope: { 
			genre: "="
		},
		template: '<div id="gallery-directive">' +
							'<div ng-click="prev_image()" class="prev-image left"><span class="arrow-icon">&larr;</span></div>' +
							'<div ng-click="next_image()" class="next-image right"><span class="arrow-icon">&rarr;</span></div>' +
							'<img src="{{ current_image }}" class="gallery-image">' +
							'</div>',
		link: function($scope, $element, $attrs) {

			// vars
			var iGallery = $scope;
			var current_index = 0;
			iGallery.images = [];

			// functions
			iGallery.next_image = function() { 
				current_index++;
				if (current_index >= iGallery.image_count) { current_index = 0; };
				iGallery.current_image = iGallery.images[current_index];
			};
			iGallery.prev_image = function() {
				current_index--;
				if (current_index < 0) { current_index = iGallery.image_count - 1; };
				iGallery.current_image = iGallery.images[current_index];
			};
			iGallery.get_images = function() {
				ImageFactory.query({genre: iGallery.genre}, function(data) { 
					iGallery.images = data.images;
					iGallery.image_count = data.images.length;
					iGallery.current_image = data.images[current_index]; 
				})
			};

			// inits
			iGallery.get_images();

		}
	};
};


