/* global angular */
(function() {
  angular.module("app").controller("productsCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get("/products.json").then(function(response) {
        $scope.products = response.data;
      });
    };
  });

})();