// modules ==================================================================
angular
	.module('IndexApp', ['ui.router', 'ngResource'])

		// config
		.config(['$urlRouterProvider', '$stateProvider', '$resourceProvider', IndexConfig])

		// index controller (inject $state)
		.controller('IndexCtrl', ['$state', IndexCtrl])

		// add images controller
		.controller('AddImageCtrl', ['AddImageFactory', AddImageCtrl])

		// reviews controller
		.controller('ReviewsCtrl', ['ReviewsFactory', '$state', ReviewsCtrl])

		// reviews factory
		.factory('ReviewsFactory', ['$resource', ReviewsFactory])

		// resource query factory
		.factory('ImageFactory', ['$resource', ImageFactory])

		// resource image adding factory
		.factory('AddImageFactory', ['$resource', AddImageFactory])

		// email address directive
		.directive('emailAddress', [EmailAddress])

		// phone number directive
		.directive('phoneNumber', [PhoneNumber])

		// image gallery directive
		.directive('imageGallery', ['ImageFactory', ImageGallery])

		// reviews directive
		.directive('clientReviews', ['ReviewsFactory', ClientReviews]);


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
				'about': { templateUrl: '../templates/wedding_about.html' },
				'review': { templateUrl: '../templates/reviews.html' }
			},
			data: { genre: 'wedding' }
		})
		// children photography
		.state('children', {
			url: '/children',
			views: {
				'gallery': { template: '<image-gallery genre="ctrl.genre"></image-gallery>' },
				'genre_info': { templateUrl: '../templates/children_info.html' },
				'about': { templateUrl: '../templates/children_about.html' },
				'review': { templateUrl: '../templates/reviews.html' }
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
};

function AddImageCtrl(AddImageFactory) {
	// vars
	var self = this;

	// use inputs in view to generate genre and name arguments
	self.add_image = function(name, genre) {
		var new_image = AddImageFactory.get({ name: name, genre: genre });
	};
};

function ReviewsCtrl(ReviewsFactory, $state) {
	// to be used in conjunction with <client-reviews> directive
	// vars
	var self = this;
	self.random_reviews = [];
	self.index_array = [];
	self.genre = $state.current.data.genre;

	// functions
	self.randNum = function(max) {
		return Math.floor( Math.random() * max + 1 ) - 1;
	};

	self.create_index_array = function(max) {
		// create array of two random index numbers
		var a, b;
		a = self.randNum(max);
		do { b = self.randNum(max);	} while(b == a);
		self.index_array = [a, b];
	}
	
	self.get_reviews = function() {
		ReviewsFactory.query({genre: self.genre}, function(data) {
			// check to see how many reviews exist for current genre
			if (data.reviews.length > 1) {
				// create random index numbers array using max review array length
				self.create_index_array(data.reviews.length);
				// assign two random reviews
				self.random_reviews.push(data.reviews[ self.index_array[0] ]);
				self.random_reviews.push(data.reviews[ self.index_array[1] ]);
			} else {
				// not enough reviews, show some defaults from past clients
				self.random_reviews = [
					"We are thrilled with our photographs! Thank you so much!",
					"We will cherish our photographs forever!"
				];
			}
		});
	};

	// inits
	self.get_reviews();
};


// factories =============================================================
function ImageFactory($resource) {
	var images = $resource('/gallery_images/:genre', { genre: '@genre' }, { 'query': { method: 'GET', isArray: false } });
	return images;
};

function AddImageFactory($resource) {
	return $resource('/add_image/:genre');
};

function ReviewsFactory($resource) {
	var reviews = $resource('/get_reviews/:genre', { genre: '@genre'}, { 'query': { method: 'GET', isArray: false } });
	return reviews;
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

function ClientReviews(ReviewsFactory) {
	return {
		restrict: 'E',
		scope: { review1: '@', review2: '@' },
		template: '<div class="review-wrapper"><p><i>"{{review1}}"</i></p></div>' +
							'<div class="review-wrapper"><p><i>"{{review2}}"</i></p></div>'
	};
};
