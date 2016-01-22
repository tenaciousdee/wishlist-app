/* global angular */
(function() {
  angular.module("app").controller("listCtrl", ['$scope', '$http', function($scope, $http) {
    $scope.setup = function() {
      $http.get("/lists.json").then(function(response) {
        $scope.lists = response.data;
        console.log($scope.lists);
      });
    };

    $scope.quantity = 8;

    $scope.makePublic = function(inputList) {
      console.log(inputList);
      $http.patch('/public/' + inputList.id).then(function(response) {
        console.log(response.data);
        inputList.public = !inputList.public;
      });
    };

    $scope.deleteList = function(inputList) {
      console.log(inputList.id);
      $http.delete('/lists/' + inputList.id).then(function(response) {
        console.log(response);
        var index = $scope.lists.indexOf(inputList);
        $scope.lists.splice(index, 1);
      });
    };

    // $scope.makePublic = function(inputList) {
    //   console.log(inputList.public);
    //   inputList.public = !inputList.public;
    // };

    window.$scope = $scope;

  }]);

})();