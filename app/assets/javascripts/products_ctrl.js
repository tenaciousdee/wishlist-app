/* global angular */
(function() {
  angular.module("app").controller("productsCtrl", function($scope, $http) {
    $scope.setup = function() {
      console.log(window.location.pathname);
      $http.get(window.location.pathname + '.json').then(function(response) {
        $scope.list = response.data;
        $scope.products = response.data.products;
        var lastProduct = $scope.products[$scope.products.length - 1];
        $http.post('/search.json', {input_search: lastProduct.retailer}).then(function(response) {
          console.log('search results: ', response.data);
          $scope.similarByRetailer = response.data;
          $scope.quantity = 10;
        });
        $scope.productCategories = response.data.product_categories;
      });

      $scope.changeFilterCategory = function(inputProductCategory) {
        $scope.filterCategory = inputProductCategory;
        $scope.filterAll = '';
      };

      $scope.addProduct = function(inputSimilar) {
        console.log(inputSimilar.id);
        $http.post('/products_api/', {
          product_id: inputSimilar.id,
          list_id: $scope.list.id
        }).then(function(response) {
          console.log(response);
          $scope.products.push(response.data);
        });
      };


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