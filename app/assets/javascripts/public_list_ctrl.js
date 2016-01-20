/* global angular */
(function() {
  angular.module("app").controller("publicListCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get(window.location.pathname + '.json').then(function(response) {
        console.log(response.data);
        $scope.publicList = response.data;
        $scope.publicProducts = response.data.products;
      });
    };
  });
})();