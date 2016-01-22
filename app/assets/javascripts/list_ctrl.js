/* global angular */
(function() {
  angular.module("app").controller("listCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get("lists.json").then(function(response) {
        $scope.lists = response.data;
        console.log($scope.lists);
      });
    };

    $scope.quantity = 8;

    // $scope.makePublic = function(inputList) {
    //   console.log(inputList);
    //   $http.patch('/public/' + inputList.id).then(function(response) {
    //     console.log(response.data);
    //   });
    // };

    $scope.makePublic = function(inputList) {
      console.log(inputList);
      $scope.inputList.public = !$scope.inputList.public;
    };

    window.$scope = $scope;

  });

})();