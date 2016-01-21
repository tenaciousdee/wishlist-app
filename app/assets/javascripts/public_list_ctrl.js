/* global angular */
(function() {
  angular.module("app").controller("publicListCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get(window.location.pathname + '.json').then(function(response) {
        console.log(response.data);
        $scope.publicList = response.data;
        $scope.publicProducts = response.data.products;
        $scope.myLists = response.data.myLists;
        console.log($scope.myLists);
      });

      $scope.showSelectValue = function(listSelect) {
        $scope.listSelect = listSelect;
        console.log($scope.listSelect);
      };

      $scope.addProduct = function(inputProduct, inputList) {
        inputList = $scope.listSelect;
        console.log(inputProduct);
        $http.post('/public', {product_id: inputProduct.id, list_id: inputList}).then(function(response) {
          console.log(response.data);
        });
      };

      window.$scope = $scope;
    };
  });
})();