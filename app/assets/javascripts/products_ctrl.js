/* global angular */
(function() {
  angular.module("app").controller("productsCtrl", function($scope, $http) {
    $scope.setup = function() {
      $scope.autocompleteName = function(text) {
        $http.get("/products.json?search=" + text).then(function(response) {
          console.log(response);
          $scope.autocompleteProducts = response.data;
        });
      };

      $scope.orderByAttribute = "name";
      $scope.descending = true;

      $scope.changeOrderAttribute = function(attribute) {
        $scope.orderByAttribute = attribute;
        $scope.descending = !$scope.descending;
      };

      $http.get("/products.json").then(function(response) {
        $scope.products = response.data;
      });
      $http.get("/lists.json").then(function(response) {
        $scope.lists = response.data;
      });
    };

    window.$scope = $scope;
  });
})();