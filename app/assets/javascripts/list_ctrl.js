/* global angular */
(function() {
  angular.module("app").controller("listCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get("lists.json").then(function(response) {
        $scope.lists = response.data;
        console.log($scope.lists);
      });
    };

    $scope.makePublic = function(inputList) {
      console.log(inputList);
      $http.patch('/public/' + inputList.id).then(function(response) {
        console.log(response.data);
      });
    };

    window.$scope = $scope;

  });

})();