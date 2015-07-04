// modules
angular
	.module('reviewsApp', ['ui.router'])

		// config
		.config(['$urlRouterProvider','$stateProvider', function($urlRouterProvider, $stateProvider) {
			$urlRouterProvider.otherwise('/');
			$stateProvider
				.state('home', {
					url: '/home',
					templateUrl: "../templates/home.html"		
				})
				.state('reviews', {
					url: '/reviews',
					templateUrl: "../templates/reviews.html"
				})
		}])

		// controller references
		.controller('ReviewsCtrl', ReviewsCtrl);

// controllers
function ReviewsCtrl() {
	var self = this;
	this.message = "Success!";
};