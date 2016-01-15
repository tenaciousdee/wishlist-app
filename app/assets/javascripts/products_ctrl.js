/* global angular */
(function() {
  angular.module("app").controller("productsCtrl", function($scope, $http) {
    $scope.setup = function() {
      console.log(window.location.pathname);
      $http.get(window.location.pathname + '.json').then(function(response) {
        $scope.list = response.data;
        $scope.products = response.data.products;
      });

      $scope.deleteProduct = function(inputProduct) {
        console.log(inputProduct.id);
        $http.delete('/products_api/' + inputProduct.id).then(function(response) {
          console.log(response);
          var index = $scope.products.indexOf(inputProduct);
          $scope.products.splice(index, 1);
        });
      };

      window.$scope = $scope;
    };
  });
})();