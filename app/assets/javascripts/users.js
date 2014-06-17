var vegasApp = angular.module('vegas-app', ['ngResource']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

vegasApp.factory('User', ['$resource', function($resource) {
  return $resource('/users/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
}]);

vegasApp.controller('VegasCtrl', ['$scope','User', function($scope, User) {
  $scope.users= [];

  $scope.newUser = new User();

  User.query(function(users) {
    $scope.users = users;
  });

  $scope.saveUser = function () {
  	console.log($scope.newUser.name)
  	$scope.newUser.$save()
      $scope.newUser.$save(function(user) {
        $scope.users.push(user)
        $scope.newUser = new User();
      });
    }

}]);