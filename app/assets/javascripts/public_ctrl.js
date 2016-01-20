/* global angular */
(function() {
  angular.module("app").controller("publicCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get("/public.json").then(function(response) {
        $scope.publicLists = response.data;
        console.log($scope.publicLists);
      });

      window.$scope = $scope;
    };
  });

})();