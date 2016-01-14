/* global angular */
(function() {
  angular.module("app").controller("productsCtrl", function($scope, $http) {
    $scope.setup = function() {
      console.log(window.location.pathname);
      $http.get(window.location.pathname + '.json').then(function(response) {
        console.log(response.data);
        $scope.products = response.data.products;
      });

      window.$scope = $scope;
    };
  });
})();