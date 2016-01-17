/* global angular */
(function() {
  angular.module("app").controller("listCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get("lists.json").then(function(response) {
        $scope.lists = response.data;
        console.log($scope.lists);
      });
    };

    window.$scope = $scope;

  });

})();